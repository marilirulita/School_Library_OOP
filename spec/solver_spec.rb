require_relative '../solver'

describe Solver do
  before(:all) do
    @object = Solver.new
  end

  describe "#factorial method"
    context 'takes one argument and returns the factorial for that number' do
      it 'expects factorial of 5 to be 120' do
        expect(@object.factorial(5)).to eq(120)
      end
  end
end