class BarsController < ApplicationController
  respond_to :json

  def index
    if login?
      respond_with ["hoge"]
    else
      oauth
    end
  end

  def show
  end

  def create
  end
end
