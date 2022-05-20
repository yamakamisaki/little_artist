FactoryBot.define do
  factory :user do
    name                  { Faker::Name.initials(number: 10) }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    profile               { '○○ママです。よろしくお願いします。' }
    image                 { Rack::Test::UploadedFile.new(File.join(Rails.root, 'public/images/test_image.png')) }
  end
end