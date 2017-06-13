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
    name:     'Sacred Art Admin',
    email:    'sacredartstore@gmail.com',
    password: 'helloworld',
    role:     'admin'
)

member = User.create!(
    name:     'Member User',
    email:    'member@example.com',
    password: 'helloworld',
    role:     'admin'
)

Hour.create!(
    title:  'Spring Hours',
    body:   'Monday: By Chance or Appointment
Tuesday - Friday: noon - 7pm
Saturday - Sunday: 11am - 6pm'
)

csv_text = File.read('faq.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  Faq.create!(row.to_hash)
end

csv_text = File.read('Artist_list_category.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  Artist.create!(row.to_hash)
end

puts "#{User.count} users created"
puts "#{Category.count} categories created"
puts "#{Faq.count} faqs created"
puts "#{Hour.count} hours created"
puts "#{Artist.count} artists created"