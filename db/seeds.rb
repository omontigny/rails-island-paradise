# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning Database..."
Booking.destroy_all
puts "Booking cleaned"
Island.destroy_all
puts "Island cleaned"
User.destroy_all
puts "Users cleaned"


# User 1 - Owner
# Email : coraliedelhommeau@gmail.com
# Password : secret123
# User 2 – renter
# Email : mickael.occelli@gmail.com
# Password : topsecret
# User3 - renter
# Email : kev.scelles@gmail.com
# Password : azerty
# User4 -renter
# Email : olivier.wagon498@free.fr
# Password : password

# User 5 – Owner
# Email : secretuser1@gmail.com
# Password : secret1
# User 6 – Owner
# Email : secretuser2@gmail.com
# Password : secret2

# Users
coralie  = User.new(first_name: 'Coralie', last_name: 'Delhommeau', email: 'coraliedelhommeau@gmail.com', password: 'secret123')
file = File.open(Rails.root.join('db/fixtures/avatars/cdelhommeau.jpg'))
coralie.avatar.attach(io: file, filename: 'cdelhommeau.jpg', content_type: 'image/jpg')
coralie.save!
puts "User #{coralie.first_name} created"

mickael  = User.new(first_name: 'Mickael', last_name: 'Occelli', email: 'mickael.occelli@gmail.com', password: 'topsecret')
file = File.open(Rails.root.join('db/fixtures/avatars/moccelli.jpg'))
mickael.avatar.attach(io: file, filename: 'moccelli.jpg', content_type: 'image/jpg')
mickael.save!
puts "User #{mickael.first_name} created"

kevin  = User.new(first_name: 'Kevin', last_name: 'Scelles', email: 'kev.scelles@gmail.com', password: 'azerty123')
file = File.open(Rails.root.join('db/fixtures/avatars/kscelles.jpg'))
kevin.avatar.attach(io: file, filename: 'kscelles.jpg', content_type: 'image/jpg')
kevin.save!
puts "User #{kevin.first_name} created"

olivier  = User.new(first_name: 'Olivier', last_name: 'Montigny', email: 'olivier.wagon498@free.fr', password: 'password456')
file = File.open(Rails.root.join('db/fixtures/avatars/omontigny.jpg'))
olivier.avatar.attach(io: file, filename: 'omontigny.jpg', content_type: 'image/jpg')
olivier.save!
puts "User #{olivier.first_name} created"

# Islands
# Heart-shaped Island : Fiji (-17.858052,177.20179) Atlantic Ocean
heart = Island.new(name: "Heart Island", location: 'Heart Island fidji', description: "Beautiful island in shape of heart in Fidji. Perfect for honeymoon.", capacity: 3, ocean: "Atlantic Ocean", country: "Fidji", price_per_day: 35_000, shark: true)
file = File.open(Rails.root.join('db/fixtures/islands/heart.jpg'))
heart.picture.attach(io: file, filename: 'heart.jpg', content_type: 'image/jpg')
heart.owner = coralie
heart.save!
puts "Island #{heart.name} created"

sleep 0.5
# Ko Rang Yai Island: Thailand (7.955642,98.446528) (Indian Ocean) - OK
rangyai = Island.new(name: "Ko Rang Yai Island", location: 'Ko Rang Yai Island', description: "Koh Rang Yai is a peaceful island about 5 km off the east coast of Phuket(Thailand), you can enjoy water sports (including sea kayaking) or sunbathe in the afternoons. Adventurous travellers can find pretty good snorkelling near the headland rocks.", capacity: 2, ocean: "Indian ocean", country: "Thailand", price_per_day: 75_000, shark: false)
file = File.open(Rails.root.join('db/fixtures/islands/rangyai.jpg'))
rangyai.picture.attach(io: file, filename: 'rangyai.jpg', content_type: 'image/jpg')
# rangyai.location('Ko Rang Yai Island')
rangyai.owner = kevin
rangyai.save!
puts "Island #{rangyai.name} created"

