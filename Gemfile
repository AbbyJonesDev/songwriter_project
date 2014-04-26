source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.4'

# Use pg as the database for Active Record
gem 'pg'

# Use Figaro to load ENV variables for given environment
gem 'figaro'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'  

# Use Zurb Foundation
gem 'foundation-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Use Paperclip to manage file attachments.  Read more: https://github.com/thoughtbot/paperclip
gem "paperclip", "~> 4.1"

# Use Amazon Web Services S3 storage for file attachments
gem 'aws-sdk'

# Use Devise for Admin and User authentication
gem 'devise'

# Use tinyMCE to add rich text editor for blog posts
gem 'tinymce-rails'



group :development do
  gem 'coffee-rails', '~> 4.0.0'    # Use CoffeeScript for .js.coffee assets and views
end


group :test do
  gem 'mocha'   # For mocks and stubs
  gem 'shoulda'   # For shoulda validations
  gem 'launchy'   # To save and open page when debugging specs
end

group :development, :test do
  gem 'dotenv-rails'  # To manage personal environment variables
  gem 'factory_girl_rails'
  gem 'rspec-rails', '~> 3.0.0.beta'
  gem 'capybara'  # To simulate user interaction with browser
  gem 'capybara-webkit'  # For pages with JavaScript - so they load in real webpage
  gem 'database_cleaner'  # To clean database after capybara-webkit messes it up
  gem 'selenium-webdriver'   # For pages with JavaScript
  gem 'debugger'
end

gem 'rails_12factor', group: :production # To make app work on Heroku

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', :require => false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

