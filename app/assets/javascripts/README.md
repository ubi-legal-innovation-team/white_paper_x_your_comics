First of all make sure you've created a rails app

```bash
rails new APP_NAME
```

## Setup

Ensure you have the following gems in your Rails `Gemfile`

```ruby
# Gemfile
gem 'autoprefixer-rails'
gem 'uglifier'
gem 'jquery-rails'
```

Then replace Rails' javascripts by Ubi Innovation Team's javascripts:

```
rm -rf app/assets/javascripts
curl -L https://github.com/ubi-legal-innovation-team/rails-javascripts/archive/master.zip > javascripts.zip
unzip javascripts.zip -d app/assets && rm javascripts.zip && mv app/assets/rails-javascripts-master app/assets/javascripts
```


**On Ubuntu/Windows**: if the `unzip` command returns an error, please install it first by running `sudo apt install unzip`.

And the viewport in the layout

```html
<!-- app/views/layouts/application.html.erb -->
<head>
  <!-- Add these line for detecting device width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

  <!-- [...] -->
</head>
```

## JS

Make sure you change the webpack config with the following code to include jQuery & Popper in webpack:

```js
// config/webpack/environment.js
const { environment } = require('@rails/webpacker')

// Bootstrap 4 has a dependency over jQuery & Popper.js:
const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    Popper: ['popper.js', 'default']
  })
)

module.exports = environment
```
