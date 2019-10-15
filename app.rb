require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'



puts "Que le jeu commence !"
player1 = Player.new("Josiane")
player2 = Player.new("José")
puts "Voici l'état de chaque joueur :"
player1.show_state
player1.show_state
puts "Passons à la phase d'attaque :"
puts ""
while player1.life_points>0 && player2.life_points>0
  if player1.life_points>0
    player1.attacks(player2)
  else
    puts "Fin du game"
    break
  end
  if player2.life_points>0
    player2.attacks(player1)
  else
    puts "Fin du game"
    break
  end
  puts "Fin du round"
end
puts "La vrai fin du game"
puts "Voici l'état de chaque joueur :"
player1.show_state
player2.show_state
#binding.pry