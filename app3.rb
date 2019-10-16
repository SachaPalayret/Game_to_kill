require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
#binding.pry
puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "------------------------------------------------"
puts ""
puts "Quel est ton petit surnom terrifiant ?"
surnom=gets.chomp
puts "Bienvenue "+surnom.to_s
puts ""
puts "Que la partie commence !!!"
puts ""
game1=Game.new(surnom)
i=1
while i==1

  game1.show_players
  game1.menu
  puts "Quel est ton choix ?"
  choix=gets.chomp.to_s
  game1.menu_choice(choix)
  game1.enemies_attack
  i= game1.end

end