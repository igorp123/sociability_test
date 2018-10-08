#Подключаем файлы с классами
require_relative 'lib/test'
require_relative 'lib/result_printer'

current_path = File.dirname(__FILE__)

question_path = "#{current_path}/data/questions.txt"
results_path = "#{current_path}/data/results.txt"

begin
  questions = File.readlines(question_path, encoding: 'UTF-8')
  results = File.readlines(results_path, encoding: 'UTF-8')
rescue
  abort "Файл с результатами не найден"
end

#Создаем объекты классов
test = Test.new(questions)
result = ResultPrinter.new(results)

puts "Тест ваш уровень общительности \n\n"
puts "Тест поможет определить ваш уровень коммуникабельности."
puts "Для этого необходимо правдиво ответить на следующие вопросы. \n\n"

#Выполняем цикл пока не будет задан последний вопрос
while !test.final_question?
  user_choice = 0
    #Проверка правильности ввода вырианта
    while !user_choice.between?(1, 3)
      #Выводим очередной вопрос
      puts test.show_question
      #Спрашиваем пользователя ответ
      puts 'Введите ваш ответ (1 - Да, 2 - нет, 3 - иногда)'
      user_choice = STDIN.gets.to_i
    end

  test.process(user_choice) #Обрабатываем общий счет ответов
end

# Выводим результат теста, передав объект test в метод объекта result
result.print_results(test)



