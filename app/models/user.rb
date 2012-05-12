class User < ActiveRecord::Base
  def self.hash(pass)
    salt = PASSWORD_SALT
    Digest::SHA1.hexdigest(salt+pass+"bt")
  end

  def password=(password)
    self.hashed_password = User.hash(password)
  end
end
