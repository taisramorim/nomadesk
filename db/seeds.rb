# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Getting seeds"

Rent.destroy_all
Coworking.destroy_all
User.destroy_all

user1 = User.create(
  username: 'tais',
  first_name: 'Tais',
  last_name: 'Amorim',
  email: 'tais@example.com',
  password: 'password1'
)

user2 = User.create(
  username: 'stella',
  first_name: 'Stella',
  last_name: 'Mascaro',
  email: 'stella@example.com',
  password: 'password2'
)

user3 = User.create(
  username: 'karol',
  first_name: 'Karoline',
  last_name: 'Ferr',
  email: 'karol@example.com',
  password: 'password3'
)

user4 = User.create(
  username: 'dede',
  first_name: 'Andre',
  last_name: 'Marques',
  email: 'andre@example.com',
  password: 'password4'
)

user5 = User.create(
  username: 'carla',
  first_name: 'Carla',
  last_name: 'Valdivia',
  email: 'carla@example.com',
  password: 'password5'
)

user6 = User.create(
  username: 'chloe',
  first_name: 'Chloe',
  last_name: 'Geerdens',
  email: 'chloe@example.com',
  password: 'password6'
)

coworking1 = Coworking.create(
  title: 'Great place to work',
  address: 'Av. Saturnino de Brito, 351 - Vitória, Brazil',
  price: 250.00,
  description: 'Come join us.',
  image: "coworking1.jpeg",
  user: User.first
)

coworking2 = Coworking.create(
  title: 'Relax and work',
  address: 'Rua Lagoa das garças, 150 - Rio de Janeiro, Brazil',
  price: 300.00,
  description: 'Awesome place to work.',
  image: "coworking2.jpeg",
  user: User.second
)

coworking3 = Coworking.create(
  title: 'Nice and fresh',
  address: 'Av. Suiça, 1140 - Sete lagoas, Brazil',
  price: 350.00,
  description: 'Nice place to work.',
  image: "coworking3.jpeg",
  user: User.third
)

coworking4 = Coworking.create(
  title: 'Mengo is the best',
  address: 'R. Marquês de Abrantes, 118 - Rio de Janeiro, Brazil',
  price: 200,
  description: 'Awesome place to work.',
  image: "coworking4.jpeg",
  user: User.fourth
)

coworking5 = Coworking.create(
  title: 'Rara Party',
  address: 'Rua Siqueira Campos, 143 - Rio de Janeiro, Brazil',
  price: 150,
  description: 'Nice place to work.',
  image: "coworking5.jpeg",
  user: User.fifth
)

coworking6 = Coworking.create(
  title: 'Le coworking',
  address: 'Ipanema Business - R. Visc. de Pirajá, 142 - Rio de Janeiro, Brazil',
  price: 200,
  description: 'The best place you can find!',
  image: "coworking6.jpeg",
  user: User.last
)

Coworking.create(
  title: 'Another coworking space',
  address: 'Boston, USA',
  price: 250,
  description: 'Join us!',
  image: "coworking7.jpeg",
  user: User.first
)

Coworking.create(
  title: 'One more coworking space',
  address: 'Recife, Brazil',
  price: 200,
  description: 'Awesome place to work.',
  image: "coworking8.jpeg",
  user: User.second
)

Coworking.create(
  title: 'And this space',
  address: 'Sao Paulo, Brazil',
  price: 150,
  description: 'Nice place to work.',
  image: "coworking9.jpeg",
  user: User.third
)

Coworking.create(
  title: 'Amazing space',
  address: 'Curitiba, Brazil',
  price: 200,
  description: 'Awesome place to work.',
  image: "coworking10.jpeg",
  user: User.fourth
)

Coworking.create(
  title: 'Incredible',
  address: 'Florianopolis, Brazil',
  price: 150,
  description: 'Nice place to work.',
  image: "coworking11.jpeg",
  user: User.fifth
)

Coworking.create(
  title: 'Best working place',
  address: 'Belo Horizonte, Brazil',
  price: 200,
  description: 'Awesome place to work.',
  image: "coworking12.jpeg",
  user: User.last
)

Rent.create(
  start_date: Date.today,
  end_date: Date.today + 7,
  status: :pending,
  coworking: coworking2,
  user: user1
)

Rent.create(
  start_date: Date.today + 10,
  end_date: Date.today + 17,
  status: :pending,
  coworking: coworking3,
  user: user2
)

Rent.create(
  start_date: Date.today - 5,
  end_date: Date.today,
  status: :accepted,
  coworking: coworking1,
  user: user3
)

Rent.create(
  start_date: Date.today - 3,
  end_date: Date.today + 4,
  status: :rejected,
  coworking: coworking4,
  user: user1
)

Rent.create(
  start_date: Date.today + 10,
  end_date: Date.today + 17,
  status: :pending,
  coworking: coworking2,
  user: user5
)

Rent.create(
  start_date: Date.today - 55,
  end_date: Date.today + 60,
  status: :accepted,
  coworking: coworking6,
  user: user4
)

Rent.create(
  start_date: Date.today - 23,
  end_date: Date.today + 14,
  status: :rejected,
  coworking: coworking5,
  user: user6
)

puts "Seeds created"
