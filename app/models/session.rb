class Session < ActiveRecord::Base
  belongs_to :user

  def self.create_session(user)
    session = Session.new
    session.user_id = user.id
    session.key = Digest::SHA1.hexdigest(Time.now.to_s + user.nickname)
    session.save
    session
  end
end
