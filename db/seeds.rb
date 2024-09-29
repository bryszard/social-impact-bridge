require 'faker'

# Create an admin user
User.create!(
  email: "theheartyadmin@serdeczna.pl",
  password: "mighty-duck-gordon-brown",
  password_confirmation: "mighty-duck-gordon-brown",
  admin: true
)

# Emojis for the logos
EMOJIS = [ '🌍', '🌱', '📚', '🐾', '💼', '⚽', '🎨', '🚑', '🏳️‍🌈', '🌈', '🏔️', '🌻', '🦋', '🍀', '🌿', '🍎', '🚴', '🏡', '💡', '⚖️' ]

# Array of possible project statuses
PROJECT_STATUSES = %w[planned ongoing finished]

# Array of nonprofit-specific suffixes for names
NONPROFIT_SUFFIXES = [
  "Foundation",
  "Trust",
  "Initiative",
  "Association",
  "Fund",
  "Alliance",
  "Network",
  "Coalition",
  "Action Group",
  "Charity",
  "Outreach",
  "Partnership",
  "Center"
]

# Arrays for building nonprofit names
BRILLIANT_WORDS = [
  "Hope", "Dream", "Vision", "Change", "Future", "Impact", "Light",
  "Action", "Aspire", "Unity", "Growth", "Empower", "Compassion",
  "Care", "Inspire", "Harmony", "Justice", "Equity", "Peace"
]

ANIMALS = [
  "Eagle", "Lion", "Dolphin", "Elephant", "Wolf", "Hawk", "Bear",
  "Butterfly", "Tiger", "Penguin", "Panther", "Fox", "Owl", "Falcon",
  "Whale", "Otter", "Hummingbird", "Giraffe", "Rhino"
]

# Create 100 nonprofits
100.times do
  nonprofit_name = "#{BRILLIANT_WORDS.sample} #{ANIMALS.sample} #{NONPROFIT_SUFFIXES.sample}"

  nonprofit = Nonprofit.create!(
    name: nonprofit_name,
    description: Faker::Lorem.paragraph(sentence_count: 5),
    area_of_activity: NONPROFIT_CONFIG[:areas_of_activity].sample,
    operating_in: NONPROFIT_CONFIG[:operating_in].sample,
    desired_impact_on: NONPROFIT_CONFIG[:desired_impact_on].sample,
    income: Faker::Number.between(from: 5_000, to: 1_000_000),
    logo: EMOJIS.sample
  )

  # Create between 1 and 10 projects for each nonprofit
  rand(1..10).times do
    Project.create!(
      name: Faker::App.name,
      description: Faker::Lorem.paragraph(sentence_count: 3),
      impact_on: NONPROFIT_CONFIG[:desired_impact_on].sample,
      budget: Faker::Number.between(from: 5_000, to: 1_000_000),
      area_of_activity: NONPROFIT_CONFIG[:areas_of_activity].sample,
      status: PROJECT_STATUSES.sample,
      nonprofit: nonprofit
    )
  end
end

puts "100 nonprofits and associated projects created successfully!"
