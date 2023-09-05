# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


#este seed nos crea el usuario admin

user = User.new(
    username: "Kari"
    email: "test1@gmail.com",
    password: "asdasdasd",
    password_confirmation: "asdasdasd",
    role: 1
)

# Genera la URL de la imagen con Faker
image_url = Faker::Avatar.image(slug: "user-1", size: "50x50", format: "jpg")

# Abre y adjunta la imagen desde la URL
user.image.attach(
    io: open(image_url),
    filename: "avatar_user_1.jpg",
    content_type: 'image/jpeg'
)

user.save!