sleep 0.5
# ShelterIsland (Lake County, Montana, United States of America (47.84144172763476,-114.21063619580997) OK
shelterIsland = Island.new(name: "Shelter Island Castle", location: 'Lake County, Montana', description: "One of the most expensive homes in Montana perched on its own private island, if you want to leave unforgettable experience, Go there now!", capacity: 4, ocean: "Indian ocean", country: "United States", price_per_day: 48_235, shark: false)
file = File.open(Rails.root.join('db/fixtures/islands/shelterIsland.jpg'))
shelterIsland.picture.attach(io: file, filename: 'shelterIsland.jpg', content_type: 'image/jpg')
# shelterIsland.location('Lake County, Montana')
shelterIsland.owner = mickael
shelterIsland.save!
puts "Island #{shelterIsland.name} created"

sleep 0.5
# whitsunday-islands (-20.1189023,148.9134288)(Australia) (coral Sea) - OK
whitsunday = Island.new(name: "whitsunday Islands", location: 'whitsunday-islands', description: "The Whitsunday Islands are a located off the coast of Queensland, Australia. Known for their beautiful surroundings, Whitehaven beach is one of the most well known beaches in Australia.", capacity: 5, ocean: "Coral Sea", country: "Australia", price_per_day: 53_500, shark: true)
file = File.open(Rails.root.join('db/fixtures/islands/whitsunday.jpg'))
whitsunday.picture.attach(io: file, filename: 'whitsunday.jpg', content_type: 'image/jpg')
# whitsunday.location('whitsunday-islands')
whitsunday.owner = mickael
whitsunday.save!
puts "Island #{whitsunday.name} created"

sleep 0.5
# BlueIsland (Bahamas) (25.04082,-77.37122) (Mer des caraibes)
blueIsland = Island.new(name: "Blue Island", location: 'Bozine Town Road, Bahamas', description: "You need a private jet to reach this incredible site. This fabulous island, home to three miles of treasured coastline and glistening beaches, features elevations up to 100 feet", capacity: 3, ocean: "Carribean Sea", country: "Bahamas", price_per_day: 64_000, shark: true)
file = File.open(Rails.root.join('db/fixtures/islands/blueIsland.jpg'))
blueIsland.picture.attach(io: file, filename: 'blueIsland.jpg', content_type: 'image/jpg')
# blueIsland.location('Bozine Town Road, Bahamas')
blueIsland.owner = coralie
blueIsland.save!
puts "Island #{blueIsland.name} created"

sleep 0.5
#Half Moon Cay, Cat Island, Bahamas (24.5770593, -75.9232759) (Mer des caraibes)
halfMoon = Island.new(name: "Half Moon Cay", location: 'Half Moon Cay, Cat Island, Bahamas', description: "When people think of the Caribbean, they often overlook one of its most gorgeous regions—the Bay Islands of the Southwestern Caribbean. The island is full equiped because also features a dock, a newly constructed helipad, several storerooms, a workshop and a freight elevator", capacity: 5, ocean: "Carribean Sea", country: "Bahamas", price_per_day: 50_000, shark: true)
file = File.open(Rails.root.join('db/fixtures/islands/halfMoon.jpg'))
halfMoon.picture.attach(io: file, filename: 'halfMoon.jpg', content_type: 'image/jpg')
# halfMoon.location('Half Moon Cay, Cat Island, Bahamas')
halfMoon.owner = mickael
halfMoon.save!
puts "Island #{halfMoon.name} created"

sleep 0.5

roc = Island.new(name: "The Roc", location: 'porquerolles, france', description: "This island is perfect for people who wants to spend some time alone to better know themselves and discover the meaning of life.", capacity: 3, ocean: "Pacific ocean", country: "Indonesia", price_per_day: 23_500, shark: false)
file = File.open(Rails.root.join('db/fixtures/islands/roc.jpg'))
roc.picture.attach(io: file, filename: 'roc.jpg', content_type: 'image/jpg')
# halfMoon.location('Half Moon Cay, Cat Island, Bahamas')
roc.owner = coralie
roc.save!
puts "Island #{roc.name} created"

# maple = Island.new(name: "Maple", description: "Perfect island for camping lovers and people who love the watch birds. You'll see it is the most quit place on earth.", capacity: 4, ocean: "Atlantic ocean", country: "Canada", price_per_day: 120, shark: false)
# file = File.open(Rails.root.join('db/fixtures/islands/maple.jpg'))
# maple.picture.attach(io: file, filename: 'roc.jpg', content_type: 'maple/jpg')
# maple.owner = mickael
# maple.save!
# puts "Island #{maple.name} created"

