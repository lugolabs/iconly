# Iconly
Ruby on Rails 5 engine that stores SVG and generate your web font icons.

### Installation

Iconly uses [Fontcustom](https://github.com/FontCustom/fontcustom), so you need to have that and FontForge installed as per their [instructions](https://github.com/FontCustom/fontcustom).

Once Fontcustom is installed, add this line to your application's Gemfile:

```ruby
gem 'iconly', github: 'lugolabs/iconly'
```

And then execute:
```bash
$ bundle
```

### Usage

Iconly needs a few options setup to get working. Add these to a `config/initializers/iconly.rb` file:

- `login_path` - Iconly does not provide user authentication, allowing you to include the authentication method of your choice. The `login_path` should point at your Login page
- `logout_path` - your logout page, should respond to `DELETE` HTTP method
- `svg_folder` - the public folder where the SVG files will be stored.
- `downloads_folder` - the folder that will store the generated fonts

E.g.:

```ruby
Iconly.logout_path      = '/logout'
Iconly.login_path       = '/login'
Iconly.svg_folder       = 'test/dummy/public'
Iconly.downloads_folder = Rails.root.join('tmp/downloads').to_s
```


#### Database

Iconly uses PostgreSQL as its backend database, and installs `pg` gem. It creates a few tables to store SVG metadata, and a `users` table for ownerships.

To start, copy the Iconly migrations to your database:

```bash
bin/rails iconly:install:migrations
```

and run them:

```bash
bin/rails db:migrate SCOPE=iconly
```

#### Front end

Iconly app uses *Turbolinks*, and *Bootstrap 4* for its interface.

#### Example

Check the [Dummy](https://github.com/lugolabs/iconly/tree/master/test/dummy) application for a working example.

Create, migrate, and seed the database:

```bash
bin/rails db:create
bin/rails db:migrate
bin/rails db:seed
```

This will create a sample user to get you started.

Start the Rails app in `test/dummy` folder.

### License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
