# -*- coding: utf-8 -*-
require 'spec_helper'

describe Bar do
  context "行きたい店が登録されている" do
    before :each do
      @bar = FactoryGirl.create :bar
      @user = FactoryGirl.create :user, interests: "英語,数学"
      @bar.matches << @user
      u = FactoryGirl.create :user, nickname: "hoge", interests: "英語"
      @bar.matches << u
    end

    subject { @bar }
    it "#match_num" do
      subject.match_num(@user).should == 1
    end

    it "#today_num" do
      subject.today_num.should == 1
    end

    it "#topic_rate" do
      subject.topic_rate.should == 100
    end
  end
end
