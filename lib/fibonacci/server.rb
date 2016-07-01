require 'json'
require 'sinatra'
require 'fibonacci'


class Fibonacci
  class Server < Sinatra::Application
    get '/fibonacci/:num' do
      begin
        { code: 200, value: Fibonacci.new(params[:num]).calculate }.to_json
      rescue Fibonacci::InvalidInputError => e
        halt 400, { code: 400, message: e.message, exception_class: e.class, backtrace: e.backtrace }.to_json
      rescue Exception => e
        halt 500, { code: 500, message: e.message, exception_class: e.class, backtrace: e.backtrace }.to_json
      end
    end
  end
end
