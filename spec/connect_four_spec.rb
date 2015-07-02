=begin
Game class
  initialize
  start_game
  choose_opponent
  play_against_AI?

Player
  initialize
  get_input
  move
  check?
  find_row

Board DONE!!
  initialize
  render
  build_board
  game_over?
  winning_combo?
  tie?
  vertical_win?
  horizontal_win?
  diagonal_win?

  b = [["0", "0", "0", "0", "0", "0", "0"],
      ["0", "0", "0", "0", "0", "0", "0"],
      ["0", "0", "0", "0", "0", "0", "0"],
      ["0", "0", "0", "0", "0", "0", "0"],
      ["0", "0", "0", "0", "0", "0", "0"],
      ["0", "0", "0", "0", "0", "0", "0"]]

=end


require 'connect_four'

describe Board do

  let (:b){Board.new}

  describe '#build_board' do

    let (:board){[["0", "0", "0", "0", "0", "0", "0"],
                  ["0", "0", "0", "0", "0", "0", "0"],
                  ["0", "0", "0", "0", "0", "0", "0"],
                  ["0", "0", "0", "0", "0", "0", "0"],
                  ["0", "0", "0", "0", "0", "0", "0"],
                  ["0", "0", "0", "0", "0", "0", "0"]]}

    it 'returns an array 6 subarrays, each with 7 zeros' do
      expect(b.build_board).to eq(board)
    end

  end

  describe '#game_over?' do

    it 'returns true when 4 pieces in a row vertically' do
      b.field = [["0", "0", :x, "0", "0", "0", "0"],
              ["0", "0", :x, "0", "0", "0", "0"],
              ["0", "0", :x, "0", "0", "0", "0"],
              ["0", "0", :x, "0", "0", "0", "0"],
              ["0", "0", "0", "0", "0", "0", "0"],
              ["0", "0", "0", "0", "0", "0", "0"]]

      expect(b.game_over?(:x)).to be true

    end

    it 'returns false when 3 pieces in a row vertically' do
      b.field = [["0", "0", "0", "0", "0", "0", "0"],
              ["0", "0", :x, "0", "0", "0", "0"],
              ["0", "0", :x, "0", "0", "0", "0"],
              ["0", "0", :x, "0", "0", "0", "0"],
              ["0", "0", :*, "0", "0", "0", "0"],
              ["0", "0", "0", "0", :x, "0", "0"]]

      expect(b.game_over?(:x)).to be false
    end


    it 'returns true when 4 pieces in a row horizontally' do
      b.field = [["0", "0", :x, :x, :x, :x, "0"],
                ["0", "0", "0", "0", "0", "0", "0"],
                ["0", "0", "0", "0", "0", "0", "0"],
                ["0", "0", "0", "0", "0", "0", "0"],
                ["0", "0", "0", "0", "0", "0", "0"],
                ["0", "0", "0", "0", "0", "0", "0"]]

      expect(b.game_over?(:x)).to be true
    end


    it 'returns false when 4 pieces in a row horizonatally are not the same' do
      b.field = [["0", :*, :x, :x, :*, :x, "0"],
          ["0", "0", "0", "0", "0", "0", "0"],
          ["0", "0", "0", "0", "0", "0", "0"],
          ["0", "0", "0", "0", "0", "0", "0"],
          ["0", "0", "0", "0", "0", "0", "0"],
          ["0", "0", "0", "0", "0", "0", "0"]]

      expect(b.game_over?(:x)).to be false
    end

    it 'returns true when tie (board is full)' do
      b.field = [[:x, :*, :*, :x, :x, :x, :*],
                [:*, :x, :*, :*, :*, :x, :*],
                [:x, :*, :*, :x, :*, :x, :*],
                [:x, :*, :x, :*, :x, :*, :x],
                [:x, :*, :*, :x, :*, :x, :*],
                [:*, :x, :*, :x, :*, :x, :*]]

      expect(b.game_over?(:x)).to be true
    end

    it 'returns true when 4 pieces in a row diagonal right' do
      b.field = [["0", "0", "0", "0", "0", "0", "0"],
                ["0", "0", "0", "0", "0", "0", "0"],
                ["0", "0", "0", "0", "0", :x, "0"],
                ["0", "0", "0", "0", :x, "0", "0"],
                ["0", "0", "0", :x, "0", "0", "0"],
                ["0", "0", :x, "0", "0", "0", "0"]]

      expect(b.game_over?(:x)).to be true
    end

    it 'returns false when 3 pieces in a row diagonal (any sense)' do
      b.field = [["0", "0", "0", "0", "0", "0", "0"],
                ["0", "0", "0", "0", "0", "0", "0"],
                ["0", "0", "0", :x, "0", :x, "0"],
                ["0", "0", "0", "0", :x, "0", "0"],
                ["0", "0", "0", :x, "0", :x, "0"],
                ["0", "0", "0", "0", "0", "0", "0"]]

      expect(b.game_over?(:x)).to be false
    end

    it 'returns true when 4 pieces in a row diagonal left' do
      b.field = [["0", "0", "0", "0", "0", "0", "0"],
                ["0", "0", :x, "0", "0", "0", "0"],
                ["0", "0", "0", :x, "0", "0", "0"],
                ["0", "0", "0", "0", :x, "0", "0"],
                ["0", "0", "0", "0", "0", :x, "0"],
                ["0", "0", "0", "0", "0", "0", "0"]]

      expect(b.game_over?(:x)).to be true
    end

  end

