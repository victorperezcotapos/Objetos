class Dog
  attr_reader :name ,:raza ,:color
  def initialize args
    @nombre = args[:nombre]
    @raza = args[:raza]
    @color = args[:color]
  end
  def ladrar
    puts "#{@nombre} esta ladrando"
  end
end

propiedades= {nombre:'Beethoven', raza:'San Bernardo', color:'Café'}

dog = Dog.new(propiedades)
dog.ladrar
