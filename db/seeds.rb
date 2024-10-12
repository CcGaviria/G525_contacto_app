# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Seed country Colombia
colombia = Country.create!(name: 'Colombia')

# Seed departamentos
amazonas = Department.create!(name: 'Amazonas', country: colombia)
bogota = Department.create!(name: 'Bogotá', country: colombia)

# Seed ciudades para Amazonas
Leticia = City.create!(name: 'Leticia', department: amazonas)
PuertoNarino = City.create!(name: 'Puerto Narino', department: amazonas)

# Seed ciudades para Bogotá
BogotaCity = City.create!(name: 'Bogotá', department: bogota)

puts "Seed data created successfully!"