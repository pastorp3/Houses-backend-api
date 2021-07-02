class House < ApplicationRecord
  belongs_to :user

  validates_presence_of :title, :address, :rent_price, :description, :user_id
  validates_uniqueness_of :address

  after_initialize :init

  def init
    self.raiting ||= 0
    self.reviews ||= 0
  end
end
