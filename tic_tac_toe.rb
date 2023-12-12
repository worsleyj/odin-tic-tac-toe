class Game
  def initialize
    @player1 = 'Joe'
    @player2 = 'player2'
    @board = Array.new(3) {Array.new(3, '[]') }
  end

  def display_board(board)
    p board[0]
    p board[1]
    p board[2]
    puts "\n"
  end

  def take_turn(player, board)
    puts 'Enter x Coordinate (1-3)'
    x_coord = gets.chomp.to_i - 1
    puts 'Enter y Coordinate (1-3)'
    y_coord = gets.chomp.to_i - 1

    board[x_coord][y_coord] = player
    display_board(@board)
  end

  def start_game
    winner = ''
    puts 'Player One vs Player Two'
    puts 'The Game Begins!'
    display_board(@board)

    take_turn("x", @board) # while winner == ''
  end
end

game = Game.new
game.start_game
