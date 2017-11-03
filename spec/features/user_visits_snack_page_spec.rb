require 'rails_helper'

describe "As a user" do
  describe "When I vist a snack page" do
    scenario "I see information about the snack" do
      sam = Owner.create(name: "Sam's Snacks")
      machine = sam.machines.create(location: "Don's Mixed Drinks")
      snack1 = machine.snacks.create(name: "burger", price: 2.50)
      snack2 = machine.snacks.create(name: "coffee", price: 3.50)

      visit snack_path(snack1)

      expect(page).to have_content(snack1.name)
      expect(page).to_not have_content(snack2.name)
      expect(page).to have_content(snack1.price)
      expect(page).to have_content("Locations")
      expect(page).to have_content(snack1.machines.first.location)
      expect(page).to have_content("#{snack1.machines.first.location} (2 kinds of snacks, average price of $3.00)")
    end

    context "that is at multiple vending machines" do
      scenario "I see info about the different machines" do

      sam = Owner.create(name: "Sam's Snacks")
      snack = Snack.create(name: "burger", price: 2.50)
      machine1 = snack.machines.create(location: "Don's Mixed Drinks", owner: sam)
      machine2 = snack.machines.create(location: "Bobo", owner: sam)
      machine1.snacks.create(name: "coffee", price: 3.50)
      visit snack_path(snack)

      expect(page).to have_content(machine1.location)
      expect(page).to have_content(machine2.location)
      expect(page).to have_content("#{snack.machines.first.location} (2 kinds of snacks, average price of $3.00)")
      end
    end
  end
end
