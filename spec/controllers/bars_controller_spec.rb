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
end
