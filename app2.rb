require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'
puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "------------------------------------------------"
puts ""
puts "Quel est ton petit surnom ?"
surnom=gets.chomp.to_s
player1=HumanPlayer.new(surnom)
puts ""
puts "Initialisation des ennemis"
ennemie1=Player.new("José")
ennemie2=Player.new("Josiane")
ennemis = []
ennemis << ennemie1
ennemis << ennemie2

puts ""
puts "Que la partie commence !!!"
puts ""

while player1.life_points >0 && (ennemis[0].life_points >0 || ennemis[1].life_points >0)
  puts ""
  puts "--------"
  player1.show_state
  puts "--------"
  puts "Quelle action veux-tu effectuer ?\n"
  puts "a - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts ""
  puts "attaquer un joueur en vue :"
  print "0 - "
  ennemis[0].show_state
  print "1 - "
  ennemis[1].show_state
  puts ""

  choix=gets.chomp.to_s

  if choix == "a"
    player1.search_weapon
  elsif choix == "s"
    player1.search_health_pack
  elsif choix == "0"
    player1.attacks(ennemis[0])
  elsif choix == "1"
    player1.attacks(ennemis[1])
  else
    puts "Error"
    break
  end

  ennemis.each {|mechant|
    if mechant.life_points >0
      mechant.attacks(player1)
      puts ""
    end
  }
end

if player1.life_points > 0
  puts "BRAVO ! TU AS GAGNE !"
else puts "Loser ! Tu as perdu !"
end