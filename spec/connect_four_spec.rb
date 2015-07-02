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

=end


require 'connect_four'

describe Board do

  let (:b){Board.new}

  describe '#build_board' do

    it 'returns an array 6 subarrays, each with 7 zeros' do
      expect(b.build_board).to eq(Array.new(6){Array.new(7){"0"}})
    end

  end

  describe '#vertical_win?' do

    before do
     b.build_board
     @game_board_array = b.field
    end

    it 'returns true when 4 pieces in a row vertically' do
      @game_board_array[5][2] = :x
      @game_board_array[4][2] = :x
      @game_board_array[3][2] = :x
      @game_board_array[2][2] = :x

      expect(b.vertical_win?(:x)).to be true

    end

    it 'returns false when 3 pieces in a row vertically'

    

    it 'reject false when 4 pieces in a row are not same'


  end


end