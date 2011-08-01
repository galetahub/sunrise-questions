class Structure < ActiveRecord::Base
  include Sunrise::Models::Structure
  
  has_many :questions, :dependent => :delete_all
  has_slug :prepend_id => false
  
  attr_accessible :title, :kind, :position, :parent_id, :redirect_url,
                  :position_type, :slug, :parent, :structure_type, 
                  :header_attributes, :is_visible
  
  def self.find_by_param!(value)
    return if value.blank?
    
    query = scoped
    record = value.to_s.is_int? ? query.where(:id => value.to_i).first : query.where(:slug => value.to_s).first
    record
  end
end
