# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

SpendItem.destroy_all
Spending.destroy_all
Category.destroy_all
User.destroy_all

user = User.create(name: 'Ram', email: 'user1@test.com', password: 'password')

Category.create(
  [
    {
      name: 'groceries',
      icon: 'shopping_cart',
      user_id: user.id
    },
    {
      name: 'shopping',
      icon: 'shopping_bag',
      user_id: user.id
    },
    {
      name: 'Bills',
      icon: 'receipt_long',
      user_id: user.id
    }
  ]
)

Spending.create([
                  {
                    name: 'weeky groceries',
                    amount: 25.50,
                    author_id: user.id
                  }
                ])

SpendItem.create([
                   {
                     spending_id: Spending.first.id,
                     category_id: Category.first.id
                   }
                 ])

print "#{User.all.count} users added \n"
print "#{Category.all.count} categories added \n"
print "#{Spending.all.count} spendings added \n"
print "#{SpendItem.all.count} spenditems added \n"
