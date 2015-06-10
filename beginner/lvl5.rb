# https://www.bloc.io/ruby-warrior/#/warriors/191761/levels/5

class Player

  def play_turn(warrior)
    @warrior = warrior

    decide_action
    @health = @warrior.health
  end

  def decide_action
    @action_used = false
    rest_if_should unless @action_used
    walk_if_should unless @action_used
    rescue_if_should unless @action_used
    attack_if_should unless @action_used
  end

  def rescue_if_should
    if @warrior.feel.captive?
      @warrior.rescue!
      @action_used = true
    end
  end

  def attack_if_should
    if !@warrior.feel.empty?
      @warrior.attack!
      @action_used = true
    end
  end

  def taking_damage?
    @health ||= @warrior.health
    @health > @warrior.health
  end

  def rest_if_should
    if !enough_health? && !taking_damage?
      @warrior.rest!
      @action_used = true
    end
  end

  def walk_if_should
    if @warrior.feel.empty?
      @warrior.walk!
      @action_used = true
    end
  end

  def enough_health?
    @warrior.health == 20
  end

end
