# Insulate [![Gem version](http://img.shields.io/gem/v/insulate.svg?style=flat)](http://rubygems.org/gems/insulate)

*"Page-specific JavaScript and CSS".*

Easily partition your JavaScript and CSS based on controller actions. Works great with Rails' default asset pipeline configuration (i.e. all JavaScript and CSS concatenated into application.js and application.css respectively). Generally recommended only for small Rails applications where you have a direct one-to-one mapping between controller actions and views, and don't mind introducing a little coupling.

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

This gem automatically injects a global JavaScript string variable, `INSULATE_PAGE`, into every page served by your app. This string is always in the format `controller#action`, so if you want to conditionally execute some JavaScript code based on the current controller action, just check the value of this variable.

JavaScript example:

```javascript
if (INSULATE_PAGE == 'users#edit') {
  alert('Edit an existing user!');
}
```

CoffeeScript example:

```coffeescript
if INSULATE_PAGE is 'users#new'
  alert 'Create a new user!'
```

Furthermore, this gem also appends a special CSS class to the `<body>` element of every page. The name of this class changes dynamically based on the current controller action, and is always in the format `insulate-page-controller-action`. So for example, if the controller action is `users#show`, the name of the class will be `insulate-page-users-show`. You can easily segregate your stylesheet markup by targeting this class in CSS selectors.

CSS example:

```css
.insulate-page-users-show h1
{
  color: red;
}

.insulate-page-users-show p
{
  color: blue;
}
```

LESS example:

```less
.insulate-page-users-show
{
  h1
  {
    color: red;
  }

  p
  {
    color: blue;
  }
}
```

## Contributing

My intention with this gem is to keep it as simple and lean as it currently is, so do keep that in mind when submitting pull requests. If you want more advanced functionality, it's worth having a look at [Paloma](https://github.com/kbparagua/paloma), an excellent gem that provides a much more comprehensive page-specific JavaScript solution.
