Size.destroy_all

sizes = ['No aplica', 'XXS', 'XS', 'S', 'M', 'L', 'XL', 'XXL']

sizes.each do |size|
    s = Size.create(label: size)

    puts "Se ha agregado el tamaño: #{s.label}"
end
