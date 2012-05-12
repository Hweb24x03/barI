# -*- coding: utf-8 -*-
require 'spec_helper'

describe BarsController do
  describe  "GET /bars" do
    context "ログインしている" do
      it do
        session = FactoryGirl.create :session
        get :index, { session: session.key }
        response.status.should == 200
      end
    end
  end

  describe  "POST /bars" do
    context "行きたい店が登録できる" do
      it do
        session = FactoryGirl.create :session
        FactoryGirl.create :bar, shop_id: 'hoge'
        post :add_going, { id: 'hoge', session: session.key }
        session.user.bars.size.should == 1
        post :add_going, { id: 'hoge', session: session.key }
        session.user.bars.size.should == 1
      end
    end
  end
end
