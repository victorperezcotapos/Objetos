def nuevo_catalogo(data)
  nuevo_catalogo = open(data).readlines
  nuevo_catalogo.map!{ |prod| prod.split(",") }
  nuevo_catalogo.map!{ |e| e = e[0..e.length-1]}
  File.write('nuevo_catalogo.txt',nuevo_catalogo.join(""))
end

nuevo_catalogo('catalogo.txt')
