require 'rails_helper'

describe Machine do
  let(:owner) { Owner.create(name: "Big Sambo")}
  let(:machine) { Machine.create(location: "Sambo's 1", owner: owner)}

  it '#average_price' do
    machine.snacks.create(name: "coffee", price: 2)
    machine.snacks.create(name: "tea", price: 4)

    expect(machine.average_price).to eq(3)
  end
end
