FactoryGirl.define do
  factory :photo do
    image { Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec', 'support', 'files', 'bart.png')) }
  end
end