hygge = Island.new(name: "Hygge", location: 'Ile of Paques', description: "If you love to meditate, this island if for you. The sunrise is absolutely gorgeous and will allow you to find the peace your searching for.", capacity: 4, ocean: "Norway sea", country: "Norway", price_per_day: 18_750, shark: false)
file = File.open(Rails.root.join('db/fixtures/islands/hygge.jpg'))
hygge.picture.attach(io: file, filename: 'hygge.jpg', content_type: 'hygge/jpg')
hygge.owner = mickael
hygge.save!
puts "Island #{hygge.name} created"

# ko = Island.new(name: "Ko Yao Noi", description: "Perfect spot for family or friend holidays. The island is spacious and is full of activities to do. Moreover the island is seperated in two by a sand strip. It is great to isolate yourself and preserve privacy when you travel with a group." , capacity: 8, ocean: "Indian ocean", country: "Thailand", price_per_day: 300, shark: true)
# file = File.open(Rails.root.join('db/fixtures/islands/ko.jpg'))
# ko.picture.attach(io: file, filename: 'ko.jpg', content_type: 'ko/jpg')
# ko.owner = mickael
# ko.save!
# puts "Island #{ko.name} created"

narval = Island.new(name: "Narval", location: 'Pasyon Seychelles', description: "You want to live the best holiday ever ? Come to the Narval Island. The beaches are beautiful and the water is always warm.  You won't have a day without sun. It is the perfect place for pure leasure and relaxation." , capacity: 5, ocean: "Carribean sea", country: "Seychelles", price_per_day: 72_000, shark: true)
file = File.open(Rails.root.join('db/fixtures/islands/narval.jpg'))
narval.picture.attach(io: file, filename: 'narval.jpg', content_type: 'narval/jpg')
narval.owner = coralie
narval.save!
puts "Island #{narval.name} created"

# winty = Island.new(name: "Winty", description: "Winty is an world-famous island to admire whales. So take your binoculars and a coat (because it freezing) and come to discover natural beauties.", capacity: 2, ocean: "Groenland sea", country: "Groenland", price_per_day: 150, shark: false)
# file = File.open(Rails.root.join('db/fixtures/islands/winty.jpg'))
# winty.picture.attach(io: file, filename: 'winty.jpg', content_type: 'winty/jpg')
# winty.owner = mickael
# winty.save!
# puts "Island #{winty.name} created"

# macdo = Island.new(name: "MacDonney Island", description: "The MacDonney Island is a well furnished island. Indeed you will also have access to the haunted castle present on the island. Thrill and adventure guaranteed !", capacity: 5, ocean: "North sea", country: "Scotland", price_per_day: 175, shark: false)
# file = File.open(Rails.root.join('db/fixtures/islands/macdo.jpg'))
# macdo.picture.attach(io: file, filename: 'macdo.jpg', content_type: 'macdo/jpg')
# macdo.owner = coralie
# macdo.save!
# puts "Island #{macdo.name} created"


firstb = Booking.new(start_date: "13/03/2022", end_date: "20/03/2022", nb_travelers: 3, total_price: 245_000, status: "refused")
firstb.renter = kevin
firstb.island = heart # owner coralie
firstb.save!
puts "Booking #{firstb.id} created"

# secondb = Booking.new(start_date: "13/07/2022", end_date: "20/07/2022", nb_travelers: 2, total_price: 490, status: "accepted")
# secondb.renter = olivier
# secondb.island = halfMoon # owner Mickael
# secondb.save!
# puts "Booking #{secondb.id} created"

thirdb = Booking.new(start_date: "23/08/2022", end_date: "31/08/2022", nb_travelers: 5, total_price: 560_000)
thirdb.renter = kevin
thirdb.island = narval # owner Coralie
thirdb.save!
puts "Booking #{thirdb.id} created"

fourthb = Booking.new(start_date: "25/01/2022", end_date: "28/01/2022", nb_travelers: 4, total_price: 700)
fourthb.renter = kevin
fourthb.island = shelterIsland # Owner Mickael
fourthb.save!
puts "Booking #{fourthb.id} created"

fifthb = Booking.new(start_date: "23/08/2022", end_date: "31/08/2022", nb_travelers: 5, total_price: 2700)
fifthb.renter = kevin
fifthb.island = narval # owner Coralie
fifthb.save!
puts "Booking #{fifthb.id} created"


puts "Seeds Done 👍"
