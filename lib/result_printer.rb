#Класс хранит результаты теста и выводит на экран итоговый результат.
class ResultPrinter
  def initialize (results)
    #Варианты результатов
    @results = results
  end

  # Метод выводит результат на экран, получив в качестве параметра объект test и сравнив его с количством заданных баллов
  def print_results(test)
    puts "\nВы набрали #{test.score} баллов \n\n"
    puts "Ваш результат:\n\n"

    result_index = case test.score
                   when 0..3 then 6
                   when 4..8 then 5
                   when 9..13 then 4
                   when 14..18 then 3
                   when 19..24 then 2
                   when 25..29 then 1
                   else 0
                   end

    puts @results[result_index]
  end
end
