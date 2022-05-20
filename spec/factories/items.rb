FactoryBot.define do
  factory :item do
    age      { 1 }
    text     { Faker::Lorem.sentence }
    material { Faker::Lorem.sentence }
    making   { Faker::Lorem.sentence }
    association :user 


    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
