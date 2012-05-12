class User < ActiveRecord::Base
  has_many :topiccings
  has_many :topics, through: :topiccings
  has_many :bars, through: :going_bars

  def self.hash(pass)
    salt = PASSWORD_SALT
    Digest::SHA1.hexdigest(salt+pass+"bt")
  end

  def password=(password)
    self.hashed_password = User.hash(password)
  end

  def interests=(interests)
    require 'csv'
    interests = CSV.parse(interests)[0]
    interests.map do |interest|
      topic = Topic.find_by_name(interest) || Topic.create(name: interest)
      self.topics << topic
    end
  end

end
