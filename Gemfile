source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.2.4.2'
# Use postgresql as the database for Active Record
gem 'pg', '1.1.4'
# Use Puma as the app server
gem 'puma', '3.12.4'
# Use SCSS for stylesheets
gem 'sass-rails', '5.0.7'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '4.1.20'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '5.2.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '2.8.0'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '1.4.3', require: false
# Flexible authentication solution for Rails with Warden
gem 'devise', '4.7.1'
# Upload images to Amazon S3
gem 'aws-sdk-s3', '1.36.1'
gem 'shrine', '2.16.0'
gem 'figaro', '1.1.1'
# A micro library providing Ruby objects with Publish-Subscribe capabilities
gem 'wisper', '2.0.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', '11.0.1', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'bullet', '6.0.0'
  gem 'faker', '1.9.3'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '3.1.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '2.0.2'
  gem 'spring-watcher-listen', '2.0.1'
  # Advanced seed data handling for Rails, combining the best practices of several methods together.
  gem 'seed-fu', '2.3.9'
  gem 'web-console', '3.7.0'

  # Profiler for your development and production Ruby rack apps.
  gem 'rack-mini-profiler', '1.1.6', require: false
  # For memory profiling
  gem 'memory_profiler', '0.9.10'
  # For call-stack profiling flamegraphs
  gem 'flamegraph', '0.9.5'
  gem 'stackprof', '0.2.11'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '3.18.0'
  gem 'selenium-webdriver', '3.141.5926'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper', '2.1.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
