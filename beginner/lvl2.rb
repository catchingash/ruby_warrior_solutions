# https://www.bloc.io/ruby-warrior/#/warriors/191761/levels/2

class Player
  def play_turn(warrior)
    if warrior.feel.empty?
      warrior.walk!
    else
      warrior.attack!
    end
  end
end
