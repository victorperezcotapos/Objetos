#def nuevo_catalogo(data)
#  nuevo_catalogo = open(data).readlines
#  nuevo_catalogo.map!{ |prod| prod.split(",") }
#  nuevo_catalogo.map!{ |e| e = e[0..e.length-2]}
#  File.write('nuevo_catalogo.txt',nuevo_catalogo.join(""))
#end

class Product
  attr_reader :info
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
  def info
    return [@name,@large,@medium,@small,@xsmall]
  end
  def avg_price
    (@large + @medium + @small + @xsmall)/4.0
  end
end

def nuevo_catalogo(data)
  products_list= []
  data= []
  File.open('catalogo.txt', 'r') { |file| data=file.readlines}
  data.each do |prod|
    ls=prod.split(', ')
    products_list << Product.new(*ls)
  end

  nuevo_catalogo = products_list.map { |e| e.info}
  nuevo_catalogo.map!{ |e| e[0..e.length-2]}
  nuevo_catalogo.map!{ |e| e.join(", ")}
  File.write('nuevo_catalogo.txt',nuevo_catalogo.join("\n"))
end

nuevo_catalogo('catalogo.txt')
