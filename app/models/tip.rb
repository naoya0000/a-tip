class Tip < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true
  validates :company, presence: true
  validates :money, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300 }
end
