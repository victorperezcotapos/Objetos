require 'date'

class Curso
  attr_reader :name, :dates
  attr_writer :limit
  @limit = Date.new(2018,1,1)

  def initialize(name,*dates)
    @name = name
    @dates = dates.map {|e| Date.parse(e)}
  end

  def self.create_from_file(file)
    data = open(file).readlines
    cursos = data.map{ |curso| curso.split(", ") }
    return cursos.map{ |curso| Curso.new(*curso)}
  end

  def self.start_before(cursos,date = Date.today.to_s)
    external_date = Date.parse(date)
    if external_date >= @limit
      return "la fecha esta fuera de rango"
    end
    cursos_filtrados = cursos.select {|e| e.dates[0]<external_date}
    return cursos_filtrados.map { |e| e.name }
  end

  def self.end_after(cursos,date = Date.today.to_s)
    external_date = Date.parse(date)
    if external_date >= @limit
      return "la fecha esta fuera de rango"
    end
    return cursos.select {|e| external_date<e.dates[1] }.map { |e| e.name }
  end

end

cursos = Curso.create_from_file("cursos.txt")
puts cursos[0].name
puts cursos[0].dates
puts "antes"
puts Curso.start_before(cursos,"2017-06-06")
puts "despues"
puts Curso.end_after(cursos,"2017-06-06")
