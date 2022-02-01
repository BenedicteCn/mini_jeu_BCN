require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "--------------------------"
puts "\n"
puts "WELCOME TO THE HUNGER GAMES"
puts "\n"
puts "--------------------------"
puts "\n"
puts "Quel est ton prénom ?"
prénom = gets.chomp
puts " Bienvenue #{prénom}"

enemies = Array.new # on crée le array avec les enemis
player1 = Player.new("Josiane")
enemies << player1
player2 = Player.new("José")
enemies << player2
player3 = HumanPlayer.new("#{prénom}") # on crée le joueur humain

while player3.life_points >0 && (player1.life_points > 0 || player2.life_points >0) do
  puts "\n"
  puts "--------------------------"
  puts ">>>Voici l'état de chaque joueur : "
  puts "\n"
  puts player3.show_state
  puts player1.show_state
  print player2.show_state
  puts "\n"
  puts "--------------------------"
  puts "\n"
  puts "Quelle action veux-tu effectuer ?"
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner "
  puts "0 - attaquer Josiane"
  puts "1 - attaquer José"
  puts "\n"
  puts "--------------------------"
  choice = gets.chomp.to_s

    if choice == "a" then
      player3.search_weapon
      elsif choice == "s"
      player3.search_health_pack
      elsif choice == "0"
      player3.attacks(player1)
        break if player1.life_points <= 0
      elsif choice == "1"
      player3.attacks(player2)
        break if player2.life_points <= 0
      else !choice == "a" && !choice == "s" && !choice == "0" && !choice == "1"
      puts "choisi entre a, s, 0 et 1 stp"
    end

  puts "Les autres joueurs t'attaquent !"
  player1.attacks(player3)
    break if player2.life_points <= 0
  player2.attacks(player3)
  break if player1.life_points <= 0

end

puts "\n"
puts "--------------------------"
puts "\n"
puts ">>>Le joueur a été tué"
puts "\n"



#binding.pry


#  puts "\n"
#puts ">>>Passons à la phase d'attaque : "
#puts "\n"
#player1.attacks(player2)
# break if player2.life_points <= 0
#player2.attacks(player1)
#puts "\n"
#end
