class Bar < ActiveRecord::Base
  has_many :matches, through: :going_bars

  def match_num
    self.users.count - 1
  end

  def today_num
    1
  end

  def topic_rate
    100
  end
end
