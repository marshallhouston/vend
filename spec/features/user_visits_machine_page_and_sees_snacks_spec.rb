require 'rails_helper'

describe "As a User" do
  describe "When I visit a vending machine page" do
    scenario "I see all snacks and their prices at that machine" do
      sam = Owner.create(name: "Sam's Snacks")
      machine = sam.machines.create(location: "Don's Mixed Drinks")
      snack1 = machine.snacks.create(name: "burger", price: 2.50)
      snack2 = machine.snacks.create(name: "coffee", price: 3.50)

      visit machine_path(machine)

      expect(page).to have_content(snack1.name)
      expect(page).to have_content(snack1.price)
      expect(page).to have_content(snack2.name)
      expect(page).to have_content(snack2.price)
      expect(page).to have_content("Average Price: $3")
    end
  end
end
