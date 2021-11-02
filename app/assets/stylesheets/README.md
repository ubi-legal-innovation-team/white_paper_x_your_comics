First of all make sure you've created a rails app

```bash
rails new APP_NAME
```

## Setup

Ensure you have these dependencies

```bash
yarn add jquery popper.js
```

Ensure you have the following gems in your Rails `Gemfile`

```ruby
# Gemfile
gem 'autoprefixer-rails'
gem 'font-awesome-sass'
```

In your terminal, generate SimpleForm Bootstrap config.

```bash
bundle install
rails generate simple_form:install
```

Then replace Rails' stylesheets by Le Wagon's stylesheets:

```
rm -rf app/assets/stylesheets
curl -L https://github.com/ubi-legal-innovation-team/rails-stylesheets/archive/master.zip > stylesheets.zip
unzip stylesheets.zip -d app/assets && rm stylesheets.zip && mv app/assets/rails-stylesheets-master app/assets/stylesheets
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

```scss
// app/assets/stylesheets/application.scss

// External libraries

@import "font-awesome-sprockets";
@import "font-awesome";

// Config

@import "config/colors";
@import "config/fonts";

// Components

@import "components/buttons";
@import "components/cards";
@import "components/carousel";
@import "components/dropdowns";
@import "components/flashes";
@import "components/footer";
@import "components/forms";
@import "components/lists";
@import "components/loaders";
@import "components/modals";
@import "components/navbar";
@import "components/overlays";
@import "components/pop_ups";
@import "components/tables";
@import "components/webkit_scrollbar";

// Helpers

@import "helpers/backgrounds";
@import "helpers/borders";
@import "helpers/box_dimensions";
@import "helpers/box_shadows";
@import "helpers/dimensions";
@import "helpers/flex_box";
@import "helpers/global";
@import "helpers/positions";
@import "helpers/sections";
@import "helpers/text";

// Pages

@import "pages/home";

// Responsive

@import "responsive/carousel";
@import "responsive/flashes";
@import "responsive/footer";
@import "responsive/modals";
@import "responsive/navbar";
@import "responsive/sections";
```
