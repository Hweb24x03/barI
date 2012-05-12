class Topic < ActiveRecord::Base
  has_many :user, through: :tapiccing
end
