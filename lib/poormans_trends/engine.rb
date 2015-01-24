require "slim"
require "sass-rails"
require "bootstrap-sass"
require "font-awesome-sass"
require "highcharts-rails"

module PoormansTrends
  class Engine < ::Rails::Engine
    isolate_namespace PoormansTrends
  end
end
