class SunriseCreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.integer :structure_id
      t.string :title, :null => false
      t.text :content
      
      t.boolean :is_visible, :default => true
      t.integer :sort_order, :default => 0
      
      t.timestamps
    end
    
    add_index :questions, :structure_id
  end

  def self.down
    drop_table :questions
  end
end
