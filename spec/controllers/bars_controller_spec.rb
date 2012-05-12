# -*- coding: utf-8 -*-
require 'spec_helper'

describe BarsController do
  describe  "GET /bars" do
    context "ログインしている" do
      it do
        get :index
        response.should be_success
      end
    end
  end
end
