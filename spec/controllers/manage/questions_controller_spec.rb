require 'spec_helper'

describe Manage::QuestionsController do
  render_views
  
  before(:all) do
    @structure = FactoryGirl.create(:structure_page)
  end
  
  context "administrator" do
    login_admin
    
    it "should render new action" do
      get :new, :structure_id => @structure.id
      response.should be_success
      response.should render_template("new")
    end
    
    it "should create new structure" do
      lambda {
        post :create, :structure_id => @structure.id, :question => FactoryGirl.attributes_for(:question)
      }.should change { @structure.questions.count }.by(1)
    end
        
    context "exists question" do
      before(:each) do
        @question = FactoryGirl.create(:question, :structure => @structure)
      end
      
      it "should render index action" do
        get :index, :structure_id => @structure.id
        assigns(:structure).should == @structure
        assigns(:questions).should include(@question)
        response.should render_template('index')
      end
      
      it "should render edit action" do
        controller.should_receive :edit
        get :edit, :structure_id => @structure.id, :id => @question.id
      end
      
      it "should update structure" do
        put :update, :structure_id => @structure.id, :id => @question.id, :question => { :title => "Update" }
        assigns(:question).should be_valid
        assigns(:question).title.should == 'Update'
        response.should redirect_to(manage_structure_questions_path(@structure.id))
      end
      
      it "should destroy user" do
        lambda {
          delete :destroy, :structure_id => @structure.id, :id => @question.id
        }.should change { @structure.questions.count }.by(-1)
      end
    end
  end
  
  context "anonymous user" do
    user_logout
    
    it "should not render index action" do
      controller.should_not_receive :index
      get :index, :structure_id => @structure.id
    end
    
    it "should not render new action" do
      controller.should_not_receive :new
      get :new, :structure_id => @structure.id
    end
    
    it "should not render create action" do
      controller.should_not_receive :create
      post :create, :structure_id => @structure.id
    end
    
    context "with exists structure" do
      before(:each) do
        @question = FactoryGirl.create(:question, :structure => @structure)
      end
      
      it "should not render edit action" do
        controller.should_not_receive :edit
        get :edit, :structure_id => @structure.id, :id => @question.id
      end
      
      it "should not render update action" do
        controller.should_not_receive :update
        put :update, :structure_id => @structure.id, :id => @question.id
      end
      
      it "should not render destroy action" do
        controller.should_not_receive :destroy
        delete :destroy, :structure_id => @structure.id, :id => @question.id
      end
    end
  end
end
