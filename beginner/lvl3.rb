# https://www.bloc.io/ruby-warrior/#/warriors/191761/levels/3

class Player
  def play_turn(warrior)
    if warrior.feel.empty?
      if warrior.health < 10
        warrior.rest!
      else
        warrior.walk!
      end
    else
      warrior.attack!
    end
  end
end


##### OR, IF I WANT TO BE COMPLICATED #####
class Player
  def play_turn(warrior)
    if warrior.feel.empty?
      rest_or_walk(warrior)
    else
      warrior.attack!
    end
  end

  def rest_or_walk(warrior)
    if enough_health?(warrior)
      warrior.walk!
    else
      warrior.rest!
    end
  end

  def enough_health?(warrior)
    warrior.health > 10
  end
end
