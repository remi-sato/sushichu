maguro = Sushi.create!(
  name: "まぐろ", 
  price: 150, 
  description: "三崎産の美味しいまぐろ"
)

maguro.image.attach(
  io: File.open(Rails.root.join("db/seed_images/maguro.png")),
  filename: "maguro.png"
)

salmon = Sushi.create!(
  name: "サーモン", 
  price: 150, 
  description: "定番のおいしさ"
)

salmon.image.attach(
  io: File.open(Rails.root.join("db/seed_images/salmon.png")),
  filename: "salmon.png"
)

squid = Sushi.create!(
  name: "いか", 
  price: 150, 
  description: "いかと大葉の握り"
)

squid.image.attach(
  io: File.open(Rails.root.join("db/seed_images/squid.png")),
  filename: "squid.png"
)

egg = Sushi.create!(
  name: "たまご", 
  price: 100, 
  description: "子供も大好き" 
)

egg.image.attach(
  io: File.open(Rails.root.join("db/seed_images/egg.png")),
  filename: "egg.png"
)

shrimp = Sushi.create!(
  name: "えび", 
  price: 200, 
  description: "アルゼンチン産赤エビ"
)

shrimp.image.attach(
  io: File.open(Rails.root.join("db/seed_images/shrimp.png")),
  filename: "shrimp.png"
)