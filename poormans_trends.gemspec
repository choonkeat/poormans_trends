$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "poormans_trends/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "poormans_trends"
  s.version     = PoormansTrends::VERSION
  s.authors     = ["Chew Choon Keat"]
  s.email       = ["choonkeat@gmail.com"]
  s.homepage    = "http://choonkeat.com"
  s.summary     = "Some numbers from the database"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 4.1.0"
  s.add_dependency "slim-rails"
  s.add_dependency "sass-rails"
  s.add_dependency "bootstrap-sass"
  s.add_dependency "font-awesome-sass"
  s.add_dependency "highcharts-rails"
end
