class Trading < ApplicationRecord
  belongs_to :item
  belongs_to :buyer, class_name: 'User'

  validates :status, presence: true
end
