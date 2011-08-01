require 'spec_helper'

describe Sunrise::Questions::InstallGenerator do
  include GeneratorSpec::TestCase
  destination File.expand_path("../../tmp", __FILE__)
#  arguments %w(something)

  before(:all) do
    prepare_destination
    run_generator
  end

  it "should create migration" do
    assert_migration "db/migrate/sunrise_create_questions.rb" do |migration|
      assert_class_method :up, migration do |up|
        assert_match /create_table/, up
      end
    end
  end
  
  it "should create question model" do
    assert_file "app/models/question.rb"
  end
end
