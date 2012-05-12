require "spec_helper"

describe Barnavi do
  it ".search" do
    Barnavi.new.search.should == "hoge"
  end
end
