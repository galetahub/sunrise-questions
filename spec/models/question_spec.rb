require 'spec_helper'

describe Question do
  before(:all) do
    @structure = FactoryGirl.create(:structure_page)
    @question = Question.new(:title => 'Test', :content => 'Test')
    @question.structure = @structure
  end
  
  it "should create a new instance given valid attributes" do
    @question.save!
  end
    
  context "validations" do
    it "should not be valid with invalid title" do
      @question.title = nil
      @question.should_not be_valid
    end
    
    it "should not be valid with invalid content" do
      @question.content = nil
      @question.should_not be_valid
    end
    
    it "should not be valid with invalid sort_order" do
      @question.sort_order = 'wrong'
      @question.should_not be_valid
    end
  end
end
