# CapistranoUsers

Recipies allow to manage groups of deploy user.

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano_users'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano_users

## Usage

The following tasks are supported:

```
cap users:add_to_group          # Add user to group, 'cap users:add_to_group GROUP=developers'.
cap users:groups                # Get groups that deploy user belongs to
cap users:remove_from_group     # Remove user from group, 'cap users:remove_from_group GROUP=developers'
```