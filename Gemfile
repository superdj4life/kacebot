# Update this Gemfile with any additional dependencies and run
# 'bundle install' to get them all installed. Daemon-kit's capistrano
# deployment will ensure that the bundle required by your daemon is properly
# installed.
#
# For more information on bundler, please visit http://gembundler.com

source 'https://rubygems.org'

# Live on the edge instead: gem 'daemon-kit', :github => 'kennethkalmer/daemon-kit'
gem 'daemon-kit'

#
# safely (http://github.com/kennethkalmer/safely)
#

gem 'safely' # Optional, but recommended.

# gem 'toadhopper' # For reporting exceptions to hoptoad
# gem 'mail' # For reporting exceptions via mail

group :development, :test do
  gem 'rake'
  gem 'rspec' 
end

gem 'slack-api', '~> 1.1.6', require: 'slack'
