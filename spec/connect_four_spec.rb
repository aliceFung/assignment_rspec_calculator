=begin
Game class
  initialize
  start_game
  choose_opponent
  play_against_AI?

Play
  initialize
  get_input
  move
  check?
  find_row

Board
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



  end


end