Booking.destroy_all
Pet.destroy_all
User.destroy_all

boris = { username: 'boris',
          address: 'route de la pyramide, 75012 Paris',
          password: 'petzotic',
          email: 'bourdetboris@gmail.com' }

etienne = { username: 'etienne',
            address: 'avenue daumesnil, 75012 Paris',
            password: 'petzotic',
            email: 'etiennededi@hotmail.fr' }

ghita = { username: 'ghita',
          address: '5 avenue Albert de Mun, 75016 Paris',
          password: 'petzotic',
          email: 'aa.ghita@gmail.com' }

leonor = { username: 'leonor',
           address: '10 rue de paradis, 75010 Paris',
           password: 'petzotic',
           email: 'leonor.varela91330@gmail.com' }

users = [boris, etienne, ghita, leonor]

def seed_users(users)
  photo_boris = File.open(Rails.root.join("public/seed_images/boris.jpg"))
  photo_etienne = File.open(Rails.root.join("public/seed_images/etienne.jpg"))
  photo_ghita = File.open(Rails.root.join("public/seed_images/ghita.jpg"))
  photo_maria = File.open(Rails.root.join("public/seed_images/maria.jpg"))

  photos = [photo_boris, photo_etienne, photo_ghita, photo_maria]

  users.each_with_index do |user, index|
    profil = User.new(user)
    profil.photos.attach(io: photos[index], filename: user, content_type: 'jpg')
    profil.save!
  end
  p 'Seeds Users saved'
end

seed_users(users)

# pets

tarzan = { category: 'mammal',
           name: 'Tarzan',
           address: 'Parc Zoologique de Paris, Avenue Daumesnil, 75012 Paris',
           description: 'Tarzan is not very evolved. He descends from the monkey, the tree and the neighbour, but don\'t hold it against him. Unfortunately, he will not be able to show great subtlety, but will know how to defend your home and your wife, if you have one. If you don\'t have one, pretend to have one and it will make the animal very happy. It can smell a little strong sometimes, but we rent with it a tropical atmosphere mist to delicately embalm your interior.',
           specie: 'Mi-monkey, mi-man',
           user_id: 1,
           price: 300 }

roger = { category: 'mammal',
          name: 'Roger',
          address: '17 Place Vendôme, 75001 Paris',
          description: "Soft and kind as a kitten, roger will go perfectly with your interior. He has a neat coat like the carpet and brown whiskers that will match very well with your curtains whatever their color. He doesn't eat much, at set times, of course. If he bothers you by making too much noise, we even have a small electric collar that will do the job of silence perfectly.",
          specie: 'Bengal tiger',
          user_id: 2,
          price: 435}

jamila = { category: 'mammal',
           name: 'Jamila',
           address: '16 Villa Gaudelet, 75011 Paris',
           description: 'Jamila is so to speak not very present. Not one to look for lice, it blends in with the decor, especially if you have tall trees around your home. She loves making jokes and eating bananas. But she also knows how to iron, do the housework, the dishes,... she really likes to mimic everything you do. If you have children, she can even do their homework. Easy as a monkey.',
           specie: 'African gorilla',
           price: 350,
           user_id: 2}

carlos = { category: 'mammal',
           name: 'Carlos',
           address: '100 Avenue des Champs-Elysées, 75008 Paris',
           description: "Very docile, Carlos will follow you everywhere. Some clutter issues sometimes, but after all it's not the size that counts. However, do not venture to take the metro with him, it could end in tragedy. Taupe gray color, and name rhinoceros, Carlos is an original. Very little talker",
           specie: 'Java Rhinoceros',
           price: 5689,
           user_id: 3}

nala = { category: 'mammal',
         name: 'Nala',
         address: '57 Rue Cuvier, 75005 Paris',
         description: 'Long brown horns, gazelle smile and doe eyes, Nala is present damn well. She will impress your in-laws with her good manners. You can also use its horns as coat racks, bag holders on the go or changing rooms at a party, if it runs out',
         specie: 'Hirola',
         price: 999,
         user_id: 4}
pets = [tarzan, roger, jamila, carlos, nala]

