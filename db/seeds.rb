
require "csv"

# Clear existing data before importing the CSV
Product.destroy_all
Category.destroy_all

# Read the CSV file
csv_file = Rails.root.join("db", "products.csv")
csv_data = File.read(csv_file)
products = CSV.parse(csv_data, headers: true)

# Create categories and products from the CSV
products.each do |row|
  category_name = row["category"]

  category = Category.find_or_create_by!(name: category_name)

  Product.create!(
    title: row["name"],
    description: row["description"],
    price: row["price"],
    stock_quantity: row["stock quantity"],
    category: category
  )
end

puts "Imported #{Product.count} products."
puts "Created #{Category.count} categories."
