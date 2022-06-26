class Tip < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :title, presence: true
  validates :company, presence: true
  validates :money, presence: true, numericality: { greater_than_or_equal_to: 300 }
end
