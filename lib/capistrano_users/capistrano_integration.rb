require 'capistrano'
require 'pry'

module CapistranoUsers
  class CapistranoIntegration
    TASKS = [
      'users:groups',
      'users:add_to_group',
      'users:remove_from_group',
      'users:add_to_admin_group',
      'users:remove_from_admin_group'
    ]

    def self.load_into(capistrano_config)
      capistrano_config.load do

        # Fetches groups that deploy user belongs to
        #
        def groups_command
          "groups #{user}"
        end

        def add_to_group_command to_group
          "#{try_sudo} usermod -a -G #{to_group} #{user}"
        end

        def remove_from_group_command from_group
          "#{try_sudo} deluser #{user} #{from_group}"
        end

        namespace :users do
          desc "Get groups that deploy user belongs to"
          task :groups do
            run groups_command
          end

          desc "Add user to group, 'cap users:add_to_group GROUP=developers'."
          task :add_to_group do
            if ENV['GROUP']
              run add_to_group_command(ENV['GROUP'])
              run "id #{user}"
            else
              raise "Usage: 'cap users:add_to_group GROUP=developers'"
            end
          end

          desc "Remove user from group, 'cap users:remove_from_group GROUP=developers'"
          task :remove_from_group do
            if ENV['GROUP']
              run remove_from_group_command(ENV['GROUP'])
              run "id #{user}"
            else
              raise "Usage: 'cap users:remove_from_group_command GROUP=developers'"
            end
          end

        end
      end
    end
  end
end

if Capistrano::Configuration.instance
  CapistranoUsers::CapistranoIntegration.load_into(Capistrano::Configuration.instance)
end
