require 'spec_helper'

describe Session do
  it ".create_session" do
    pending
    user = FactoryGirl.create :user
    proc { Session.create_session(user) }.should_not raise_error
  end
end
