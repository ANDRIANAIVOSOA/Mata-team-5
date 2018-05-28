# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Item.destroy_all
item1 = Item.create(title: 'chaton noir', description: 'Chaton noir emprunter chez photos-animaux', price: 5.80, image_url: 'saka_2.jpg')
item2 = Item.create(title: 'chaton bleu', description: 'Chaton bleu emprunter chez photos-animaux', price: 4.60, image_url: 'saka_3.jpg')
item3 = Item.create(title: 'chaton lilas', description: 'Chaton lilas emprunter chez photos-animaux', price: 5.60, image_url: 'saka_4.jpg')
item4 = Item.create(title: 'chaton fauve', description: 'Chaton fauve emprunter chez photos-animaux', price: 5.00, image_url: 'saka_5.jpg')
item5 = Item.create(title: 'chaton blanc', description: 'Chaton blanc emprunter chez photos-animaux', price: 6.70, image_url: 'saka_6.jpg')