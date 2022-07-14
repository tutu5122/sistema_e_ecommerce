Category.destroy_all

categories = [ 'Smartphones', 'Shoes', 'Accessories' ]

categories.each do |category|
    cat = Category.create(name: category)
    puts "Se ha creado la categoría: #{cat.name}"
end