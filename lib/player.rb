class Player # on crée la classe Player
  attr_accessor :name, :life_points
  @damage = 0 # ici on initialise damage

  def initialize(name)
    @name = name
    @life_points = 10 # on démarre avec 10 pts de vie pour chaque player
  end

  def show_state
    puts "#{name} a #{life_points} point(s) de vie"
  end

  def gets_damage(damage)
    @life_points = @life_points - damage # la vie est diminué de X pts de dommage
     if @life_points <= 0
      return "Le joueur #{name} a été tué"
     else @life_points > 0
      return "#{name} a #{life_points} de vie"
     end
  end

  def attacks(name_attacked)

    puts "Le joueur #{name} attaque le joueur #{name_attacked.name}"
    points_of_damage = compute_damage
    puts "Il lui inflige #{points_of_damage} point(s) de dommage"
    name_attacked.gets_damage(points_of_damage)

  end

  def compute_damage
    return rand(1..6)
  end


end

class HumanPlayer < Player # deuxième classe pour le joueur humain
  attr_accessor :weapon_level

  def initialize(name)
    @name = name
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    puts "#{name} a #{life_points} points de vie et une arme de niveau #{weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    new_weapon_level = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon_level}"
      if new_weapon_level > weapon_level then weapon_level = new_weapon_level
        puts "Youhou ! elle est meilleure que ton arme actuelle : tu l'as prends."
        else
        puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
      end
  end

  def search_health_pack
    health_pack = rand(1..6)
   if health_pack == 1 then
     puts "Tu n'as rien trouvé... "
   elsif health_pack >= 2 && health_pack <= 5 then
      if @life_points+50 >= 100
        then @life_points = 100
        else @life_points += 50
      end
     puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    elsif health_pack == 6 then
      if @life_points+80 >= 100
        then @life_points = 100
        else @life_points += 80
      end
     puts "Waow, tu as trouvé un pack de +80 points de vie !"
   end
  end
end

player3 = HumanPlayer.new("bbbb")
player3.search_weapon
puts player3.show_state
