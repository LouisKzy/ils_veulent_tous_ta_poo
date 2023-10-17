require 'bundler'
Bundler.require

require_relative 'lib/game.rb'
require_relative 'lib/player.rb'

player_one = Player.new("Xx_g4m3ur_d4rks4suk3_xX")
puts player_one.name

player_two = Player.new("Random_Gros_Bill")

puts player_two.name



round_number = 0
puts " Voici l'état de nos 2 nooblards."
puts 
puts player_one.show_state
puts player_two.show_state
puts 
while player_one.life_points > 0 && player_two.life_points > 0

  if player_one.life_points == player_two.life_points
    puts "Le combat est équilibré !"
    puts player_one.show_state
    puts player_two.show_state 
   
  elsif player_one.life_points > player_two.life_points
    puts player_two.show_state
    puts "#{player_two.name} est dans la sauce !"
  else
    puts player_one.show_state
    puts "#{player_one.name} est dans la sauce !"
    
  end
  puts 
  round_number += 1
  puts "______________________________________________________________________"
  puts "Round #{round_number}.. Fight !"
  puts 
  player_one.attacks(player_two)
  if player_two.life_points <= 0
    break
  end
  puts 
  player_two.attacks(player_one)
  puts 
end


