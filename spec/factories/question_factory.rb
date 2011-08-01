FactoryGirl.define do
  factory :question, :class => Question do
    title "Test"
    content "Test"
    is_visible true
    sort_order 1
    
    association :structure, :factory => :structure_page
  end
end
