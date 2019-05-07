class Product
  def initialize(name, *precios)
    @name=name
    @large=precios[0].to_i
    @medium=precios[1].to_i
    @small=precios[2].to_i
    @xsmall=precios[3].to_i
  end
  def to_s
    "#{@name}"
  end
  def avg_price
    (@large + @medium + @small + @xsmall)/4.0
  end
end

products_list= []
data= []
File.open('catalogo.txt', 'r') { |file| data=file.readlines}
data.each do |prod|
  ls=prod.split(', ')
  products_list << Product.new(*ls)
end

puts products_list
puts products_list[1].avg_price
