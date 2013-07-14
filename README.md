# Insulate

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'insulate'
```

And then execute:

```bash
$ bundle install
```

Lastly, add the following line to the application.js manifest after `//= require jquery` and before `//= require_tree .`:

```
//= require insulate
```

## Usage

It's all very simple. For every controller action that you want to hook into, just add a callback function to a global `Insulate` object. The key must be a string in the format `controller#action`.

CoffeeScript example:

```coffeescript
Insulate['users#new'] = ->
  alert 'Create a new user!'
```

JavaScript example:

```javascript
Insulate['users#edit'] = function() {
    alert('Edit an existing user!');
};
```

Any callback function you define this way will be executed on jQuery's `$(document).ready()` event (hence why jQuery is a dependency of this gem).
