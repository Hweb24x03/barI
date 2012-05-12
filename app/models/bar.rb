class Bar < ActiveRecord::Base
  has_many :going_bars
  has_many :matches, through: :going_bars, source: :user
  has_many :goes, through: :will_bars

  def match_num(user)
    sum = 0
    self.matches.find_each do |u|
      next if u == user
      if u.topics.any? { |t| u.topics.include? t }
        sum += 1
      end
    end
    sum
  end

  def today_num
    1
  end

  def topic_rate(user)
    topics = []
    self.matches.find_each do |u|
      next if u == user
      topics = topics | u.topics
    end
    ((topics.count.to_f/user.topics.count) * 100).to_i
  end
end
