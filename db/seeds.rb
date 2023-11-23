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
  username: 'User 1',
  first_name: '1',
  last_name: 'User',
  email: 'user1@example.com',
  password: 'password1'
)

user2 = User.create(
  username: 'User 2',
  first_name: '2',
  last_name: 'User',
  email: 'user2@example.com',
  password: 'password2'
)

coworking1 = Coworking.create(
  title: 'First coworking space',
  address: 'Boston',
  price: 150,
  description: 'Nice place to work.',
  image: 'https://conteudo.imguol.com.br/c/noticias/3d/2020/10/19/espaco-de-coworking-da-wework-em-sao-paulo-1603119350042_v2_900x506.jpg',
  user: User.first
)

coworking2 = Coworking.create(
  title: 'Second coworking space',
  address: 'Rua do Salvadores, 140. Salvador, Brazil',
  price: 200,
  description: 'Awesome place to work.',
  image: 'https://ctfassets.imgix.net/vh7r69kgcki3/1yD4Tmm83DWGhp6UzGId5z/baa2c10600153343d3b72c24762ba571/Web_150DPI-20201217_WeWork_Km_5_Av_Las_Palmas_-_Medellin_007.jpg',
  user: User.second
)

Rent.create(
  start_date: Date.today,
  end_date: Date.today + 7,
  status: :pending,
  coworking: coworking1,
  user: user1
)

Rent.create(
  start_date: Date.today + 10,
  end_date: Date.today + 17,
  status: :pending,
  coworking: coworking2,
  user: user2
)

Rent.create(
  start_date: Date.today - 5,
  end_date: Date.today,
  status: :accepted,
  coworking: coworking1,
  user: user2
)

Rent.create(
  start_date: Date.today - 3,
  end_date: Date.today + 4,
  status: :rejected,
  coworking: coworking2,
  user: user1
)

puts "Seeds created"
