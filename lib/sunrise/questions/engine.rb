require 'rails'
require 'sunrise-questions'

module Sunrise
  module Questions
    class Engine < ::Rails::Engine
      config.before_initialize do
        Sunrise::Plugin.register :questions do |plugin|
          plugin.model = 'sunrise/models/question'
          plugin.menu = false
          plugin.version = Sunrise::Questions::VERSION.dup
        end
        
        Sunrise::Plugins.activate(:questions)
      end
    end
  end
end
