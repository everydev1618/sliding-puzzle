require_relative 'sliding_puzzle'

describe SlidingPuzzle do
  let(:unsolved_board) do
    [
      [1,  2,  3,   4],
      [5,  6,  7,   8],
      [9,  10, nil, 15],
      [13, 14, 12,  11]
    ]
  end

  subject { described_class.new(unsolved_board) }
  describe '#left' do
    specify do
      expect(subject.left).to eq [
        [1,  2,  3,  4],
        [5,  6,  7,  8],
        [9,  10, 15, nil],
        [13, 14, 12, 11]
      ]
    end

    context 'when nil is on the right' do
      let(:unsolved_board) do
        [
          [1,  2,  3,  4],
          [5,  6,  7,  8],
          [15, 10, 9,  nil],
          [13, 14, 12, 11]
        ]
      end

      specify 'should raise an error' do
        expect { subject.left }.to raise_error
      end
    end
  end

  describe '#right' do
    specify do
      expect(subject.right).to eq [
        [1,  2,  3,  4],
        [5,  6,  7,  8],
        [9,  nil, 10, 15],
        [13, 14, 12, 11]
      ]
    end
  end

  describe '#up' do
    specify do
      expect(subject.up).to eq [
        [1,  2,  3,  4],
        [5,  6,  nil,  8],
        [9,  10, 7, 15],
        [13, 14, 12, 11]
      ]
    end
  end

  describe '#down' do
    specify do
      expect(subject.down).to eq [
        [1,  2,  3,  4],
        [5,  6,  7,  8],
        [9,  10, 12, 15],
        [13, 14, nil, 11]
      ]
    end
  end

  describe '#where_is_the_nil' do
    specify do
      expect(subject.where_is_the_nil).to eq [2,2]
    end
  end

  specify { expect(subject.randomize).to be_a_kind_of Array }

  describe '#steps' do
    specify do
      subject.randomize
      expect(subject.steps.count).to be 50
    end
  end

  describe 'solving a random puzzle with reverse steps' do
    subject { described_class.new }

    specify do
      subject.randomize
      subject.solve
      expect(subject.board).to eq [
        [1,  2,  3,  4],
        [5,  6,  7,  8],
        [9,  10, 11, 12],
        [13, 14, 15, nil]
      ]
    end
  end
end
