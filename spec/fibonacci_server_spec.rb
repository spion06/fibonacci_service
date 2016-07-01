require 'spec_helper'
require 'rack/test'

describe Fibonacci::Server do

  include Rack::Test::Methods

  let(:app) do
    Fibonacci::Server
  end

  let(:normal_input) do
    get('/fibonacci/10')
  end

  let(:negative_input) do
    get('/fibonacci/-10')
  end

  let(:float_input) do
    get('/fibonacci/-10')
  end

  let(:letter_input) do
    get('/fibonacci/abc123')
  end

  it 'should return valid json' do
    expect{ JSON.parse(normal_input.body) }.to_not raise_error
  end

  it 'should return the appropriate sequence' do
    expect( normal_input.body ).to eq( { code:200, value: [0,1,1,2,3,5,8,13,21,34] }.to_json )
  end


  it 'should return json when it errors' do
    expect{ JSON.parse(negative_input.body) }.to_not raise_error
    expect{ JSON.parse(float_input.body) }.to_not raise_error 
    expect{ JSON.parse(letter_input.body) }.to_not raise_error
  end

  it 'should return a 400 http code with an invalid input' do
    expect( negative_input.status ).to eq( 400 )
    expect( float_input.status ).to eq( 400 )
    expect( letter_input.status ).to eq( 400 )

    expect( JSON.parse(negative_input.body)['code'] ).to eq( 400 )
    expect( JSON.parse(float_input.body)['code'] ).to eq( 400 )
    expect( JSON.parse(letter_input.body)['code'] ).to eq( 400 )

  end


end
