# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Album.create(name: "BOOM!", genre: "Electronic", release_date: "2011-13-10")
Artist.create(name: "Bright Eyes", city: "Omaha", bio: "This is the biography. That is all.", url: "brighteyes.com")