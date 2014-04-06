# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :admin do
    name "Admin"
    email "admin@songwriterproject.music"
    password "password"
  end
end