end

describe Player do

  let (:b){Board.new}
  let (:p){Player.new(b, :x)}

  describe '#initialize' do

    it 'raises an ArgumentError with 0 arguments' do
      expect{Player.new}.to raise_error
    end

    it 'does not raise an error passing Board instance and symbol' do
      expect{p}.not_to raise_error
    end

    it 'saves your passed-in value for @board' do

      expect(p.instance_variable_get(:@board)).to eq(b)

    end

    it 'saves your passed-in value for @piece' do

      expect(p.instance_variable_get(:@piece)).to eq(:x)
    end

    it 'gets an array and saves it in @board_array' do

      b.field = [["0", "0", "0", "0", "0", "0", "0"],
                ["0", "0", "0", "0", "0", "0", "0"],
                ["0", "0", "0", "0", "0", "0", "0"],
                ["0", "0", "0", "0", "0", "0", "0"],
                ["0", "0", "0", "0", "0", "0", "0"],
                ["0", "0", "0", "0", "0", "0", "0"]]

      expect(p.instance_variable_get(:@board_array)).to eq(b.field)

    end

  end

  describe '#make_move' do

    # Can't check because they are private
    # it 'gets input from player'
    # it 'checks if input is valid: column is within the board'
    # it 'check if input is valid: column is full'
    # it 'finds the bottom-most row of correct column'

    it 'adds piece to board at correct position' do
      b.field = [["0", "0", "0", "0", "0", "0", "0"],
                    ["0", "0", "0", "0", "0", "0", "0"],
                    ["0", "0", "0", "0", "0", "0", "0"],
                    ["0", "0", "0", "0", "0", "0", "0"],
                    ["0", "0", "0", "0", "0", "0", "0"],
                    ["0", :x, "0", "0", "0", "0", "0"]]

      expect(p.make_move(5,2)).to eq(:x)

    end

  end

  describe '#move' do

    it 'should not add a piece to a full column'

    it 'should add a piece to the lowest row in the same column'

  end

end


describe Game do

  let (:g){Game.new}

  describe "#initialized" do

    it 'raises an ArgumentError with 1 arguments' do
      expect{Game.new(1)}.to raise_error
    end

    it 'does not raise error when passing no arguments' do
      expect{g}.not_to raise_error
    end

    it 'creates a new Board object' do
      expect(g.instance_variable_get(:@board)).to be_a(Board)
    end

  end

  describe "#start_game" do

    it 'creates a Player object'

  end

  describe '#play_against_AI' do

    it 'should return true if input is 1' do

      allow(:g).to receive(:gets).and_return("1")

      expect(g.play_against_AI).to be true

    end


  end


end

















