require_relative 'player'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game
  attr_accessor :title

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(a_player)
    @players.push(a_player)
  end

  def play(rounds)
    @players.each do |player|
      puts player
    end

    treasures = TreasureTrove::TREASURES
    1.upto(rounds) do |round|
      @players.each do |player|
        GameTurn.take_turn(player)
      end
    end
  end

  def high_score_entry(player)
    formatted_name = player.name.ljust(20, '.')
    "#{formatted_name} #{player.score}"
  end

  def total_points
    @players.reduce(0) { |sum, player| sum + player.points }
  end
end