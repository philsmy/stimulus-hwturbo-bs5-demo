## Rails Contractometer

## Rails & Continuous Integration


## What is continuous integration anyway?
Essentially, you check your code into a central repository (i.e. Github) and automated building is done to see if your code can run, and tests are automatically run to see if your code passes. It should ensure that the code in the repository passes.

But Rails isn't compiled! In the case of Rails, CI SHOULD help spot syntax errors (that often get missed on dev machines as there is no pre-check) and also make sure that assets and so on are present.

Personally, I do not think that CI makes developers more productive - it shifts some responsibility. What it does do is change your mindset, kind of forcing you to think about making sure all tests pass (and running the tests, which a lot of developers don't do!).

Right off the bat, let's say that there are multiple ways and services to do what I will do in this video! I will use Travis with code on Github.

Remove crap from Gemfile you don't need (like that Windows thing)

add development/test like this:

```
group :development, :test do
  gem 'byebug'
  gem 'cucumber-rails', require: false
  gem 'coveralls', require: false
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
end
```

`cucumber-rails` adds in `Cucumber` support. See the Cucumber site for info.

`factory bot`, `shoulda` and `rspec` are for rspec tests

`coveralls` is code coverage

add to `application.rb`

```
config.generators do |generate|
  generate.helper false
  generate.assets false
  generate.view_specs false
  generate.helper_specs false
  generate.routing_specs false
  generate.controller_specs false
end
```

and remove

```
config.generators.system_tests = nil
```

Run `bundle`

Install `rspec`

`bundle exec rails g rspec:install`

and install Cucumber

`bundle exec rails g cucumber:install`

Add Database Cleaner to `rails_helper` inside the `RSpec.configure` block

```
config.before(:suite) do
  DatabaseCleaner.strategy = :transaction
  DatabaseCleaner.clean_with(:truncation)
end
config.around(:each) do |example|
  DatabaseCleaner.cleaning do
    example.run
  end
end
```

and add this _outside_ the RSpec block

```
Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
```

Sign up for Travis and https://travis-ci.com

Add Repo to Travis

Create a `.travis.yml` file at the project root:

```
language: ruby
rvm:
  - 2.7.2
before_script:
  - bundle exec rake db:create --all
  - bundle exec rake db:migrate
script:
  - bundle exec rake ci:tests
services:
  - postgresql
notifications:
  email: false
```

(Obviously set the right ruby version!)

#Coveralls

in `spec_helper.rb` and `env.rb`

```
require 'coveralls'
Coveralls.wear!
```

Create a file named `.simplecov` in root folder to bundle test coverage.

add

```
SimpleCov.start 'rails'
```

Write tests

Check test

Push to Github

Look in Travis
