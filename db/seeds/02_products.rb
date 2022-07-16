Product.destroy_all

categories = Category.pluck(:name)

products = [
    { name: 'iPhone XS', description: 'Súper retina Screen', price: 900, sku: 'AIX0120', category: categories[0] },
    { name: 'Xiaomi Mi Mix 3', description: 'Borderless powerful, super cámera', price: 400, sku: 'XMM0312', category: categories[0] },
    { name: 'Xiaomi Pocophone', description: 'The best phone for millenials', price: 300, sku: 'XPP0313', category: categories[0] },
    { name: 'Samsung S10', description: 'Beautiful, elegant, powerful phone', price: 900, sku: 'S100901', category: categories[0] },

    { name: 'Zico Beach Sandal', description: 'The best sandal ever', price: 5, sku: 'ZSD009', category: categories[1] },
    { name: 'Adidas Superstart', description: 'The old school sneakers', price: 60, sku: 'ASS090', category: categories[1] },
    { name: 'Timberland Premium', description: 'The classic yellow boots', price: 100, sku: 'TPB132', category: categories[1] },
 
    { name: 'Men Wallet', description: 'Waterproof leather wallet', price: 20, sku: 'MW2323', category: categories[2] },
    { name: 'Keychain', description: 'Keep your keys together. Safe.', price: 2, sku: 'KC3245', category: categories[2] },
    { name: 'Casio L12 Watch', description: 'Never be late again, arrive on time', price: 50, sku: 'CW7788', category: categories[2] }
]


products.each do |product|
    cat = Category.find_by(name: product[:category])
    prod = Product.create(name: product[:name],
                          description: product[:description],
                          price: product[:price],
                          sku: product[:sku])

    prod.categories.push(cat)
    puts "Se ha creado el producto: #{prod.name} en la categoría: #{prod.categories.first.name}"
end
