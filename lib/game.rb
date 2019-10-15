require_relative 'player'
class Game

  attr_accessor :human_player, :ennemis


  def initialize (name_to_save)
    @ennemis =[]
    ennemie1=Player.new("José")
    @ennemis << ennemie1
    ennemie2=Player.new("Josiane")
    @ennemis << ennemie2
    ennemie3=Player.new("Sabrina")
    @ennemis << ennemie3
    ennemie4=Player.new("Gerard")
    @ennemis << ennemie4
    @human_player = HumanPlayer.new(name_to_save)

  end

  def kill_player(ennemie)
    @ennemis = @ennemis.reject { |dead| dead==ennemie }
  end

  def is_still_ongoing?
    if @human_player.life_points > 0 && @ennemis.size > 0

      return true
    else
      return false
    end

  end


  def show_players
    puts "Toi :"
    @human_player.show_state
    puts ""
    puts "Les mechants :"
    @ennemis.each { |num| num.show_state }
    puts ""
  end

  def menu
    puts "--------"
    puts "Quelle action veux-tu effectuer ?\n"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts ""
    puts "attaquer un joueur en vue :"
    @ennemis.each {|mechant|
      if mechant.life_points <= 0
        kill_player(mechant)
      end
    }
    index=0
    @ennemis.each {|mechant|

      print index.to_s + " - "
      index=index+1
      mechant.show_state
    }

  end

  def menu_choice (str)
    if str == "a"
      @human_player.search_weapon
    elsif str == "s"
      @human_player.search_health_pack
    elsif str.to_i < @ennemis.size && str.to_i>=0
      i=str.to_i
      @human_player.attacks(ennemis[i])
      if ennemis[i].life_points <=0
        kill_player(ennemis[i])
      end
    elsif self.end


    else
      puts "Error"
    end
  end


  def enemies_attack
    @ennemis.each {|mechant|
      if mechant.life_points > 0
        if @human_player.life_points>0
          mechant.attacks(@human_player)
        else self.end
        end
      end
    }

  end
  def end
    if @human_player.life_points<=0
      puts "le jeu est fini"
      puts "Le PLAYER EST DEAD :("
      return 0
    elsif @ennemis.size==0
      puts "le jeu est fini"
      puts "Le PLAYER A GAGNE :)"
      return 0
    else puts " La partie continue "
      return 1
    end

  end

end