# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

pedrocb = User.create(email: "pedro@hotmail.com", username: "pedrocb", password: "123456")
tiagobot = User.create(email: "tiago@hotmail.com", username: "tiagobot", password: "123456")
joaobot = User.create(email: "joao@hotmail.com", username: "joaobot", password: "123456")
jb = User.create(email: "jb@hotmail.com", username: "jb", password: "123456")

r = Random.new
time = DateTime.now
for i in 0..200
  rand = r.rand(60..180)
  time -= rand.minutes
  FactoryGirl::create(:record, user_id: pedrocb.id, date: time)
  FactoryGirl::create(:record, user_id: tiagobot.id, date: time)
  FactoryGirl::create(:record, user_id: joaobot.id, date: time)
  FactoryGirl::create(:record, user_id: jb.id, date: time)
end
