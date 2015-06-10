# https://www.bloc.io/ruby-warrior/#/warriors/191761/levels/6
# This still seems messy, but I'm more skeptical about it's terribleness :)
# However, not liking the length of decide_action.
# ESPECIALLY not liking the all_rescued? option...


class Player
  # NOTE: @rescue_count in all_rescued? needs to be set at the start of the level!

  def play_turn(warrior)
    @warrior = warrior

    decide_action
    @health = @warrior.health
  end

  def decide_action
    @action_used = false
    rest_if_should unless @action_used
    rescue_if_should unless @action_used
    walk_backward_if_should unless @action_used
    walk_if_should unless @action_used
    attack_if_should unless @action_used
  end

  #### warrior methods ####

  def rest_if_should
    if !full_health? && !taking_damage?
      @warrior.rest!
      use_action
    end
  end

  def rescue_if_should
    if @warrior.feel.captive?
      @warrior.rescue!
      use_action
    elsif @warrior.feel(:backward).captive?
      @warrior.rescue!(:backward)
      use_action
      count_rescue
    end
  end

  def walk_backward_if_should
    if ( !all_rescued? || !enough_health? ) && @warrior.feel(:backward).empty?
      @warrior.walk!(:backward)
      use_action
    end
  end

  def walk_if_should
    if @warrior.feel.empty?
      @warrior.walk!
      use_action
    end
  end

  def attack_if_should
    if @warrior.feel.enemy?
      @warrior.attack!
      use_action
    end
  end

  #### supporting methods ####

  def use_action
    @action_used = true
  end

  def count_rescue
    @rescue_count ||= 0
    @rescue_count += 1
  end

  #### check (`?`) methods ####

  def taking_damage?
    @health ||= @warrior.health
    @health > @warrior.health
  end

  def full_health?
    @warrior.health == 20
  end

  def enough_health?
    @warrior.health > 8 # 8 is the min required to pass lvl 6.
  end

  def all_rescued?
    if @rescue_count == 1
      @all_rescued = true
    end
  end

end
