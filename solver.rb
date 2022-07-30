class Solver
  def factorial(n)
    answer = n
      until n == 1
        n = n -1
        answer = answer * n
      end
    return answer
  end
end