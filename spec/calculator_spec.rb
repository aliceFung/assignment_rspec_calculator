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
      expect(calc.divide(2,0)).to raise_error
    end

    it 'divides two positive numbers' do
      expect(calc.divide(2,3)).to eq(6)
    end

    it 'divides two negative numbers' do
      expect(calc.divide(-1,-5)).to eq(5)
    end

    it 'divides two floats' do
      expect(calc.divide(4.1, 3.2)).to eq(13.12)
    end

    it 'divides a float and an integer' do
      expect(calc.divide(1.1,1)).to eq(1.1)
    end

  end


end