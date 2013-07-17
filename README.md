# Insulate

*"Page-specific JavaScript and CSS".*

Easily partition your JavaScript and CSS based on controller actions. Works great with Rails' default asset pipeline configuration (i.e. all JavaScript and CSS concatenated into their respective files).

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
.insulate-page-studies-index h1
{
  color: red;
}

.insulate-page-studies-index p
{
  color: blue;
}
```

LESS example:

```less
.insulate-page-studies-index
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
