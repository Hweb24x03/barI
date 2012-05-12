class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  def login?
    return @current_user if @current_user
    key = params[:session]
    session = Session.find_by_key key
    if session
      @current_user = User.find_by_id session.user_id
    else
      nil
    end
  end

end
