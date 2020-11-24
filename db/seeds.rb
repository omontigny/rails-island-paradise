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
heart = Island.new(name: "Heart Island", description: "Beautiful island in shape of heart in australian coral reef. Perfect for honeymoon.", capacity: 2, ocean: "Pacific ocean", country: "Australia", price_per_day: 200, shark: true)
heart.owner = coralie
heart.save!
puts "Island #{heart.name} created"

cliff = Island.new(name: "Cliff Island", description: "If you like some challenge, the cliff island is for you. It is not easy to access but once you're on top the view is stunning.", capacity: 2, ocean: "Indian ocean", country: "Thailand", price_per_day: 70, shark: false)
cliff.owner = coralie
cliff.save!
puts "Island #{cliff.name} created"

roc = Island.new(name: "The Roc", description: "This island is perfect for people who wants to spend some time alone to better know themselves and discover the meaning of life.", capacity: 1, ocean: "Pacific ocean", country: "Indonesia", price_per_day: 50, shark: true)
roc.owner= coralie
roc.save!
puts "Island #{roc.name} created"

maple = Island.new(name: "Maple", description: "Perfect island for camping lovers and people who love the watch birds. You'll see it is the most quit place on earth.", capacity: 4, ocean: "Atlantic ocean", country: "Canada", price_per_day: 120, shark: false)
maple.owner = mickael
maple.save!
puts "Island #{maple.name} created"

hygge = Island.new(name: "Hygge", description: "If you love to meditate, this island if for you. The sunrise is absolutely gorgeous and will allow you to find the peace your searching for.", capacity: 6, ocean: "Norway sea", country: "Norway", price_per_day: 60, shark: false)
hygge.owner = mickael
hygge.save!
puts "Island #{hygge.name} created"

ko = Island.new(name: "Ko Yao Noi", description: "Perfect spot for family or friend holidays. The island is spacious and is full of activities to do. Moreover the island is seperated in two by a sand strip. It is great to isolate yourself and preserve privacy when you travel with a group." , capacity: 8, ocean: "Indian ocean", country: "Thailand", price_per_day: 300, shark: true)
ko.owner = mickael
ko.save!
puts "Island #{ko.name} created"

narval = Island.new(name: "Narval", description: "You want to live the best holiday ever ? Come to the Narval Island. The beaches are beautiful and the water is always warm.  You won't have a day without sun. It is the perfect place for pure leasure and relaxation." , capacity: 6, ocean: "Carribean sea", country: "Puerto Rico", price_per_day: 250, shark: true)
narval.owner = coralie
narval.save!
puts "User #{narval.name} created"

winty = Island.new(name: "Winty", description: "Winty is an world-famous island to admire whales. So take your binoculars and a coat (because it freezing) and come to discover natural beauties.", capacity: 2, ocean: "Groenland sea", country: "Groenland", price_per_day: 150, shark: false)
winty.owner = mickael
winty.save!
puts "Island #{winty.name} created"

macdo = Island.new(name: "MacDonney Island", description: "The MacDonney Island is a well furnished island. Indeed you will also have access to the haunted castle present on the island. Thrill and adventure guaranteed !", capacity: 5, ocean: "North sea", country: "Scotland", price_per_day: 175, shark: false)
macdo.owner=coralie
macdo.save!
puts "Island #{macdo.name} created"


firstb = Booking.new(start_date: "13/03/2021", end_date: "20/03/2021", nb_travelers: 3, total_price: 1400, status: "refused")
firstb.renter=kevin
firstb.island= heart
firstb.save!
puts "Booking #{firstb.id} created"

secondb = Booking.new(start_date: "13/07/2021", end_date: "20/07/2021", nb_travelers: 2, total_price: 490, status: "accepted")
secondb.renter=olivier
secondb.island= cliff
secondb.save!
puts "Booking #{secondb.id} created"

thirdb = Booking.new(start_date: "23/08/2021", end_date: "31/08/2021", nb_travelers: 5, total_price: 2700)
thirdb.renter=kevin
thirdb.island= ko
thirdb.save!
puts "Booking #{thirdb.id} created"

fourthb = Booking.new(start_date: "25/01/2021", end_date: "28/01/2021", nb_travelers: 4, total_price: 700)
fourthb.renter=kevin
fourthb.island= macdo
fourthb.save!
puts "Booking #{fourthb.id} created"


puts "Seeds Done 👍"
