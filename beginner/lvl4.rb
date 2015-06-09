class Player

  def play_turn(warrior)
    decide_action(warrior)
    @health = warrior.health
  end

  def decide_action(warrior)
    @action_used = false
    rest_if_should(warrior) unless @action_used
    walk_if_should(warrior) unless @action_used
    attack_if_should(warrior) unless @action_used
  end

  def attack_if_should(warrior)
    if !warrior.feel.empty?
      warrior.attack!
      @action_used = true
    end
  end

  def taking_damage?(warrior)
    @health ||= warrior.health
    @health > warrior.health
  end

  def rest_if_should(warrior)
    unless enough_health?(warrior) && !taking_damage?(warrior)
      warrior.rest!
      @action_used = true
    end
  end

  def walk_if_should(warrior)
    unless taking_damage?(warrior) || !warrior.feel.empty?
      warrior.walk!
      @action_used = true
    end
  end

  def enough_health?(warrior)
    warrior.health > 10
  end

end
