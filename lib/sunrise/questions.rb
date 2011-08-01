# encoding: utf-8
module Sunrise  
  module Questions
    # Default way to setup Sunrise.
    def self.setup
      yield self
    end
  end
end

require 'sunrise/questions/version'
require 'sunrise/questions/engine'
