class SlidingPuzzle
  SOLVED = [
    [1,  2,  3,  4],
    [5,  6,  7,  8],
    [9,  10, 11, 12],
    [13, 14, 15, nil]
  ]

  def initialize(board = SOLVED)
    @board = board
    @steps = []
  end

  def left
    move(0,1)
  end

  def right
    move(0,-1)
  end

  def up
    move(-1,0)
  end

  def down
    move(1,0)
  end

  def where_is_the_nil
    i = 0
    j = nil
    board.each_with_index do |row, number|
      row.each_with_index { |column, number| j = number if column.nil? }
      break if j
      i += 1
    end
    [i,j]
  end

  def out_of_bounds?(x,y)
    fail if (x < 0 or x > 3)
    fail if (y < 0 or y > 3)
  end

  def randomize
    50.times do
      begin
        move_direction = [:up, :down, :left, :right].sample
        self.send(move_direction)
      rescue
        retry
      end
      steps << move_direction
    end
    return board
  end

  def inverse_step(step)
    case step
    when :up    then :down
    when :down  then :up
    when :left  then :right
    when :right then :left
    end
  end

  attr_reader :steps, :board

  def solve
    reverse_steps = steps.reverse.map do |step|
      inverse_step(step)
    end

    reverse_steps.each { |step| send(step) }
  end

  private

  def move(x = 0, y = 0)
    current_row, current_column = where_is_the_nil
    out_of_bounds?(current_row + x, current_column + y)

    board[current_row][current_column] = board[current_row + x][current_column + y]
    board[current_row + x][current_column + y] = nil

    return board
  end
end
