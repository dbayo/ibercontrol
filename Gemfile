ruby '2.0.0'
source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

gem 'geocomplete_rails'

gem 'rest-client', '1.6.0'
gem 'rake', '10.4.2'

gem 'multi_xml', '0.5.5'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
group :doc do
  gem 'sdoc', '~> 0.4.0'
end
platforms :jruby, :mingw, :mswin do
  gem 'tzinfo-data'
end

gem "mongoid", "~> 4.0.0"
gem "twitter-bootstrap-rails"
gem 'less-rails'

gem 'bootstrap-generators', '~> 3.3.1'
gem 'bootstrap-sass', '3.2.0.2'

gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.15.35'

gem 'font-awesome-rails'

gem 'haml-rails'

gem "breadcrumbs_on_rails"

gem 'kaminari-bootstrap', '~> 3.0.1'

gem "mongoid-paperclip", :require => "mongoid_paperclip"
gem 'aws-sdk', '~> 1.3.4'

gem 'carrierwave'
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'
gem 'mongoid-grid_fs', github: 'ahoward/mongoid-grid_fs'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'nokogiri'
gem 'better_errors'
gem 'byebug'
gem 'database_cleaner'

gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'

gem 'prawn-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'rspec-rails'
end

group :test do
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', platforms: :ruby
  # gem 'rspec-its'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'mongoid-rspec', '~> 2.0.0'
  gem 'capybara'
  gem 'poltergeist'
  gem 'phantomjs', require: 'phantomjs/poltergeist'
  gem 'selenium-webdriver'
  gem 'shoulda'
  gem 'simplecov', :require => false
end
