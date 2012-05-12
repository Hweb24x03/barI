# -*- coding: utf-8 -*-
# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    nickname "ニックネーム1"
    name "hogeuser"
    password "hogepass"
    sex 1
    age 1
    pref_code 10
  end
end
