# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :session do
    user "user1"
    key "session_key"
  end
end
