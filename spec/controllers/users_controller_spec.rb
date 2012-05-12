# -*- coding: utf-8 -*-
require 'spec_helper'

describe UsersController do
  describe "GET sign_in" do
    context "ユーザ登録していない" do
      it "認証に失敗する"
    end

    context "ユーザ登録している" do
      it "認証する" do
        pass = "hoge"
        user = FactoryGirl.create :user, password: pass, name: "user1"
        get :sign_in, user_id: user.id, password: pass, user_id: "user1"
        response.should be_success
      end
    end
  end

  describe "POST create" do
    it "ユーザの作成に成功する" do
      params = {
        nickname: "ニック",
        user_id: "mogu",
        password: "mogumogu",
        sex: 1,
        age: 1,
        pref_code: 10,
        interests: "サッカー,コンピュータ"
      }
      post :create, params
      response.should be_success
    end

    it "ユーザの作成に失敗する"
  end
end
