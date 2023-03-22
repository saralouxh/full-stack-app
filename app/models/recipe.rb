class Recipe < ApplicationRecord
  # associations
  belongs_to :user

  # validations
  validates :name, :content, presence: true
end
