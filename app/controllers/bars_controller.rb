class BarsController < ApplicationController
  respond_to :json

  def index
    respond_with ["hoge"]
  end

  def show
  end

  def create
  end
end
