class Anime < ApplicationRecord
  mount_uploader :img1, Img1Uploader
  mount_uploader :img2, Img2Uploader
  
  validates :title1, presence: true
  validates :title2, presence: true
  validates :img1, presence: true
  validates :company, presence: true
  validates :category, presence: true
  validates :season, presence: true
  validates :pickup, presence: true
  
  def self.search(keyword)
    where(["title1 like? OR title2 like?", "%#{keyword}%", "%#{keyword}%"])
  end

end
