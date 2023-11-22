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

Coworking.destroy_all
User.destroy_all

User.create(username: 'User 1', first_name: '1', last_name: 'User', email: 'user1@example.com', password: 'password1')
User.create(username: 'User 2', first_name: '2', last_name: 'User', email: 'user2@example.com', password: 'password2')


Coworking.create(
  title: 'Great speace to work near the ocean',
  address: 'Ipanema, Gatota de Ipanema, 123. Rio de Janeiro, Brazil',
  price: 150,
  description: 'Nice place to work.',
  image: 'https://conteudo.imguol.com.br/c/noticias/3d/2020/10/19/espaco-de-coworking-da-wework-em-sao-paulo-1603119350042_v2_900x506.jpg',
  user: User.first
)


Coworking.create(
  title: 'Second coworking space',
  address: 'Rua do Salvadores, 140. Salvador, Brazil',
  price: 200,
  description: 'Awesome place to work.',
  image: 'https://ctfassets.imgix.net/vh7r69kgcki3/1yD4Tmm83DWGhp6UzGId5z/baa2c10600153343d3b72c24762ba571/Web_150DPI-20201217_WeWork_Km_5_Av_Las_Palmas_-_Medellin_007.jpg',
  user: User.second
)


Coworking.create(
  title: 'Third coworking space',
  address: 'Colosseum, 123. Rome, Italy',
  price: 1000,
  description: 'Big room with a comfortable chair to work in peace.',
  image: 'https://www.bing.com/images/search?view=detailV2&ccid=WO6S1xHB&id=73639466C3A68FCE609EBCEF54D037129E8A69A2&thid=OIP.WO6S1xHBjKkevc5oq8_7BgHaE8&mediaurl=https%3a%2f%2fofficesnapshots.com%2fwp-content%2fuploads%2f2017%2f07%2fEntrance1_HD_ANG_9239-1200x801.jpg&cdnurl=https%3a%2f%2fth.bing.com%2fth%2fid%2fR.58ee92d711c18ca91ebdce68abcffb06%3frik%3dommKnhI30FTvvA%26pid%3dImgRaw%26r%3d0&exph=801&expw=1200&q=office+rome+italy&simid=607989652582198462&FORM=IRPRST&ck=E23588144B8E461AC620689CF880ACB1&selectedIndex=12&ajaxhist=0&ajaxserp=0',
  user: User.third
)

puts "Seeds created"
