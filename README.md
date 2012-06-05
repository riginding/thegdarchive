## The GD Studio VOD Archive
The GD Studio VOD Archive is a Ruby on Rails 3.1 application which runs on Ruby 1.9.2 and
[PostgreSQL](http://www.postgresql.org) databases.

### Setting Up For Development 

1. Fork the GitHub repository: <http://github.com/riginding/thegdarchive>
2. Clone the fork to your computer
3. If you don't already have bundler installed, get it by running `gem install bundler`
4. Run `bundle install` to install all of the project's dependencies
5. Setup your postgres configuration in config/database.yml
6. Finally, run `rake setup` to create the required config files, create the database, and seed it with data
