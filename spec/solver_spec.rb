require_relative '../solver'

describe '#factorial method' do
  before(:all) do
    @object = Solver.new
  end
  context 'takes one argument and returns the factorial for that number' do
    it 'expects factorial of 5 to be 120' do
      expect(@object.factorial(5)).to eq(120)
    end

    it 'expects factorial of 0 to be 1' do
      expect(@object.factorial(0)).to eq(1)
    end

    it 'expects factorial of negative number to return an string' do
      expect(@object.factorial(-5)).to eq('Not a valid number')
    end
  end
end

describe '#reverse method' do
  before(:all) do
    @object = Solver.new
  end
  context 'takes one argument and returns a string reversed' do
    it 'expects reverse of "Hello" to be "olleH"' do
      expect(@object.reverse('Hello')).to eq('olleH')
    end

    it 'expects reverse of "Goo Moorning" to be "gninrooM ooG"' do
      expect(@object.reverse('Goo Moorning')).to eq('gninrooM ooG')
    end

    it 'expects reverse of "See you" to be "uoy eeS"' do
      expect(@object.reverse('See you')).to eq('uoy eeS')
    end
  end
end

describe '#fizzbuzz method' do
  before(:all) do
    @object = Solver.new
  end
  context 'takes one argument, and returns a string' do
    it 'expects 3 to be divisible by 3 and return "fizz"' do
      expect(@object.fizzbuzz(3)).to eq('fizz')
    end

    it 'expects 5 to be divisible by 5 and return "buzz"' do
      expect(@object.fizzbuzz(5)).to eq('buzz')
    end

    it 'expects 15 to be divisible by 3 and 5 and return "fizzbuzz"' do
      expect(@object.fizzbuzz(15)).to eq('fizzbuzz')
    end

    it 'expects 7 to not be divisible by 3 or 5 and return "7"' do
      expect(@object.fizzbuzz(7)).to eq('7')
    end
  end
end
