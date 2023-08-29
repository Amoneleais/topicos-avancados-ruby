#HIGH ORDER

#Cria uma função que recebe um array e outra função como parámetros
def apply_to_each(array, function)
  result = []
  # Aplica a função passada no parâmetro para cada elemento no array
  array.each do |element|
      result << function.call(element)
  end
  result
end

#Encapsulamento de função na variável utilizando um objeto Proc
square = Proc.new { |x| x * x}

numbers = [6, 25, 13, 34, 51]

squared_numbers = apply_to_each(numbers, square)
puts "\nHIGH ORDER:", squared_numbers.inspect

#COMPOSED

add_one = ->(x) { x + 1 }
double = ->(x) { x * 2 }
square = ->(x) { x ** 2 }

# Compor funções usando chamadas sucessivas
composed_function = ->(x) { square.call(double.call(add_one.call(x))) }

result = composed_function.call(3)
puts "\nCOMPOSED:", result

#IMMUTABILITY

students = [
  { name: 'Alice', primeira_unidade: 10, segunda_unidade: 5 },
  { name: 'Bob', primeira_unidade: 3, segunda_unidade: 4 },
  { name: 'Charlie', primeira_unidade: 7, segunda_unidade: 6 }
]

# Utilizando map para calcular a média dos estudantes
average_scores = students.map do |student|
  {
    name: student[:name],
    primeira_unidade: student[:primeira_unidade],
    segunda_unidade: student[:segunda_unidade],
    media: (student[:primeira_unidade] + student[:segunda_unidade]) / 2
  }
end

puts "\nIMMUTABILITY:\nAlunos sem médias: ", students
puts "\nAlunos com médias: ", average_scores

#PURE

calculate_rectangle_area = lambda{ |length, width| length * width}

length = 5
width = 3
area = calculate_rectangle_area.call(length, width)
puts "\nPURE:\nA área do retângulo é: #{area}"

#RECURSIVE

def factorial(x)
  if x == 0
      return 1
  end
  return x * factorial(x - 1)
end

puts "\nRECURSIVE:", factorial(5)

#CURRYING

curried_add = ->(x) { ->(y) { ->(z) { x + y + z } } }

# Aplicar parcialmente argumentos à função curry
add_5 = curried_add.call(5)
add_5_and_10 = add_5.call(10)

# Testar as funções aplicadas parcialmente
result1 = add_5_and_10.call(20)
result2 = curried_add.call(5).call(10).call(20)

puts "\nCURRYING:\nResultado 1: #{result1}"
puts "Resultado 2: #{result2}"
