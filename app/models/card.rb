class Card < ActiveRecord::Base
  validates :first_name, :last_name, :gender, presence: true

  enum gender: { male: 0, female: 1 }
end
