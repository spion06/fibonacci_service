class Fibonacci
  def initialize(num)
    @num = validate(num)
  end

  # custom exception to allow error handling
  class InvalidInputError < Exception
  end

  # verifies that a valid input was given
  def validate(num)

    # raise exception if input isn't an integer
    if ! /^\d+$/.match(num)
      raise InvalidInputError, "Invalid number. Only integers are supported. You passed #{num}"
    end

    num = num.to_i
    # raise exception if input isn't an postiive integer
    if num < 0
      raise InvalidInputError, 'Invalid number. Must be positive number'
    end

    num
  end

  # will calculate the Fibonacci sequence up to the given number
  def calculate
    # account for special cases. if the number of calcualte is 2 or less only the seed will be needed
    case @num
    when 0
      [] 
    when 1
      [0]
    when 2
      [1,2]
    else
      # run with intial seed accounted for
      (@num - 2).times.inject([0,1]) do |sum,x| 
        sum << sum.last(2).inject(0) do |seq,y| 
          seq + y 
        end
      end
    end
  end
end
