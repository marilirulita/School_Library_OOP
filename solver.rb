class Solver
  def factorial(n)
    if n >= 0
      return 1 if n == 0
      answer = n
      until n == 1
        n = n -1
        answer = answer * n
      end
      return answer
    end
    return "Not a valid number"
  end

  def reverse(word)
    word.reverse
  end

  def fizzbuzz(n)
    return 'fizz' if n % 3 == 0
  end
end