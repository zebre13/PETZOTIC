class Pet < ApplicationRecord
  belongs_to :user, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :species, presence: true
end
