photo_dir = Rails.root.join("db/seed_images")


# CREATE USERS

ActiveRecord::Base.transaction do

  # DOGS

  beagle = User.create(name: "Beagle", email: "beagle@dog.com", password: "123456", password_confirmation: "123456",
                      company: Faker::Company.name, college: Faker::Science.scientist, description: Faker::Lorem.sentence(3))
  beagle.photos.create
  beagle.photos.first.file.attach(io: File.open("#{photo_dir}/beagle_01.jpg"), filename: "beagle_01.jpg")

  buldogue = User.create(name: "Buldogue", email: "buldogue@dog.com", password: "123456", password_confirmation: "123456",
                        company: Faker::Company.name, college: Faker::Science.scientist, description: Faker::Lorem.sentence(3))
  2.times { buldogue.photos.create }
  buldogue.photos.first.file.attach(io: File.open("#{photo_dir}/buldogue_01.jpg"), filename: "buldogue_01.jpg")
  buldogue.photos.second.file.attach(io: File.open("#{photo_dir}/buldogue_02.jpg"), filename: "buldogue_02.jpg")

  doberman = User.create(name: "Doberman", email: "doberman@dog.com", password: "123456", password_confirmation: "123456",
                        company: Faker::Company.name, college: Faker::Science.scientist, description: Faker::Lorem.sentence(3))
  2.times { doberman.photos.create }
  doberman.photos.first.file.attach(io: File.open("#{photo_dir}/doberman_01.jpg"), filename: "doberman_01.jpg")
  doberman.photos.second.file.attach(io: File.open("#{photo_dir}/doberman_02.jpg"), filename: "doberman_02.jpg")

  labrador = User.create(name: "Labrador", email: "labrador@dog.com", password: "123456", password_confirmation: "123456",
                        company: Faker::Company.name, college: Faker::Science.scientist)
  4.times { labrador.photos.create }
  labrador.photos.first.file.attach(io: File.open("#{photo_dir}/labrador_01.jpg"), filename: "labrador_01.jpg")
  labrador.photos.second.file.attach(io: File.open("#{photo_dir}/labrador_02.jpg"), filename: "labrador_02.jpg")
  labrador.photos.third.file.attach(io: File.open("#{photo_dir}/labrador_03.jpg"), filename: "labrador_03.jpg")
  labrador.photos.fourth.file.attach(io: File.open("#{photo_dir}/labrador_04.jpg"), filename: "labrador_04.jpg")

  poodle = User.create(name: "Poodle", email: "poodle@dog.com", password: "123456", password_confirmation: "123456",
                      company: Faker::Company.name, college: Faker::Science.scientist, description: Faker::Lorem.sentence(3))
  2.times { poodle.photos.create }
  poodle.photos.first.file.attach(io: File.open("#{photo_dir}/poodle_01.jpg"), filename: "poodle_01.jpg")
  poodle.photos.second.file.attach(io: File.open("#{photo_dir}/poodle_02.jpg"), filename: "poodle_02.jpg")

  shih_tzu = User.create(name: "Shih Tzu", email: "shih_tzu@dog.com", password: "123456", password_confirmation: "123456",
                        company: Faker::Company.name, college: Faker::Science.scientist)
  2.times { shih_tzu.photos.create }
  shih_tzu.photos.first.file.attach(io: File.open("#{photo_dir}/shih_tzu_01.jpg"), filename: "shih_tzu_01.jpg")
  shih_tzu.photos.second.file.attach(io: File.open("#{photo_dir}/shih_tzu_02.jpg"), filename: "shih_tzu_02.jpg")

  golden_retrivier = User.create(name: "Golden Retrivier", email: "golden_retrivier@dog.com", password: "123456", password_confirmation: "123456",
                                company: Faker::Company.name, college: Faker::Science.scientist)
  golden_retrivier.photos.create
  golden_retrivier.photos.first.file.attach(io: File.open("#{photo_dir}/golden_retrivier_01.jpg"), filename: "golden_retrivier_01.jpg")
  
  dachshund = User.create(name: "Dachshund", email: "dachshund@dog.com", password: "123456", password_confirmation: "123456",
                          company: Faker::Company.name, college: Faker::Science.scientist, description: Faker::Lorem.sentence(3))
  dachshund.photos.create
  dachshund.photos.first.file.attach(io: File.open("#{photo_dir}/dachshund_01.jpg"), filename: "dachshund_01.jpg")

  chow_chow = User.create(name: "Chow Chow", email: "chow_chow@dog.com", password: "123456", password_confirmation: "123456",
                          company: Faker::Company.name, college: Faker::Science.scientist, description: Faker::Lorem.sentence(3))
  2.times { chow_chow.photos.create }
  chow_chow.photos.first.file.attach(io: File.open("#{photo_dir}/chow_chow_01.jpg"), filename: "chow_chow_01.jpg")
  chow_chow.photos.second.file.attach(io: File.open("#{photo_dir}/chow_chow_02.jpg"), filename: "chow_chow_02.jpg")

  akita_inu = User.create(name: "Akita Inu", email: "akita_inu@dog.com", password: "123456", password_confirmation: "123456",
                          company: Faker::Company.name, college: Faker::Science.scientist, description: Faker::Lorem.sentence(3))
  3.times { akita_inu.photos.create }
  akita_inu.photos.first.file.attach(io: File.open("#{photo_dir}/akita_inu_01.jpg"), filename: "akita_inu_01.jpg")
  akita_inu.photos.second.file.attach(io: File.open("#{photo_dir}/akita_inu_02.jpg"), filename: "akita_inu_02.jpg")
  akita_inu.photos.third.file.attach(io: File.open("#{photo_dir}/akita_inu_03.jpg"), filename: "akita_inu_03.jpg")


  # CATS

  scottish_fold = User.create(name: "Scottish Fold", email: "scottish_fold@cat.com", password: "123456", password_confirmation: "123456",
                              company: Faker::Company.name, college: Faker::Science.scientist)
  2.times { scottish_fold.photos.create }
  scottish_fold.photos.first.file.attach(io: File.open("#{photo_dir}/scottish_fold_01.jpg"), filename: "scottish_fold_01.jpg")
  scottish_fold.photos.second.file.attach(io: File.open("#{photo_dir}/scottish_fold_02.jpg"), filename: "scottish_fold_02.jpg")

  maine_coon = User.create(name: "Maine Coon", email: "maine_coon@cat.com", password: "123456", password_confirmation: "123456",
                          company: Faker::Company.name, college: Faker::Science.scientist, description: Faker::Lorem.sentence(3))
  4.times { maine_coon.photos.create }
  maine_coon.photos.first.file.attach(io: File.open("#{photo_dir}/maine_coon_01.jpg"), filename: "maine_coon_01.jpg")
  maine_coon.photos.second.file.attach(io: File.open("#{photo_dir}/maine_coon_02.jpg"), filename: "maine_coon_02.jpg")
  maine_coon.photos.third.file.attach(io: File.open("#{photo_dir}/maine_coon_03.jpg"), filename: "maine_coon_03.jpg")
  maine_coon.photos.fourth.file.attach(io: File.open("#{photo_dir}/maine_coon_04.jpg"), filename: "maine_coon_04.jpg")

  chartreux = User.create(name: "Chartreux", email: "chartreux@cat.com", password: "123456", password_confirmation: "123456",
                          company: Faker::Company.name, college: Faker::Science.scientist, description: Faker::Lorem.sentence(3))
  2.times { chartreux.photos.create }
  chartreux.photos.first.file.attach(io: File.open("#{photo_dir}/chartreux_01.jpg"), filename: "chartreux_01.jpg")
  chartreux.photos.second.file.attach(io: File.open("#{photo_dir}/chartreux_02.jpg"), filename: "chartreux_02.jpg")

  korat = User.create(name: "Korat", email: "korat@cat.com", password: "123456", password_confirmation: "123456",
                      company: Faker::Company.name, college: Faker::Science.scientist)
  korat.photos.create
  korat.photos.first.file.attach(io: File.open("#{photo_dir}/korat_01.jpg"), filename: "korat_01.jpg")
  
  turkish_van = User.create(name: "Turkish Van", email: "turkish_van@cat.com", password: "123456", password_confirmation: "123456",
                            company: Faker::Company.name, college: Faker::Science.scientist, description: Faker::Lorem.sentence(3))
  3.times { turkish_van.photos.create }
  turkish_van.photos.first.file.attach(io: File.open("#{photo_dir}/turkish_van_01.jpg"), filename: "turkish_van_01.jpg")
  turkish_van.photos.second.file.attach(io: File.open("#{photo_dir}/turkish_van_02.jpg"), filename: "turkish_van_02.jpg")
  turkish_van.photos.third.file.attach(io: File.open("#{photo_dir}/turkish_van_03.jpg"), filename: "turkish_van_03.jpg")

  selkirk_rex = User.create(name: "Selkirk Rex", email: "selkirk_rex@cat.com", password: "123456", password_confirmation: "123456",
                            company: Faker::Company.name, college: Faker::Science.scientist)
  selkirk_rex.photos.create
  selkirk_rex.photos.first.file.attach(io: File.open("#{photo_dir}/selkirk_rex_01.jpg"), filename: "selkirk_rex_01.jpg")

  norwegian_forecast = User.create(name: "Norwegian Forecast", email: "norwegian_forecast@cat.com", password: "123456", password_confirmation: "123456",
                                  company: Faker::Company.name, college: Faker::Science.scientist)
  5.times { norwegian_forecast.photos.create }
  norwegian_forecast.photos.first.file.attach(io: File.open("#{photo_dir}/norwegian_forecast_01.jpg"), filename: "norwegian_forecast_01.jpg")
  norwegian_forecast.photos.second.file.attach(io: File.open("#{photo_dir}/norwegian_forecast_02.jpg"), filename: "norwegian_forecast_02.jpg")
  norwegian_forecast.photos.third.file.attach(io: File.open("#{photo_dir}/norwegian_forecast_03.jpg"), filename: "norwegian_forecast_03.jpg")
  norwegian_forecast.photos.fourth.file.attach(io: File.open("#{photo_dir}/norwegian_forecast_04.jpg"), filename: "norwegian_forecast_04.jpg")
  norwegian_forecast.photos.fifth.file.attach(io: File.open("#{photo_dir}/norwegian_forecast_05.jpg"), filename: "norwegian_forecast_05.jpg")
  
  ragdoll = User.create(name: "Ragdoll", email: "ragdoll@cat.com", password: "123456", password_confirmation: "123456",
                        company: Faker::Company.name, college: Faker::Science.scientist, description: Faker::Lorem.sentence(3))
  ragdoll.photos.create
  ragdoll.photos.first.file.attach(io: File.open("#{photo_dir}/ragdoll_01.jpg"), filename: "ragdoll_01.jpg")
  
  russian_blue = User.create(name: "Russian Blue", email: "russian_blue@cat.com", password: "123456", password_confirmation: "123456",
                            company: Faker::Company.name, college: Faker::Science.scientist)
  russian_blue.photos.create
  russian_blue.photos.first.file.attach(io: File.open("#{photo_dir}/russian_blue_01.jpg"), filename: "russian_blue_01.jpg")
  
  siamese = User.create(name: "Siamese", email: "siamese@cat.com", password: "123456", password_confirmation: "123456",
                        company: Faker::Company.name, college: Faker::Science.scientist, description: Faker::Lorem.sentence(3))
  3.times { siamese.photos.create }
  siamese.photos.first.file.attach(io: File.open("#{photo_dir}/siamese_01.jpg"), filename: "siamese_01.jpg")
  siamese.photos.second.file.attach(io: File.open("#{photo_dir}/siamese_02.jpg"), filename: "siamese_02.jpg")
  siamese.photos.third.file.attach(io: File.open("#{photo_dir}/siamese_03.jpg"), filename: "siamese_03.jpg")
  

  # LIKES

  beagle.likes_given.create(likee: poodle, liked: true)
  poodle.likes_given.create(likee: beagle, liked: true)

  beagle.likes_given.create(likee: doberman, liked: true)
  doberman.likes_given.create(likee: beagle, liked: true)

  shih_tzu.likes_given.create(likee: beagle, liked: false)

  beagle.likes_earned.create(liker: labrador, liked: true)

  beagle_match = beagle.matches.first
  beagle_match.messages.create(body: "Hi!", user: beagle)
  beagle_match.messages.create(body: "Ahoy!", user: poodle)


  siamese.likes_given.create(likee: beagle, liked: true)
  beagle.likes_given.create(likee: siamese, liked: true)

  russian_blue.likes_given.create(likee: beagle, liked: false)

  selkirk_rex.likes_given.create(likee: beagle, liked: true)  
end