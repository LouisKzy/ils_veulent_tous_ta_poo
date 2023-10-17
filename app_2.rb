require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# Prints a combination of the progress bar, spinner, and percentage examples
spinner = Enumerator.new do |e|
  loop do
    e.yield '|'
    e.yield '/'
    e.yield '-'
    e.yield '\\'
  end
end
1.upto(100) do |i|
  progress = "=" * (i/5) unless i < 5
  printf("\rLoading file: [%-20s] %d%% %s", progress, i, spinner.next)
  sleep(0.1)
end

puts
# Bienvenue dans le jeu
3.times{puts}
puts " ---------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' Version 2 !|"
puts "|Le but du jeu est d'être le dernier survivant !    |"
puts " ---------------------------------------------------"
3.times{puts}

# création joueurs
puts "Nous allons crée ton personnage, quel est ton nom ?"
print ">"
human_name = gets.chomp
puts
human_player = HumanPlayer.new(human_name)
puts "Creation du joueur : #{human_player.name}"
puts
50.times{print "-"}
puts



 # creation de deux ennemis
puts 
puts "Nous allons maintenant crée 2 ennmies :"
puts
ennemies = []
# premier ennemis
player_one = Player.new("Xx_g4m3ur_d4rks4suk3_xX")
# deuxième ennemis
player_two = Player.new("Random_Gros_Bill")
puts "Création des ennemis :" 
puts "  - #{player_two.name}" 
puts "  - #{player_one.name}"

ennemies << player_one
ennemies << player_two

puts
50.times{print "-"}
puts
round_number = 0
# baston
puts "Maintenant ma partie préférée, LA BAGARRE"
puts
while not human_player.life_points < 0 || player_one.life_points < 0 && player_two.life_points < 0
  human_player.show_state
  round_number += 1
  puts "--------------------------------------------------------------------------------------------------------------------------------"
  puts "|                                              Round #{round_number}. Fight!                                                                 |"    
  puts "--------------------------------------------------------------------------------------------------------------------------------"
  puts " Qu'est-ce que tu vas faire maintenant ? Mmmh ?"
  puts
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts "attaquer un joueur en vue :"
  puts "0 - #{player_one.show_state}"
  puts "1 - #{player_two.show_state}"
  puts
  puts
  print ">"
  errors = 0
  human_choice = gets.chomp
  while not human_choice == "a" || human_choice == "s" || human_choice == "0" || human_choice == "1"
    errors += 1
    if errors <= 3
     puts "Erreur de saisie recommence"
     human_choice = gets.chomp
    elsif errors == 4
      puts "Attention, les autres joueurs joueront un tour .."
    elsif errors == 5
      break
    end
  end
  sleep(0.2)
  puts " Round #{round_number}. Fight!"
  case human_choice
  when "a"
    human_player.search_weapon
    sleep(1.5)
  when "s"
    human_player.search_for_heal
    sleep(1.5)
  when "0"
    human_player.attacks(player_one)
    sleep(1.5)
  when "1"
    human_player.attacks(player_two)
    sleep(1.5)
  end
  puts
  puts "Les autres joueurs, qui utilise leurs poings, s'apprettent a te coller un bourre-pif comme tu le mérite !"
  puts
  ennemies.each do |player|
    if player.life_points > 0
      player.attacks(human_player)
      sleep(0.2)
    end
  end
  puts "Il te reste maintenant #{human_player.life_points} points de vies."
end
5.times{puts}
# fin du jeu
if human_player.life_points <= 0
  puts "Looser #{human_player.name} est mort alors qu'il etait cheat le naab "
  
else
  puts "Wow #{human_player.name} a gagné alors qu'il etait cheat. Quel talent ! (C'est faux t'es un(e) plot(e))."
end  

