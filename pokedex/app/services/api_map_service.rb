# Getting data from the API and mapping it to our Pokemon model.
class ApiMapService
  # Data from general Pokemon API
  def self.map_api_to_model(base_data)
    {
      name: base_data["name"],
      poke_id: base_data["id"],
      types: base_data["types"].map { |t| t["type"]["name"] },
      height: base_data["height"],
      weight: base_data["weight"],
      sprite_url: base_data["sprites"]["front_default"],
      stats: base_data["stats"].map { |s| { s["stat"]["name"] => s["base_stat"] } }.reduce({}, :merge),
      abilities: base_data["abilities"].map { |a| a["ability"]["name"] }
    }
  end

  # Data from species API call
  def self.map_species_to_model(species_data)
    {
    description: get_species_description(species_data),
    species: get_species_title(species_data),
    habitat: species_data["habitat"]&.dig("name")&.capitalize,
    is_legendary: species_data["is_legendary"],
    is_mythical: species_data["is_mythical"],
    capture_rate: species_data["capture_rate"],
    base_happiness: species_data["base_happiness"],
    shape: species_data["shape"]&.dig("name")&.capitalize,
    growth_rate: species_data["growth_rate"]&.dig("name")&.humanize,
    color: species_data["color"]&.dig("name")&.capitalize,
    gender_ratio: calculate_gender_ratio(species_data["gender_rate"]),
    generation: species_data["generation"]&.dig("name")&.titleize
    }
  end

  def self.get_species_description(species_data)
    entry = species_data["flavor_text_entries"].find { |e| e["language"]["name"] == "en" }
    if entry
        flavor_text = entry["flavor_text"]
        flavor_text.gsub(/\n|\f/, " ")
    else
        "No description available."
    end
  end

  def self.get_species_title(species_data)
    entry = species_data["genera"].find { |g| g["language"]["name"] == "en" }
    if entry
        entry["genus"]
    else
        "Unknown"
    end
  end

  def self.calculate_gender_ratio(rate)
    return "Genderless" if rate == -1
    female = (rate / 8.0 * 100).round
    male = 100 - female
    "♂ #{male}%, ♀ #{female}%"
  end
end
