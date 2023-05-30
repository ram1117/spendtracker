# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Category.destroy_all
User.destroy_all

user = User.create(name: 'Ram')

categories = Category.create(
  [
    {
      name: 'groceries',
      icon: 'some icon url',
      user_id: user.id
    },
    {
      name: 'shopping',
      icon: 'some icon url',
      user_id: user.id
    },
    {
      name: 'Bills',
      icon: 'some icon url',
      user_id: user.id
    }
  ]
)
