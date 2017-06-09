require 'csv'


Category.create!(
  name: "Original Art",
  image: "original.jpg"
)
Category.create!(
    name: "Prints",
    image: "prints.jpg"
)
Category.create!(
    name: "Stationery",
    image: "stationery.jpg"
)
Category.create!(
    name: "Jewelry",
    image: "jewelry.jpg"
)
Category.create!(
    name: "Wearables",
    image: "wearable.jpg"
)
Category.create!(
    name: "Home & Self Care",
    image: "home.jpg"
)

admin = User.create!(
    name:     'Admin User',
    email:    'admin@example.com',
    password: 'helloworld',
    role:     'admin'
)

member = User.create!(
    name:     'Member User',
    email:    'member@example.com',
    password: 'helloworld'
)

#csv_text = File.read('Artist_list_category.csv')
#csv = CSV.parse(csv_text, :headers => true)
#csv.each do |row|
#  Artist.create!(row.to_hash)
#end

puts "#{Category.count} categories created"
#puts "#{Artist.count} artists imported"
