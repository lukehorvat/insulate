# Insulate

*"Page-specific JavaScript".*

Easily partition your JavaScript code based on controller actions. Works great with Rails' asset pipeline default configuration (i.e. all JavaScript concatenated into one huge application.js file).

This gem is a fork of [Paloma](https://github.com/kbparagua/paloma), an excellent and much more comprehensive page-specific JavaScript solution. What does it do differently? Basically, I've just removed a lot of the shiny features and fluff in order to provide something that is extremely simple, compact, and *just works*. Think of it as Paloma Lite.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'insulate'
```

And then execute:

```bash
$ bundle install
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
