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
    return 'fizzbuzz' if n % 3 == 0 && n % 5 == 0
    return 'fizz' if n % 3 == 0
    return 'buzz' if n % 5 == 0
    return n.to_s
  end
end