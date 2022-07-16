Color.destroy_all

colors = ['No aplica', 'Blanco', 'Azul', 'Rojo', 'Amarillo', 'Verde', 'Negro', 'Plateado', 'Dorado']

colors.each do |color|
    c = Color.create(name: color)

    puts "Se ha agregado el color: #{c.name}"
end
