class Session < ActiveRecord::Base
  belongs_to :user

  def self.create_session(user)
    session = Session.create
    session.key = "hoge"
    session
  end
end
