class Pet < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many_attached :photos
  validates :category, inclusion: { in: %w(categorie1 categorie2 categorie3 modifier_dans_pet.rb),
    message: "%{value} is not a valid category" }
  validates :specie, inclusion: {in: %w(espece1 espece2 espece3 modifier_dans_pet.rb),
    message: "%{value} is not a valid specie"}
end
