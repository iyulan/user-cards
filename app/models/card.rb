class Card < ActiveRecord::Base
  validates :first_name, :last_name, :gender, presence: true

  enum gender: { male: 0, female: 1 }

  belongs_to :photo

  def full_name
    "#{first_name} #{last_name} (gender: #{gender})"
  end

  def as_json(options = {})
    json = super.merge(full_name: full_name)
    json.merge(photo.as_json.slice('image')) if photo
  end
end
