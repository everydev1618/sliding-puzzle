require_relative 'sliding_puzzle'

class PuzzleCLI < Thor

puzzle = SlidingPuzzle.new.randomize

ask('what move do you want to make')
puzzle = 'yes'
end

