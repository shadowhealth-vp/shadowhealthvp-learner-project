require "rails_helper"

RSpec.describe Pokemon do
  it "is valid with a name" do
    pokemon = Pokemon.new(name: "bulbasaur", poke_id: 1)
    expect(pokemon).to be_valid
  end

  it "is invalid without a name" do
    pokemon = Pokemon.new(name: nil, poke_id: 2)
    expect(pokemon).not_to be_valid
  end

  it "has a valid sprite URL" do
    pokemon = Pokemon.new(sprite_url: "https://testing.com/1.png")
    expect(pokemon.sprite_url).to match(/\.png\z/)
  end
end
