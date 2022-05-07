class Pet < ApplicationRecord
  CATEGORIES = %w(mammal categorie2 categorie3 modifier_dans_pet.rb)
  SPECIES = ['Mi-monkey, mi-man', 'Bengal tiger', 'African gorilla', 'Java Rhinoceros', 'Hirola']
  belongs_to :user
  has_many_attached :photos
  has_many :bookings
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  
  validates :name, presence: true, uniqueness: true
  validates :specie, presence: true, inclusion: { in: SPECIES,
                                                  message: "%{value} is not a valid specie" }
  validates :category, inclusion: { in: CATEGORIES,
                                    message: "%{value} is not a valid category" }
end
