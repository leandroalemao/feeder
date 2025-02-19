source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.0'

group :development do
  gem 'brakeman', '~> 4.3', '>= 4.3.1', require: false
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'method_source', '~> 0.9.2'
  gem 'reek', '~> 5.4'
  gem 'rubocop', '~> 0.72.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :development, :test do
  gem 'awesome_print', '~> 1.8'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'database_cleaner', '~> 1.5', '>= 1.5.3'
  gem 'factory_bot_rails', '~> 4.8', '>= 4.8.2'
  gem 'guard', '~> 2.15'
  gem 'guard-minitest', '~> 2.4', '>= 2.4.6', require: false
  gem 'minitest-rails', '~> 6.0'
  gem 'minitest-reporters', '~> 1.3', '>= 1.3.8'
  gem 'mocha', '~> 1.9'
  gem 'pry-rails', '~> 0.3.4'
  gem 'simplecov', '~> 0.17'

  # TODO: Drop this after migrating to Rails 6
  # Rails 6 have native support for multienv credentials
  gem 'rails-env-credentials', '~> 0.1.3'
end

# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'active_model_serializers', '~> 0.10.9'
gem 'addressable', '~> 2.5', '>= 2.5.2'
gem 'annotate', '~> 2.7', '>= 2.7.4'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'callee', '~> 0.2.1'
gem 'daemons', '~> 1.3', '>= 1.3.1'
gem 'delayed_job_active_record', '~> 4.1', '>= 4.1.1'
gem 'dry-initializer', '~> 3.0'
gem 'dry-monads', '~> 1.2'
gem 'dry-types', '~> 0.13.2'
gem 'dry-validation', '~> 0.12.2'
gem 'enu', '~> 0.1.2'
gem 'feedjira', '~> 2.2'
gem 'js-routes', '~> 1.4', '>= 1.4.6'
gem 'lograge', '~> 0.3.6'
gem 'marginalia', '~> 1.5'
gem 'nokogiri', '~> 1.10'
gem 'pg', '~> 1.1', '>= 1.1.3'
gem 'rack-cors', '~> 1.0', '>= 1.0.2', require: 'rack/cors'
gem 'rest-client', '~> 2.0'
gem 'twitter', '~> 6.2'
gem 'webpacker', '~> 4.0', '>= 4.0.2'
