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
  }
])

items = Item.create([
  {
    vending_machine_id: vending_machines.first.id,
    price: 0.75,
    quantity: 35,
    description: 'Green Lightsaber'
  },
  {
    vending_machine_id: vending_machines.first.id,
    price: 0.90,
    quantity: 20,
    description: 'Blue Lightsaber'
  },
  {
    vending_machine_id: vending_machines.first.id,
    price: 1.00,
    quantity: 15,
    description: 'Red Lightsaber'
  },
  {
    vending_machine_id: vending_machines.first.id,
    price: 1.15,
    quantity: 30,
    description: 'Purple Lightsaber'
  },
  {
    vending_machine_id: vending_machines.first.id,
    price: 0.50,
    quantity: 40,
    description: 'Yellow Lightsaber'
  },
  {
    vending_machine_id: vending_machines.first.id,
    price: 1.50,
    quantity: 20,
    description: 'Orange Lightsaber'
  },
  {
    vending_machine_id: vending_machines.first.id,
    price: 0.68,
    quantity: 40,
    description: 'Cyan Lightsaber'
  },
])


