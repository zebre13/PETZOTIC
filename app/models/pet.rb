class Pet < ApplicationRecord
  CATEGORIES = %w(categorie1 categorie2 categorie3 modifier_dans_pet.rb)
  SPECIES = %w(specie1 specie2 specie3 modifier_dans_pet.rb)
  belongs_to :user, dependent: :destroy
  has_many_attached :photos


  validates :name, presence: true, uniqueness: true
  validates :specie, presence: true, inclusion: { in: SPECIES,
    message: "%{value} is not a valid specie" }
  validates :category, inclusion: { in: CATEGORIES,
    message: "%{value} is not a valid category" }
end
