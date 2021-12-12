require 'rails_helper'

RSpec.describe Admin::Shelter do
  before(:each) do
    @shelter_1 = Admin::Shelter.create(name: 'Aurora shelter', city: 'Aurora, CO', foster_program: false, rank: 9)
    @shelter_2 = Admin::Shelter.create(name: 'RGV animal shelter', city: 'Harlingen, TX', foster_program: false, rank: 5)
    @shelter_3 = Admin::Shelter.create(name: 'Fancy pets of Colorado', city: 'Denver, CO', foster_program: true, rank: 10)
    @shelter_1.pets.create(name: 'Mr. Pirate', breed: 'tuxedo shorthair', age: 5, adoptable: true)
    @shelter_1.pets.create(name: 'Clawdia', breed: 'shorthair', age: 3, adoptable: true)
    @shelter_3.pets.create(name: 'Lucille Bald', breed: 'sphynx', age: 8, adoptable: true)
  end

  it 'lists all the shelters in reverse alphabetical order' do
    shelters = [@shelter_2, @shelter_3, @shelter_1]
    expect(Admin::Shelter.admin_display).to eq(shelters)
  end
end