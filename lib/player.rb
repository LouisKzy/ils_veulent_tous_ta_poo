require 'pry'

class Player


  attr_accessor :name, :life_points


  def initialize(name, life_points=10) # argument optionel
    @name = name
    @life_points = life_points
    sleep(1)
  end


  def show_state
    if @life_points >0
    return "#{@name} a #{@life_points} points de vie"
    else
    return "#{@name} est mort. RIP"
    end
    sleep(1)
  end


  def gets_damage(damages)
    
    @life_points = @life_points - damages # mise a jour hp en fonction des dégats

    if @life_points <= 0
      sleep(1)
      return puts "#{@name} fut fatal à #{@name}, il ne reste rien de #{@name}.. RIP  "
    end
  end


  def attacks(other_player)
    
    puts "#{@name} attaque #{other_player.name}"
    sleep(1)
    def compute_damage
    return rand(1..6) 
    end
    dice_roll_damage = compute_damage()
    
    if dice_roll_damage <= 1
      puts "#{@name} n'inflige que #{dice_roll_damage} dommage, noob.."
      sleep(1)
    elsif dice_roll_damage <= 3
      puts "#{@name} inflige  #{dice_roll_damage} points de dommages, mouais."
      sleep(1)
    elsif dice_roll_damage <= 5
      puts "#{@name} inflige  #{dice_roll_damage} points de dommages, nice !"
      sleep(1)
    else
      puts "#{dice_roll_damage} dommages dans sa face de pleutre !"
      sleep(1)
    end
    puts 
    other_player.gets_damage(dice_roll_damage)
  end


end


class HumanPlayer < Player


  attr_accessor :weapon_level


  def initialize(name, life_points=100, weapon_level=1)
    @weapon_level = weapon_level
    super(name, life_points) # recupère de la mère
  end

  def show_state
    puts "#{@name} a #{@life_points} points de vie (cheatcode=Human) et une arme cheat d'assisté de niveau #{@weapon_level.to_s}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    dice_roll_weapon = rand(1..6)
    puts "Tu trouve une arme de niveau #{dice_roll_weapon}"
    if dice_roll_weapon > @weapon_level
      puts "Tu trouve une nouvelle arme de meilleure facture que la précédente." 
      puts "Tu jette donc l'ancienne comme une vielle chaussette.."
      @weapon_level = dice_roll_weapon
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end
  def search_for_heal
    dice_roll_healing = rand(1..6)
    case dice_roll_healing
    when 1
      puts "Tu n'as rien trouvé... Fallait ouvrir les yeux.. "
    when 2..5
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
      @life_points += 50
      if @life_points > 100
        @life_points = 100
      end
    when 6
      puts "Incroyable tu trouve un pack de +80 points de vie !"
      @life_points += 80
      if @life_points > 100
        @life_points = 100
      end
    end
  end
end