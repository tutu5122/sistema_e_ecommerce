Variant.destroy_all

products =  [
    { name: 'iPhone XS', color: ['Plateado', 'Dorado'], size: ['No aplica'] },
    { name: 'Xiaomi Mi Mix 3', color: ['Blanco', 'Azul', 'Rojo', 'Amarillo', 'Verde', 'Negro'], size: ['No aplica'] },
    { name: 'Xiaomi Pocophone', color: ['Amarillo', 'Verde', 'Negro', 'Plateado', 'Dorado'], size: ['No aplica'] },
    { name: 'Samsung S10', color: ['Rojo', 'Amarillo', 'Verde', 'Negro'], size: ['No aplica'] },

    { name: 'Zico Beach Sandal', color: ['Blanco', 'Azul', 'Rojo'], size: ['XS', 'S', 'M', 'L', 'XL'] },
    { name: 'Adidas Superstart', color: ['Rojo', 'Amarillo', 'Verde'], size: ['XXS', 'XS', 'S', 'M', 'L', 'XL'] },
    { name: 'Timberland Premium', color: ['Amarillo', 'Verde', 'Negro'], size: ['S', 'M', 'L'] },

    { name: 'Men Wallet', color: ['Azul', 'Verde', 'Negro'], size: ['No aplica'] },
    { name: 'Keychain', color: ['Plateado'], size: ['No aplica'] },
    { name: 'Casio L12 Watch', color: ['Blanco', 'Azul', 'Rojo', 'Amarillo', 'Verde', 'Negro', 'Plateado', 'Dorado'], size: ['S', 'M', 'L'] }
]

products.each do |product|
    saved_product = Product.find_by(name: product[:name])
    colors = product[:color]
    sizes = product[:size]

    colors.each do |color|
        c = Color.find_by name: color
        sizes.each do |size|
            s = Size.find_by label: size
            saved_product.variants.create(color: c, size: s)

            puts "Variacion: color: #{c.name}, size: #{s.label}, en producto: #{saved_product.name}"
        end
    end
end
