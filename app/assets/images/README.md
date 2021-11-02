First of all make sure you've created a rails app

```bash
rails new APP_NAME
```

## Setup

Add Ubisoft's images:

```
rm -rf app/assets/images
curl -L https://github.com/ubi-legal-innovation-team/rails-images/archive/master.zip > images.zip
unzip images.zip -d app/assets && rm images.zip && mv app/assets/rails-images-master app/assets/images
```


**On Ubuntu/Windows**: if the `unzip` command returns an error, please install it first by running `sudo apt install unzip`.

## Ruby

Make sure you add the following code to your helpers :

```ruby
# helpers/application_helper.rb
module ApplicationHelper

  # [...]

  def svg(name)
    file_path = "#{Rails.root}/app/assets/images/svg/#{name}.svg"
    if File.exists?(file_path)
      File.read(file_path).html_safe
    else
      '(not found)'
    end
  end
end
```
