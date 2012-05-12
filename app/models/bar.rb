class Bar < ActiveRecord::Base
  has_many :going_bars
  has_many :matches, through: :going_bars, source: :user
  has_many :goes, through: :will_bars

  def match_num(user)
    sum = -1
    self.matches.each do |u|
      if u.topics.any? { |t| u.topics.include? t }
        sum += 1
      end
    end
    sum
  end

  def today_num
    1
  end

  def topic_rate
    100
  end
end
