require 'spec_helper'

describe Fibonacci do

  let(:fibonacci_10) do
    Fibonacci.new("10")
  end

  it 'should return the appropriate sequence' do
    expect(fibonacci_10.calculate).to eq( [0, 1, 1, 2, 3, 5, 8, 13, 21, 34] )
  end

  it 'should error if invalid input is given' do
    expect{ Fibonacci.new("-1") }.to raise_error Fibonacci::InvalidInputError
    expect{ Fibonacci.new("123.456") }.to raise_error Fibonacci::InvalidInputError
    expect{ Fibonacci.new("abcdefg") }.to raise_error Fibonacci::InvalidInputError
  end

#    expect(fibonacci_10.calculate).to eq( { code:200, value: [0,1,1,2,3,5,8,13,21,34] } )

end
