class Table
  attr_reader :name,:earnings
  def initialize(name,*earnings)
    @name = name
    @earnings = earnings.map {|e| e.to_i}
  end

  def self.create_from_file(file)
    data = open(file).readlines
    tables = data.map{ |table| table.split(",") }
    return tables.map{ |table| Table.new(*table)}
  end
  def max
    return "El mayor valor recaudado fue #{@earnings.max} el dia #{@earnings.index(@earnings.max)+1}"
  end
  def self.average(tables)
    table_averages = tables.map{|e| e.earnings.sum/e.earnings.length.to_f}
    average = table_averages.sum/table_averages.length.to_f
  end
end

tables = Table.create_from_file("casino.txt")
puts tables[0].max
puts Table.average(tables)
