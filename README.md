## Rails Contractometer

```
rails new contractometer -d postgresql --skip-test --skip-bundle --skip-turbolinks
cd contractometer
```

### Add Turbo and Stimulus
```
bundle add turbo-rails
bundle install
rails webpacker:install
rails turbo:install
bundle add stimulus-rails
rails stimulus:install
```

### Add Bootstrap
```
yarn add bootstrap jquery @popperjs/core
import 'bootstrap'
import '../stylesheets/application'
stylesheets/application.scss
@import "~bootstrap/scss/bootstrap";
```
App layout:
```
    <div class='container'>
      <%= yield %>
    </div>
```

### Make our model
```
rails g scaffold time_tracker topic rate_per_hour:numeric started_at:datetime ended_at:datetime status
rails db:create db:migrate

routes.rb
root 'time_trackers#index'
```

### Some niceness

Add to workspace settings:
```
{
  "emmet.includeLanguages": {
    "erb": "html",
    "ruby": "html",
    "html.erb": "html"
  },
}

gem 'rubocop-rails', group: :development, require: false
bundle
```
### Add FontAwesome
```
yarn add @fortawesome/fontawesome-free
import "@fortawesome/fontawesome-free/css/all"
```

### Create
* _time_tracker.html.erb partial
* app/javascript/controllers/timer_controller.js

// in time_tracker.rb
* add hotwire callback
* add current scope
* add running? method
* add duration method
* add before_update for ended_at

// time_trackers_helper
* add duration_display

// in time_trackers_controller
* merge in create
