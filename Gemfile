source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.4'
gem 'devise'
gem 'therubyracer'
gem "twitter-bootstrap-rails"
gem 'less-rails' # For twitter bootstrap
gem 'email_validator' # validate email format
gem "kaminari" # customizable and sophisticated paginator 

group :production do
  gem "pg"
  gem 'rails_12factor' #heroku deployment needs this
  gem 'thin'
  gem 'sprockets-rails' # automatically compile your assets so you don't have to
end

# Use sqlite3 as the database for Active Record
group :development do
  gem 'sqlite3'
  gem 'better_errors'
end

group :test do 
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'capybara'
  gem 'shoulda'
  gem 'debugger'
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.2'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

ruby "2.0.0"
