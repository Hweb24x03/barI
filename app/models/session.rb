class Session < ActiveRecord::Base
  def self.create_session(user)
    session = Session.create
    session.key = "hoge"
    session
  end
end
