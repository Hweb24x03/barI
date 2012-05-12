# -*- coding: utf-8 -*-
require 'spec_helper'

describe UsersController do
  describe "GET sign_in" do
    it "認証する" do
      pass = "hoge"
      user = FactoryGirl.create :user, password: pass, name: "user1"
      get :sign_in, user_id: user.id, password: pass, user_id: "user1"
      response.should be_success
    end
  end
end