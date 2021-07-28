<!-- README makeareadme.com -->

# ActiveRecord

- [Rake Tasks from Sinatra-ActiveRecord](https://github.com/sinatra-activerecord/sinatra-activerecord)
- [Documentation](https://guides.rubyonrails.org/active_record_basics.html)
- [Convention over Configuration](https://guides.rubyonrails.org/active_record_basics.html#convention-over-configuration-in-active-record)
- [Migrations](https://guides.rubyonrails.org/active_record_basics.html#migrations)
- [Query Methods](https://guides.rubyonrails.org/active_record_querying.html)
- [has_many](https://apidock.com/rails/ActiveRecord/Associations/ClassMethods/has_many)
- [belongs_to](https://apidock.com/rails/ActiveRecord/Associations/ClassMethods/belongs_to)

## GEMFILE

### Generating GEMFILE and adding gems
```
bundle init
bundle add [gem name]
```

### Gems - General Development
- require_all (allows us to require all files in a folder)
- pry

### Gems - ActiveRecord, Database, and Rakefile
- activerecord
- sinatra-activerecord (rake tasks)
- sqlite3 (database... if using heroku you'll use pg - postgres)

### Gems - Rack API
- rack (for http requests)
- rack-cors (for enabling cross-origin resource sharing)
- shotgun (alternative to using rackup command so you don't have to restart server every time you make a change)

## Setting up Environment File

```
mkdir config
touch config/environment.rb
touch config/database.yml
```

### environment.rb
```
require "bundler/setup"
Bundler.require

require "json"
require "rack/cors"
require_all "app"
```

### database.yml
```
development:
  adapter: sqlite3
  database: db/development.sqlite3
  pool: 5
  timeout: 5000
```

## Rakefile

```
touch Rakefile
```

### Rakefile
```
require_relative 'config/environment'
require 'sinatra/activerecord/rake'

desc 'start console'
task :console do
    ActiveRecord::Base.logger = Logger.new(STDOUT)
    Pry.start
end
```

## ActiveRecord Models

- for every table, there should be a cooresponding model

```
mkdir app
mkdir app/models
```

- lets say we have a table called notes...
```
touch app/models/note.rb
```

### note.rb
```
class Note < ActiveRecord::Base
end
```

## Setting up Rack API - config.ru

```
touch config.ru
```

### config.ru
```
require_relative "./config/environment.rb"

# enables cross-origin resource sharing
# this allows any site (note origins '*') to make any request to our API

use Rack::Cors do
  allow do
    origins '*' # can also put like origins 'http://localhost:3001' and only allow that domain to send a request
    resource '/*', headers: :any, methods: [:get, :post, :patch, :put, :delete]
  end
end

# We'll create the Application class

run Application.new
```

## Setting up Routes

```
touch app/application.rb
```

### application.rb
```
class Application
  def call(env)
    response = Rack::Response.new
    request = Rack::Request.new(env)

    # handle all routes and send appropriate responses
  end
end
```