require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'


player1 = Player.new("Josiane") # on initialise les deux joueurs
player2 = Player.new("José")


while player1.life_points > 0 && player2.life_points >0 do
  puts "\n"
  puts "--------------------------"
  puts "\n"
  puts ">>>Voici l'état de chaque joueur : "
  puts "\n"
  puts player1.show_state # on montre l'état de chaque joueur
  print player2.show_state
  puts "\n"
  puts "--------------------------"
  puts "\n"
  puts ">>>Passons à la phase d'attaque : "
  puts "\n"
  player1.attacks(player2)
   break if player2.life_points <= 0 # on arrête la boucle si le joueur est KO
  player2.attacks(player1)
  puts "\n"
end

puts "\n"
puts "--------------------------"
puts "\n"
puts ">>>Le joueur a été tué"
puts "\n"



#binding.pry