def seed_pets(pets)
  #carlos
  photo_carlos_1 = File.open(Rails.root.join("public/seed_images/carlos_1.jpg"))
  photo_carlos_2 = File.open(Rails.root.join("public/seed_images/carlos_2.jpg"))
  photo_carlos_3 = File.open(Rails.root.join("public/seed_images/carlos_3.jpg"))
  photo_carlos_4 = File.open(Rails.root.join("public/seed_images/carlos_4.jpg"))
  photo_carlos_5 = File.open(Rails.root.join("public/seed_images/carlos_5.jpg"))
  photo_carlos = [photo_carlos_1, photo_carlos_2, photo_carlos_3, photo_carlos_4, photo_carlos_5]

  #jamila
  photo_jamila_1 = File.open(Rails.root.join("public/seed_images/jamila_1.jpg"))
  photo_jamila_2 = File.open(Rails.root.join("public/seed_images/jamila_2.jpg"))
  photo_jamila_3 = File.open(Rails.root.join("public/seed_images/jamila_3.jpg"))
  photo_jamila_4 = File.open(Rails.root.join("public/seed_images/jamila_4.jpg"))
  photo_jamila_5 = File.open(Rails.root.join("public/seed_images/jamila_5.jpg"))
  photo_jamila = [photo_jamila_1, photo_jamila_2, photo_jamila_3, photo_jamila_4, photo_jamila_5]

  #nala
  photo_nala_1 = File.open(Rails.root.join("public/seed_images/nala_1.jpg"))
  photo_nala_2 = File.open(Rails.root.join("public/seed_images/nala_2.jpg"))
  photo_nala_3 = File.open(Rails.root.join("public/seed_images/nala_3.jpg"))
  photo_nala_4 = File.open(Rails.root.join("public/seed_images/nala_4.jpg"))
  photo_nala_5 = File.open(Rails.root.join("public/seed_images/nala_5.jpg"))
  photo_nala = [photo_nala_1, photo_nala_2, photo_nala_3, photo_nala_4, photo_nala_5]

  #tarzan
  photo_tarzan_1 = File.open(Rails.root.join("public/seed_images/tarzan_1.jpg"))
  photo_tarzan_2 = File.open(Rails.root.join("public/seed_images/tarzan_2.jpg"))
  photo_tarzan_3 = File.open(Rails.root.join("public/seed_images/tarzan_3.jpg"))
  photo_tarzan_4 = File.open(Rails.root.join("public/seed_images/tarzan_4.jpg"))
  photo_tarzan_5 = File.open(Rails.root.join("public/seed_images/tarzan_5.jpg"))
  photo_tarzan = [photo_tarzan_1, photo_tarzan_2, photo_tarzan_3, photo_tarzan_4, photo_tarzan_5]

  #roger
  photo_roger_1 = File.open(Rails.root.join("public/seed_images/roger_1.jpg"))
  photo_roger_2 = File.open(Rails.root.join("public/seed_images/roger_2.jpg"))
  photo_roger_3 = File.open(Rails.root.join("public/seed_images/roger_3.jpg"))
  photo_roger_4 = File.open(Rails.root.join("public/seed_images/roger_4.jpg"))
  photo_roger_5 = File.open(Rails.root.join("public/seed_images/roger_5.jpg"))
  photo_roger = [photo_roger_1, photo_roger_2, photo_roger_3, photo_roger_4, photo_roger_5]

  photos = [photo_tarzan, photo_roger, photo_jamila, photo_carlos, photo_nala]

  pets.each_with_index do |pet, index|
    animal = Pet.new(pet.merge({ user: User.all.sample }))
    animal.photos.attach(io: photos[index][0], filename: pet, content_type: 'jpg')
    animal.photos.attach(io: photos[index][1], filename: pet, content_type: 'jpg')
    animal.photos.attach(io: photos[index][2], filename: pet, content_type: 'jpg')
    animal.photos.attach(io: photos[index][3], filename: pet, content_type: 'jpg')
    animal.photos.attach(io: photos[index][4], filename: pet, content_type: 'jpg')
    animal.save
  end
  p 'Seeds Pets saved'
end

seed_pets(pets)

# bookings

Booking.create(user_id: 3, pet_id: 3, starting_date: Date.yesterday, ending_date: Date.tomorrow, status: 0)
Booking.create(user_id: 3, pet_id: 2, starting_date: Date.yesterday, ending_date: Date.tomorrow, status: 1)
Booking.create(user_id: 3, pet_id: 1, starting_date: Date.yesterday, ending_date: Date.tomorrow, status: 2)
