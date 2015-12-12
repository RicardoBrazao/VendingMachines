# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
  {
    first_name: 'Luke',
    last_name: 'Skywalker'
  }
])

vending_machines = VendingMachine.create([
  {
    model: 'R2D2',
    description: 'Lightsaber vending machine',
    owner_id: users.first.id,
    max_capacity: 200,
    max_change: 100,
    change: {
      '0.01' => 50,
      '0.02' => 50,
      '0.05' => 50,
      '0.10' => 10,
      '0.20' => 50,
      '0.50' => 50,
      '1.00' => 40,
      '2.00' => 10
    }
  },
  {
    model: 'C3P0',
    description: 'Beverage vending machine',
    owner_id: users.first.id,
    max_capacity: 200,
    max_change: 100,
    change: {
      '0.01' => 50,
      '0.02' => 50,
      '0.05' => 50,
      '0.10' => 10,
      '0.20' => 50,
      '0.50' => 50,
      '1.00' => 40,
      '2.00' => 10
    }
  }
])