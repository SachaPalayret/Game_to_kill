class Player

  attr_accessor :name, :life_points

  def initialize (name_to_save)
    @name=name_to_save.to_s
    @life_points=10

  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(nbr_damage)
    @life_points= @life_points - nbr_damage
    if @life_points <=0
      puts "le joueur #{@name} a été tué !"
      @life_points=0
    end
  end

  def attacks(player2)

    puts "le joueur #{@name} attaque le joueur #{player2.name}"
    puissance_attack=compute_damage
    puts "il lui inflige #{puissance_attack} points de dommages"
    player2.gets_damage(puissance_attack)

  end

  def compute_damage
    return rand(1..6)
  end
end


class HumanPlayer < Player

  attr_accessor :weapon_level

  def initialize(name_to_save)
    super(name_to_save)
    @weapon_level = 1
    @life_points=100
  end

  def show_state
    super
    puts "et une arme de niveau #{weapon_level}"
  end

  def compute_damage
    return super * @weapon_level
  end

  def search_weapon

    des=rand(1..6)
    puts "Tu as trouvé une arme de niveau #{des}"
    if des>@weapon_level
      @weapon_level=des
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end
  
  def search_health_pack
    des=rand(1..6)
    puts "Tu as trouvé une arme de niveau #{des}"
    if des==1
      puts "Tu n'as rien trouvé... "
    elsif des>1 && des<6
       puts "Bravo, tu as trouvé un pack de +50 points de vie !"
       @life_points = @life_points+50
       if @life_points>100
         @life_points=100
       end
    else
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      @life_points = @life_points+80
      if @life_points>100
        @life_points=100
      end
    end
  end


end