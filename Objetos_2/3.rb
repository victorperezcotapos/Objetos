class Roulette
  def initialize
    @r = (1..10).to_a
    @roulette_history = []
    @winners = []
  end
  def play (bet)
    result=@r[rand(10)]
    puts @roulette_history.class
    @roulette_history << result
    File.write('roulette_history.txt',@roulette_history.join("\n"))
    if bet == result
      puts "success"
      @winners << result.to_s
      File.write('winners.txt',@winners.join("\n"))
    else
      puts "try again"
    end
  end
  def mode
    data = open('roulette_history.txt').readlines
    data.max_by { |i| data.count(i) }
  end

end

roulette = Roulette.new
100.times do
  roulette.play(5)
end
puts roulette.mode
