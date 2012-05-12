require "spec_helper"

describe User do
  it ".hash" do
    User.hash("hoge").should == "25c2e12166f3ee5b95f1be13ba8f7a2c38938e37"
  end

  it "#hashed_password" do
    user = FactoryGirl.build :user, password: "hoge"
    user.hashed_password.should == "25c2e12166f3ee5b95f1be13ba8f7a2c38938e37"
  end

  it "#topics" do
    user = FactoryGirl.build :user, interests: "hoge,mogu"
    user.topics.should have(2).items
  end
end
