class Question < ActiveRecord::Base
  include Sunrise::Models::Question
  
  attr_accessible :content, :title, :is_visible
end
