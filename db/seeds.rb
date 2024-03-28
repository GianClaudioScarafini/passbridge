require "open-uri"
Purchase.destroy_all
ShippingMethod.destroy_all
Item.destroy_all
User.destroy_all


file = URI.open("https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
user1 = User.new(
  first_name: "Lisa",
  last_name: "Müller",
  email: "lisa@gmail.com",
  address: "Karl-Marx-Allee 1",
  city: "Berlin",
  state: "Berlin",
  zip: "10178",
  nation: "Germany",
  phone: "01799900222",
  password: "123456"
)
user1.photo.attach(io: file, filename: "user1.png", content_type: "image/png")
user1.save


file = URI.open("https://images.unsplash.com/photo-1463453091185-61582044d556?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHByb2ZpbGUlMjBwaWN0dXJlfGVufDB8fDB8fHww")
user2 = User.new(

  first_name: "Eric",
  last_name: "Smith",
  email: "eric@gmail.com",
  address: "109 Alt-Heiligensee",
  city: "Berlin",
  state: "Berlin",
  zip: "79540",
  nation: "Germany",
  phone: "01788811333",
  password: "123456"
)
user2.photo.attach(io: file, filename: "user2.png", content_type: "image/png")
user2.save


file = URI.open("https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=3087&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
user3 = User.new(
  first_name: "Laura",
  last_name: "Nicolas",
  email: "laura@gmail.com",
  address: "Schönhauser Allee 127",
  city: "Berlin",
  state: "Berlin",
  zip: "10437",
  nation: "Germany",
  phone: "01799900888",
  password: "123456"
)
user3.photo.attach(io: file, filename: "user1.png", content_type: "image/png")
user3.save


file = URI.open("https://images.unsplash.com/photo-1463453091185-61582044d556?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHByb2ZpbGUlMjBwaWN0dXJlfGVufDB8fDB8fHww")
user4 = User.new(

  first_name: "Gian",
  last_name: "Scarafini",
  email: "gian@gmail.com",
  address: "Am Festungsgraben 2",
  city: "Berlin",
  state: "Berlin",
  zip: "10117",
  nation: "Germany",
  phone: "01788811444",
  password: "123456"
)
user4.photo.attach(io: file, filename: "user2.png", content_type: "image/png")
user4.save


file = URI.open("https://images.unsplash.com/photo-1629608444154-6d052691632f?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGJyaWNrc3xlbnwwfHwwfHx8MA%3D%3D")
item1 = Item.new(
  name: "Regular bricks",
  location: "Kriegsstraße 100, 76133 Karlsruhe, Germany",
  description: "Solid construction bricks in good shape.",
  price: 6.10,
  condition: "good",
  quantity: 200,
  user: user1,
  start_date: Date.today,
  end_date: Date.today + 30
)
item1.images.attach(io: file, filename: "item1_1.png", content_type: "image/png")
item1.save

file = URI.open("https://plus.unsplash.com/premium_photo-1675103339078-88b54e155e71?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGJyaWNrc3xlbnwwfHwwfHx8MA%3D%3D")
item1.images.attach(io: file, filename: "item1_2.png", content_type: "image/png")
item1.save


file = URI.open("https://images.unsplash.com/photo-1542546068979-b6affb46ea8f?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjd8fG9mZmljZSUyMHRhYmxlfGVufDB8fDB8fHww")
item2 = Item.new(
  name: "Modern desk",
  location: "Europa-Allee 6, 60327 Frankfurt am Main, Germany",
  description: "Beautiful and almost new working desk with minimal design.",
  price: 130.00,
  condition: "like new",
  quantity: 1,
  user: user1,
  start_date: Date.today + 5,
  end_date: Date.today + 12
)
item2.images.attach(io: file, filename: "item2_1.png", content_type: "image/png")
item2.save

file = URI.open("https://images.unsplash.com/photo-1529767203443-a617595c8825?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzJ8fG9mZmljZSUyMHRhYmxlfGVufDB8fDB8fHww")
item2.images.attach(io: file, filename: "item2_1.png", content_type: "image/png")
item2.save


file = URI.open("https://images.unsplash.com/photo-1560435650-7ec2e17ba926?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjZ8fGJyaWNrc3xlbnwwfHwwfHx8MA%3D%3D")
item3 = Item.new(
  name: "White bricks",
  location: "Herzog-Wilhelm-Straße 28, 80331 München, Germany",
  description: "White construction bricks in different sizes.",
  price: 7.50,
  condition: "good",
  quantity: 100,
  user: user1,
  start_date: Date.today,
  end_date: Date.today + 50
)
item3.images.attach(io: file, filename: "item3_1.png", content_type: "image/png")
item3.save

file = URI.open("https://images.unsplash.com/photo-1603517432573-707d595ef8ab?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjh8fGJyaWNrc3xlbnwwfHwwfHx8MA%3D%3D")
item3.images.attach(io: file, filename: "item3_2.png", content_type: "image/png")
item3.save


file = URI.open("https://images.unsplash.com/photo-1573871924474-04f515cf7399?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTR8fGJyaWNrfGVufDB8fDB8fHww")
item4 = Item.new(
  name: "Hollow bricks",
  location: "Gleimstraße 55, 10437 Berlin, Germany",
  description: "Hollow bricks for construction.",
  price: 5.20,
  condition: "regular",
  quantity: 350,
  user: user4,
  start_date: Date.today,
  end_date: Date.today + 100
)
item4.images.attach(io: file, filename: "item4_1.png", content_type: "image/png")
item4.save

file = URI.open("https://images.unsplash.com/photo-1550007976-1cb41faa2356?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTY0fHxicmlja3N8ZW58MHx8MHx8fDA%3D")
item4.images.attach(io: file, filename: "item4_2.png", content_type: "image/png")
item4.save


file = URI.open("https://images.unsplash.com/photo-1489269637500-aa0e75768394?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8ZWFtZXMlMjBibGFjayUyMGNoYWlyfGVufDB8fDB8fHww")
item5 = Item.new(
  name: "Black Eames chair with armrests",
  location: "Waldschmidtstraße 6, 60316 Frankfurt am Main, Germany",
  description: "Black Eames chair with some small scratches.",
  price: 249.00,
  condition: "very good",
  quantity: 1,
  user: user1,
  start_date: Date.today + 10,
  end_date: Date.today + 300
)
item5.images.attach(io: file, filename: "item5_1.png", content_type: "image/png")
item5.save

file = URI.open("https://images.unsplash.com/photo-1656214311858-a47d03973f2c?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8ZWFtZXMlMjBibGFjayUyMGNoYWlyfGVufDB8fDB8fHww")
item5.images.attach(io: file, filename: "item5_2.png", content_type: "image/png")
item5.save


file = URI.open("https://images.unsplash.com/photo-1517705008128-361805f42e86?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZWFtZXMlMjB3aGl0ZSUyMGNoYWlyfGVufDB8fDB8fHww")
item6 = Item.new(
  name: "White Eames chairs",
  location: "Hedwigstraße 20, 04315 Leipzig, Germany",
  description: "Two White Eames chairs as new.",
  price: 290.00,
  condition: "like new",
  quantity: 2,
  user: user1,
  start_date: Date.today,
  end_date: Date.today + 25
)
item6.images.attach(io: file, filename: "item6_1.png", content_type: "image/png")
item6.save

file = URI.open("https://images.unsplash.com/photo-1509952762474-040a7a370e17?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8ZWFtZXMlMjB3aGl0ZSUyMGNoYWlyfGVufDB8fDB8fHww")
item6.images.attach(io: file, filename: "item6_2.png", content_type: "image/png")
item6.save


file = URI.open("https://images.unsplash.com/photo-1630835016348-ba2854bbf78b?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bXVqaSUyMGJlZHxlbnwwfHwwfHx8MA%3D%3D")
item7 = Item.new(
  name: "Night table set",
  location: "Lützner Str. 91, 04177 Leipzig, Germany",
  description: "Night table set with drawers in japanese style.",
  price: 88.00,
  condition: "very good",
  quantity: 2,
  user: user1,
  start_date: Date.today + 2,
  end_date: Date.today + 45
)
item7.images.attach(io: file, filename: "item7_1.png", content_type: "image/png")
item7.save

file = URI.open("https://images.unsplash.com/photo-1630835016331-1a9b60581820?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bXVqaSUyMGJlZHxlbnwwfHwwfHx8MA%3D%3D")
item7.images.attach(io: file, filename: "item7_2.png", content_type: "image/png")
item7.save


file = URI.open("https://images.unsplash.com/photo-1621687438255-08b63e0b64ec?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjh8fGNhcnBldHxlbnwwfHwwfHx8MA%3D%3D")
item8 = Item.new(
  name: "Antique carpet",
  location: "Prinz-Friedrich-Leopold-Straße 6, 14129 Berlin, Germany",
  description: "Arabian style arpet with measurements 120 x 200 cm.",
  price: 36.40,
  condition: "regular",
  quantity: 1,
  user: user4,
  start_date: Date.today + 3,
  end_date: Date.today + 20
)
item8.images.attach(io: file, filename: "item8_1.png", content_type: "image/png")
item8.save

file = URI.open("https://images.unsplash.com/photo-1602795493253-c1da1fed546a?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzJ8fGNhcnBldHxlbnwwfHwwfHx8MA%3D%3D")
item8.images.attach(io: file, filename: "item8_2.png", content_type: "image/png")
item8.save


file = URI.open("https://images.unsplash.com/photo-1555041469-a586c61ea9bc?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzJ8fHNvZmElMjBncmVlbnxlbnwwfHwwfHx8MA%3D%3D")
item9 = Item.new(
  name: "Green 3-people sofa",
  location: "Kollwitzstraße 16, 10405 Berlin, Germany",
  description: "3 people sofa very comfortable for naps and tv time.",
  price: 435.00,
  condition: "very good",
  quantity: 1,
  user: user4,
  start_date: Date.today,
  end_date: Date.today + 70
)
item9.images.attach(io: file, filename: "item9_1.png", content_type: "image/png")
item9.save

file = URI.open("https://images.unsplash.com/photo-1520687052856-eb38da98adeb?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzV8fHNvZmElMjBncmVlbnxlbnwwfHwwfHx8MA%3D%3D")
item9.images.attach(io: file, filename: "item9_2.png", content_type: "image/png")
item9.save


file = URI.open("https://images.unsplash.com/photo-1640126288964-60593b8563e1?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHVzZWQlMjBmdXJuaXR1cmV8ZW58MHx8MHx8fDA%3D")
item10 = Item.new(
  name: "Used chairs",
  location: "Herrfurthstraße 29, 12049 Berlin, Germany",
  description: "A bunch of used chair in different styles and conditions.",
  price: 0.00,
  condition: "bad",
  quantity: 40,
  user: user2,
  start_date: Date.today,
  end_date: Date.today + 7
)
item10.images.attach(io: file, filename: "item10_1.png", content_type: "image/png")
item10.save

file = URI.open("https://images.unsplash.com/photo-1546552616-6c9bd78ec972?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
item10.images.attach(io: file, filename: "item10_2.png", content_type: "image/png")
item10.save


file = URI.open("https://images.unsplash.com/photo-1645401534895-ff4be8e98e75?q=80&w=3088&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
item11 = Item.new(
  name: "Pair of used sofas",
  location: "Albersloher Weg 198, 48155 Münster, Germany",
  description: "Two used sofas to be recycled.",
  price: 40.00,
  condition: "bad",
  quantity: 2,
  user: user2,
  start_date: Date.today + 7,
  end_date: Date.today + 37
)
item11.images.attach(io: file, filename: "item11_1.png", content_type: "image/png")
item11.save

file = URI.open("https://images.unsplash.com/photo-1458225991256-551e9ddc7782?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDN8fHxlbnwwfHx8fHw%3D")
item11.images.attach(io: file, filename: "item11_2.png", content_type: "image/png")
item11.save


file = URI.open("https://images.unsplash.com/photo-1616661317985-aeb2a13016d6?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHBpcGVzfGVufDB8fDB8fHww")
item12 = Item.new(
  name: "Metal pipes",
  location: "Heeremansweg 11-13, 48167 Münster, Germany",
  description: "Two types of metal pypes in different diameters and lenghts.",
  price: 190.00,
  condition: "good",
  quantity: 250,
  user: user2,
  start_date: Date.today,
  end_date: Date.today + 90
)
item12.images.attach(io: file, filename: "item12_1.png", content_type: "image/png")
item12.save

file = URI.open("https://plus.unsplash.com/premium_photo-1674406051718-0d4bc46f5b93?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cGlwZXN8ZW58MHx8MHx8fDA%3D")
item12.images.attach(io: file, filename: "item12_2.png", content_type: "image/png")
item12.save


file = URI.open("https://plus.unsplash.com/premium_photo-1676154517862-3d39720f63f5?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YmV0b258ZW58MHx8MHx8fDA%3D")
item13 = Item.new(
  name: "Betton blocks",
  location: "Am Bach 20, 33602 Bielefeld, Germany",
  description: "Solid square betton blocks.",
  price: 930.10,
  condition: "as new",
  quantity: 96,
  user: user2,
  start_date: Date.today + 10,
  end_date: Date.today + 50
)
item13.images.attach(io: file, filename: "item13_1.png", content_type: "image/png")
item13.save

file = URI.open("https://images.unsplash.com/photo-1564864829977-701822524526?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGJldG9ufGVufDB8fDB8fHww")
item13.images.attach(io: file, filename: "item13_2.png", content_type: "image/png")
item13.save


file = URI.open("https://images.unsplash.com/photo-1623111771732-6eadcf47b60b?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YmF0aHR1YiUyMGFudGlrfGVufDB8fDB8fHww")
item14 = Item.new(
  name: "Antique bath tub",
  location: "Schwesterstraße 64, 42285 Wuppertal, Germany",
  description: "Greenish antique bath thub ready to use.",
  price: 150.00,
  condition: "good",
  quantity: 1,
  user: user2,
  start_date: Date.today,
  end_date: Date.today + 300
)
item14.images.attach(io: file, filename: "item14_1.png", content_type: "image/png")
item14.save

file = URI.open("https://images.unsplash.com/photo-1623114112825-af5da54b79bb?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8YmF0aHR1YiUyMGFudGlrfGVufDB8fDB8fHww")
item14.images.attach(io: file, filename: "item14_2.png", content_type: "image/png")
item14.save


file = URI.open("https://images.unsplash.com/photo-1468781552669-f1039d18ed34?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8d29vZGVuJTIwZG9vciUyMG9sZHxlbnwwfHwwfHx8MA%3D%3D")
item15 = Item.new(
  name: "Wooden old doors",
  location: "Albertus-Magnus-Platz, 50923 Köln, Germany",
  description: "Pair of wooden old doors to be refurbished.",
  price: 24.00,
  condition: "regular",
  quantity: 2,
  user: user2,
  start_date: Date.today,
  end_date: Date.today + 80
)
item15.images.attach(io: file, filename: "item15_1.png", content_type: "image/png")
item15.save

file = URI.open("https://images.unsplash.com/photo-1516619372219-1bf6ebdce4a0?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHdvb2RlbiUyMGRvb3IlMjBvbGR8ZW58MHx8MHx8fDA%3D")
item15.images.attach(io: file, filename: "item15_2.png", content_type: "image/png")
item15.save


file = URI.open("https://images.unsplash.com/photo-1647592097679-b8f57f875e2f?q=80&w=2952&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
item16 = Item.new(
  name: "Wooden old windows",
  location: "Gustav-Heinemann-Straße 80, 51377 Leverkusen, Germany",
  description: "Set of wooden old windows to be recycled.",
  price: 56.00,
  condition: "regular",
  quantity: 3,
  user: user2,
  start_date: Date.today,
  end_date: Date.today + 60
)
item16.images.attach(io: file, filename: "item16_1.png", content_type: "image/png")
item16.save

file = URI.open("https://images.unsplash.com/photo-1647592098428-ec3c05dbaeb3?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fHw%3D")
item16.images.attach(io: file, filename: "item16_2.png", content_type: "image/png")
item16.save


ShippingMethod.create!(method: "foot", co2_ratio: 0.0)
ShippingMethod.create!(method: "bike", co2_ratio: 0.0)
ShippingMethod.create!(method: "airplane", co2_ratio: 12500.0)
ShippingMethod.create!(method: "car", co2_ratio: 200.0)
ShippingMethod.create!(method: "motorcycle", co2_ratio: 100.0)
ShippingMethod.create!(method: "electric_motorcycle", co2_ratio: 0.0)
ShippingMethod.create!(method: "electric_car", co2_ratio: 0.0)
ShippingMethod.create!(method: "truck", co2_ratio: 2000.0)
ShippingMethod.create!(method: "drone", co2_ratio: 0.0)
