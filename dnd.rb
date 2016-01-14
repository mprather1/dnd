class Character
  attr_accessor :name, :race, :clss, :allignment, :ability_scores, :hp
  def initialize
    @name = name
    @race = race
    @clss = clss
    @allignment = allignment
    @ability_scores = Hash.new
    @hp = hp
  end

  def get_info
    puts "Dungeons and Dragons Character Generation".center(50)
    puts "\nEnter Character Name:"
    print ">>>"
    @name = gets.chomp
   # puts "race"
    #@race = gets.chomp
  end

  def choose_allignment
    lp = true
    while lp == true
      puts "\nChoose Allignment:"
      puts "1. Lawful Good"
      puts "2. Neutral Good"
      puts "3. Chaotic Good"
      puts "4. Lawful Neutral"
      puts "5. True Neutral"
      puts "6. Chaotic Neutral"
      puts "7. Lawful Evil"
      puts "8. Neutral Evil"
      puts "9. Chaotic Evil"
      puts "Enter 1-10"
      allignment = gets.to_i
      case allignment
      when 1
        @allignment = "Lawful Good"
        lp = false
      when 2
        @allignment = "Neutral Good"
        lp = false
      when 3
        @allignment = "Chaotic Good"
        lp = false
      when 4
        @allignment = "Lawful Neutral"
        lp = false
      when 5
        @allignment = "True Neutral"
        lp = false
      when 6
        @allignment = "Chaotic Neutral"
        lp = false
      when 7
        @allignment = "Lawful Evil"
        lp = false
      when 8
        @allignment = "Neutral Evil"
        lp = false
      when 9
        @allignment = "Chaotic Evil"
        lp = false
      else
        puts "invalid Input"
      end
    end
  end

  def roll_scores
    @ability_scores= Hash[:strength, (3 + rand(16)), :dexterity, (3 + rand(16)), :constitution, (3 + rand(16)), :intelligence, (3 + rand(16)), :wisdom, (3 + rand(16)), :charisma, (3 + rand(16))]
  end

  def show_ability_scores
    print @ability_scores
  end

  def ability_score_checks
      strength_checks = Hash[:open_doors, 10*@strength]

  end

  def races
    lp = true
    while lp == true
    puts "\nChoose Race: "
    puts "a. Human"
    puts "b. Elf"
    puts "c. Half-Elf"
    puts "d. Dwarf"
    puts "e. Gnome"

    print ">>>"
    race = gets.chomp
    case race
    when "a"
      @race = "Human"
      lp = false
    when "b"
      @race ="Elf"
      @ability_scores[:dexterity] += 1
      @ability_scores[:constitution] -= 1
      lp = false
    when "c"
      @race = "Half-Elf"
      puts @race
      lp = false
    when "d"
      @race = "Dwarf"
      puts @race
      @ability_scores[:constitution] += 1
      @ability_scores[:wisdom] -= 1
      lp = false
    when "e"
      @race = "Gnome"
      @ability_scores[:wisdom] += 1
      @ability_scores[:strength] -= 1
      puts @race
      lp = false
    else
      puts "Invalid Input"
    end
    end
  end


  def choose_class
    lp = true
    while lp == true
      puts "\nChoose class"
      puts "a. Fighter"
      puts "b. Thief"
      puts "c. Cleric"
      puts "d. Mage"
      if @race == "Half-Elf"
        puts "e. Multi-Class"
      end
      print ">>>"
      clss = gets.chomp
      case clss
      when "a"
        @clss = "Fighter"
        puts @clss
        @ability_scores[:strength] = 9 + rand(10)
        @hp = 1 + rand(10)
        lp = false
      when "b"
        @clss = "Thief"
        @ability_scores[:dexterity] = 9 + rand(10)
        @hp = 1 + rand(6)
        lp = false
      when "c"
        @clss = "Cleric"
        @ability_scores[:wisdom] = 9 + rand(10)
        @hp = 1 + rand(8)
        lp = false
      when "d"
        @clss = "Mage"
        @ability_scores[:intelligence] = 9 + rand(10)
        @hp = 1 + rand(4)
        lp = false
      when "e"
        puts "Multi-Class"
        puts "Fighter/Thief"
        lp = false

      else
        puts "Invalid Input"
      end

    end
  end
end


newCharacter = Character.new
newCharacter.get_info
newCharacter.choose_allignment
newCharacter.roll_scores
newCharacter.races
newCharacter.choose_class
puts " \n "
puts newCharacter.name
puts newCharacter.race
puts newCharacter.clss
puts newCharacter.allignment
newCharacter.show_ability_scores
puts "\nHP : #{newCharacter.hp}"
