class Game
  def initialize
    @player1 = "Joe"
    @player2 = "player2"
    @board = Array.new(3) {Array.new(3, "[]")}
  end

  def display_board(board)
    p board[0]
    p board[1]
    p board[2]
  end

  def start_game
    puts "Player One vs Player Two"
    display_board(@board)
  end
end

game = Game.new
game.start_game
