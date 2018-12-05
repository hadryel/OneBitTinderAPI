photo_dir = Rails.root.join("tmp/seed_images")


# CREATE USERS

ActiveRecord::Base.transaction do
  beagle = User.create(name: "Bleagle", email: "bleagle@dog.com", password: "123456", password_confirmation: "123456")
  beagle.photos.create
  beagle.photos.first.file.attach(io: File.open("#{photo_dir}/beagle_01.jpg"), filename: "beagle_01.jpg")

  buldogue = User.create(name: "Buldogue", email: "buldogue@dog.com", password: "123456", password_confirmation: "123456")
  2.times { buldogue.photos.create }
  buldogue.photos.first.file.attach(io: File.open("#{photo_dir}/buldogue_01.jpg"), filename: "buldogue_01.jpg")
  buldogue.photos.second.file.attach(io: File.open("#{photo_dir}/buldogue_02.jpeg"), filename: "buldogue_02.jpg")

  doberman = User.create(name: "Doberman", email: "doberman@dog.com", password: "123456", password_confirmation: "123456")
  2.times { doberman.photos.create }
  doberman.photos.first.file.attach(io: File.open("#{photo_dir}/doberman_01.jpeg"), filename: "doberman_01.jpg")
  doberman.photos.second.file.attach(io: File.open("#{photo_dir}/doberman_02.jpg"), filename: "doberman_02.jpg")

  labrador = User.create(name: "Labrador", email: "labrador@dog.com", password: "123456", password_confirmation: "123456")
  4.times { labrador.photos.create }
  labrador.photos.first.file.attach(io: File.open("#{photo_dir}/labrador_01.jpg"), filename: "labrador_01.jpg")
  labrador.photos.second.file.attach(io: File.open("#{photo_dir}/labrador_02.jpg"), filename: "labrador_02.jpg")
  labrador.photos.third.file.attach(io: File.open("#{photo_dir}/labrador_03.jpg"), filename: "labrador_03.jpg")
  labrador.photos.fourth.file.attach(io: File.open("#{photo_dir}/labrador_04.jpg"), filename: "labrador_04.jpg")

  poodle = User.create(name: "Poodle", email: "poodle@dog.com", password: "123456", password_confirmation: "123456")
  2.times { poodle.photos.create }
  poodle.photos.first.file.attach(io: File.open("#{photo_dir}/poodle_01.png"), filename: "poodle_01.jpg")
  poodle.photos.second.file.attach(io: File.open("#{photo_dir}/poodle_02.jpg"), filename: "poodle_02.jpg")

  shih_tzu = User.create(name: "Shih Tzu", email: "shih_tzu@dog.com", password: "123456", password_confirmation: "123456")
  2.times { shih_tzu.photos.create }
  shih_tzu.photos.first.file.attach(io: File.open("#{photo_dir}/shih_tzu_01.jpg"), filename: "shih_tzu_01.jpg")
  shih_tzu.photos.second.file.attach(io: File.open("#{photo_dir}/shih_tzu_02.jpg"), filename: "shih_tzu_02.jpg")


  # LIKES DOGS

  beagle.likes_given.create(likee: poodle, liked: true)
  poodle.likes_given.create(likee: beagle, liked: true)

  beagle.likes_given.create(likee: doberman, liked: true)
  doberman.likes_given.create(likee: beagle, liked: true)

  shih_tzu.likes_given.create(likee: beagle, liked: false)

  beagle.likes_earned.create(liker: labrador, liked: true)

  beagle_match = beagle.matches.first
  beagle_match.messages.create(body: "Hi!", user: beagle)
end