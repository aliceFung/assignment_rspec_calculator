require 'calculator'

describe Calculator do

  let (:calc) {Calculator.new}

  describe '#add' do

    it 'adds two positive numbers' do
      expect(calc.add(2,3)).to eq(5)
    end

    it 'adds two negative numbers' do
      expect(calc.add(-1,-5)).to eq(-6)
    end

    it 'adds two floats' do
      expect(calc.add(4.1, 3.2)).to eq(7.3)
    end

    it 'adds a float and an integer' do
      expect(calc.add(1.1,1)).to eq(2.1)
    end

  end

  describe '#subtract' do

    it 'subtracts two positive numbers' do
      expect(calc.subtract(2,3)).to eq(-1)
    end

    it 'subtracts two negative numbers' do
      expect(calc.subtract(-1,-5)).to eq(4)
    end

    it 'subtracts two floats' do
      expect(calc.subtract(4.1, 3.2)).to be_within(0.1).of(0.9)
    end

    it 'subtracts a float and an integer' do
      expect(calc.subtract(1.1,1)).to be_within(0.1).of(0.1)
    end

  end

   describe '#multiply' do

    it 'multiplies two positive numbers' do
      expect(calc.multiply(2,3)).to eq(6)
    end

    it 'multiplies two negative numbers' do
      expect(calc.multiply(-1,-5)).to eq(5)
    end

    it 'multiplies two floats' do
      expect(calc.multiply(4.1, 3.2)).to eq(13.12)
    end

    it 'multiplies a float and an integer' do
      expect(calc.multiply(1.1,1)).to eq(1.1)
    end

  end

  describe '#divide' do

    it 'raises an error when divided by 0' do
      expect{calc.divide(2,0)}.to raise_error
    end

    it 'returns an integer if there is no remainder' do
      expect(calc.divide(3,3)).to be_a(Integer)
    end

    it 'returns a float if there is a remainder' do
      expect(calc.divide(3,2)).to be_a(Float)
    end

    it 'divides two positive numbers' do
      expect(calc.divide(2,3)).to be_within(0.1).of(0.66)
    end

    it 'divides two negative numbers' do
      expect(calc.divide(-5,-1)).to eq(5)
    end

    it 'divides two floats' do
      expect(calc.divide(4.1, 3.2)).to be_within(0.1).of(1.28125)
    end

    it 'divides a float and an integer' do
      expect(calc.divide(1.1,1)).to be_within(0.1).of(1.1)
    end

  end

  describe '#pow' do


    it "raises one postive number to the other positive numbers' power" do
      expect(calc.pow(2,3)).to eq(8)
    end

    it 'raises negative number to the positive power' do
      expect(calc.pow(-5,2)).to eq(25)
    end

    it 'raises decimal number to positive power ' do
      expect(calc.pow(4.1, 2)).to be_within(0.1).of(16.81)
    end

  end

  describe '#sqrt' do


    it "sqrt of positive number" do
      expect(calc.sqrt(25)).to eq(5)
    end

    it 'returns negative number raises an error' do
      expect{calc.sqrt(-9)}.to raise_error
    end

    it 'returns an integer for a round number ' do
      expect(calc.sqrt(49)).to be_a(Integer)
    end

    it 'returns two decimal points for non-round root' do
      expect(calc.sqrt(7).to_s.split('.').last.size).to eq(2)
    end

  end


end