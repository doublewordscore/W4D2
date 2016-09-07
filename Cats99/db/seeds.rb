# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.destroy_all
cat1 = Cat.create(name: "tommy", birth_date: "2015/01/20", color: "red", sex: "M", description: "Fun!")
cat2 = Cat.create(name: "oscar", birth_date: "2015/01/19", color: "blue", sex: "M", description: "Great!")
cat3 = Cat.create(name: "leen", birth_date: "2015/01/18", color: "yellow", sex: "F", description: "Smart!")

CatRentalRequest.destroy_all
rental1 = CatRentalRequest.create(cat_id:cat1.id, start_date:"2016/01/01", end_date:"2016/01/30")
rental2 = CatRentalRequest.create(cat_id:cat1.id, start_date:"2016/01/15", end_date:"2016/02/15")
rental3= CatRentalRequest.create(cat_id:cat1.id, start_date:"2016/03/15", end_date:"2016/03/19")
rental4 = CatRentalRequest.create(cat_id:cat2.id, start_date:"2016/01/01", end_date:"2016/01/15")
