# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :session do
    user ""
    key "MyString"
  end
end
