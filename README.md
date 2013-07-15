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

It's all very simple. Installing this gem automatically injects (at runtime) a global string variable, `INSULATE_PAGE_ID`, into every page served by your app. This string is always in the format `controller#action`, so if you want to conditionally execute some JavaScript code based on the current controller action, just check the value of this variable.

CoffeeScript example:

```coffeescript
if INSULATE_PAGE_ID is 'users#new'
  alert 'Create a new user!'
```

JavaScript example:

```javascript
if (INSULATE_PAGE_ID === 'users#edit') {
  alert('Edit an existing user!');
}
```
