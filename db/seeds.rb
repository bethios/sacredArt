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

puts "#{Category.count} categories created"
