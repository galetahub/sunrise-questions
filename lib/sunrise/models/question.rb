# encoding: utf-8
module Sunrise
  module Models
    module Question
      def self.included(base)
        base.send :include, InstanceMethods
        base.send :extend,  ClassMethods
      end
      
      module ClassMethods
        def self.extended(base)
          base.class_eval do
            belongs_to :structure
            
            validates_presence_of :title, :content
            validates_numericality_of :sort_order, :only_integer => true, :allow_nil => true
	          
	          scope :sortable, order("#{quoted_table_name}.sort_order DESC")
	          scope :recently, order("#{quoted_table_name}.created_at DESC")
	          scope :visible, where(:is_visible => true)
          end
        end
      end
      
      module InstanceMethods
      
        def content_without_html
          return nil if self.content.blank?
          self.content.no_html
        end
      end
    end
  end
end
