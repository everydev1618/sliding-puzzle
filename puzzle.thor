require_relative 'sliding_puzzle'

class Puzzle < Thor
  desc 'play game', 'solve the sliding puzzle game'

  def play
    puzzle = SlidingPuzzle.new
    puzzle.randomize

    loop do
      puts puzzle.board.inspect
      move = ask(
        'what move do you want to make?',
        limited_to: ['up', 'down', 'left', 'right']
      )
      begin
        puzzle.send(move.to_sym)
      rescue
        puts 'you made an illegal move'
      end

      break if puzzle.board == SlidingPuzzle::SOLVED
    end
  end
end
