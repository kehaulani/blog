require 'rails_helper'

describe Post do
  it "should have a valid factory" do
  	FactoryGirl.build(:post).should be_valid
  end

  it "is invalid without a title" do
    post = FactoryGirl.build :post, title: ""

    post.should_not be_valid
    post.errors[:title].first.should == "can't be blank"
  end
 end
