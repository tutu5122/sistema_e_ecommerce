Product.destroy_all

categories = Category.pluck(:name)

products = [
    { name: 'iPhone XS', description: 'Súper retina Screen', stock: 10, price: 900, sku: 'AIX0120', category: categories[0] },
    { name: 'Xiaomi Mi Mix 3', description: 'Borderless powerful, super cámera', stock: 12, price: 400, sku: 'XMM0312', category: categories[0] },
    { name: 'Xiaomi Pocophone', description: 'The best phone for millenials', stock: 15, price: 300, sku: 'XPP0313', category: categories[0] },
    { name: 'Samsung S10', description: 'Beautiful, elegant, powerful phone', stock: 10, price: 900, sku: 'S100901', category: categories[0] },

    { name: 'Zico Beach Sandal', description: 'The best sandal ever', stock: 50, price: 5, sku: 'ZSD009', category: categories[1] },
    { name: 'Adidas Superstart', description: 'The old school sneakers', stock: 13, price: 60, sku: 'ASS090', category: categories[1] },
    { name: 'Timberland Premium', description: 'The classic yellow boots', stock: 15, price: 100, sku: 'TPB132', category: categories[1] },

    { name: 'Men Wallet', description: 'Waterproof leather wallet', stock: 50, price: 20, sku: 'MW2323', category: categories[2] },
    { name: 'Keychain', description: 'Keep your keys together. Safe.', stock: 60, price: 2, sku: 'KC3245', category: categories[2] },
    { name: 'Casio L12 Watch', description: 'Never be late again, arrive on time', stock: 8, price: 50, sku: 'CW7788', category: categories[2] }
]

products.each do |product|
    cat = Category.find_by(name: product[:category])
    prod = Product.create(name: product[:name],
                          description: product[:description],
                          stock: product[:stock],
                          price: product[:price],
                          sku: product[:sku])

    prod.categories.push(cat)
    puts "Se ha creado el producto: #{prod.name} en la categoría: #{prod.categories.first.name}"
end
