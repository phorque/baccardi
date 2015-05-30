source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.6'

gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

group :production do
  gem "ngannotate-rails"
  gem 'rails_12factor'
end

group :development do
  gem "fabrication"
  gem "better_errors"
  gem "pry"
  gem "ffaker"
end

gem 'active_model_serializers'
gem 'inherited_resources'
gem 'pundit'
gem 'slim'
gem 'figaro'
gem 'httpclient'
gem 'jwt'

gem 'angular-rails-templates'


source 'https://rails-assets.org' do
  gem 'rails-assets-satellizer'
  gem 'rails-assets-angular', "~> 1.3.15"
  gem 'rails-assets-angular-translate'
  gem 'rails-assets-angular-ui-router'
  gem 'rails-assets-restangular'
  gem 'rails-assets-angular-material'
  gem 'rails-assets-angular-animate'
  gem 'rails-assets-angular-aria'
  gem 'rails-assets-underscore'
  gem 'rails-assets-angular-moment'
  gem 'rails-assets-ng-currency'
end
