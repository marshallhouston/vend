require 'rails_helper'

describe "As a user" do
  describe "When I vist a snack page" do
    scenario "I see information about the snack" do
      sam = Owner.create(name: "Sam's Snacks")
      machine = sam.machines.create(location: "Don's Mixed Drinks")
      snack1 = machine.snacks.create(name: "burger", price: 2.50)
      snack2 = machine.snacks.create(name: "coffee", price: 3.50)

      visit machine_snack_path(machine, snack1)

      expect(page).to have_content(snack1.name)
      expect(page).to_not have_content(snack2.name)
      expect(page).to have_content(snack1.price)
      expect(page).to have_content("Locations")
      expect(page).to have_content(snack1.machine.location)
      expect(page).to have_content("#{snack1.machine.location} (2 kinds of snacks, average price of $3)")
    end
  end
end
