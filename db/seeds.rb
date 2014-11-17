# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Location.create([
   {near: 'Chelsea'}, 
   {near: 'Chinatown'}, 
   {near: 'Financial District'}, 
   {near: 'Greenwich Village'}, 
   {near: "Hell's Kitchen"}, 
   {near: 'Kips Bay'}, 
   {near: 'Lincoln Square'}, 
   {near: 'Little Italy'}, 
   {near: 'Lower East Side'}, 
   {near: 'Meat Packing District'}, 
   {near: 'Midtown East'},
   {near: 'Midtown West'},
   {near: 'Murray Hill'}, 
   {near: 'SoHo'}, 
   {near: 'Tribeca'}, 
   {near: 'Upper East Side'}, 
   {near: 'Upper West Side'}, 
   {near: 'West Village'}])

Category.create([
   {name: 'Bar', cat_id: '4bf58dd8d48988d116941735'}, 
   {name: 'Beer Garden', cat_id: '4bf58dd8d48988d117941735'}, 
   {name: 'Brewery', cat_id: '50327c8591d4c4b30a586d5d'}, 
   {name: 'Cocktail Bar', cat_id: '4bf58dd8d48988d11e941735'},
   {name: 'Dive Bar', cat_id: '4bf58dd8d48988d118941735'}, 
   {name: 'Gay Bar', cat_id: '4bf58dd8d48988d1d8941735'},
   {name: 'Hotel Bar', cat_id: '4bf58dd8d48988d1d5941735'}, 
   {name: 'Karaoke Bar', cat_id: '4bf58dd8d48988d120941735'},
   {name: 'Lounge', cat_id: '4bf58dd8d48988d121941735'},
   {name: 'Nightclub', cat_id: '4bf58dd8d48988d11f941735'},  
   {name: 'Pub', cat_id: '4bf58dd8d48988d11b941735'}, 
   {name: 'Speakeasy', cat_id: '4bf58dd8d48988d1d4941735'}, 
   {name: 'Sports Bar', cat_id: '4bf58dd8d48988d11d941735'}, 
   {name: 'Wine Bar', cat_id: '4bf58dd8d48988d123941735'}])