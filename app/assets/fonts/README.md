First of all make sure you've created a rails app

```bash
rails new APP_NAME
```

## Setup

Add Ubisoft's fonts:

```
rm -rf app/assets/fonts
curl -L https://github.com/ubi-legal-innovation-team/rails-fonts/archive/master.zip > fonts.zip
unzip fonts.zip -d app/assets && rm fonts.zip && mv app/assets/rails-fonts-master app/assets/fonts
```


**On Ubuntu/Windows**: if the `unzip` command returns an error, please install it first by running `sudo apt install unzip`.

## CSS

Make sure you change the css fonts config with the following code :

```css
// assets/stylesheets/config/fonts.scss
@font-face {
   font-family: 'Ubisoft bold';
   src: font-url('UbisoftSans-Bold.ttf');
}

@font-face {
   font-family: 'Ubisoft regular';
   src: font-url('UbisoftSans-Regular.ttf');
}


h1, h2, h3, h4, h5, h6, button, input[type="submit"], strong, .strong {
  font-family: 'Ubisoft bold';
}

span, label, p, a, ul, li, tbody, u, thead, div
input[type="text"],
input[type="radio"],
input[type="checkbox"],
textarea,
select,
.regular {
  font-family: 'Ubisoft regular';
}
```
