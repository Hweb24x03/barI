# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bar, :class => 'Bar' do
    shop_id "MyString"
    json "MyText"
  end
end
