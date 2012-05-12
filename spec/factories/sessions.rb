# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :session do
    key "session_key"
    association :user, factory: :user
  end
end
