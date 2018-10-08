# Класс Test, описывает процесс прохождения теста и хранит вопросы
class Test
  attr_reader :score

  def initialize(questions)
    #Номер текущего вопроса
    @current_question = 0

    #Общий счет ответов
    @score = 0

    #Массив с вопросами
    @questions = questions
  end

  #Метод изменяет общий счет ответов
  def process(user_choice)
    if user_choice == 1
      @score += 2
    elsif user_choice == 3
      @score += 1
    end

    #увеличиваем номер текещего вопроса
    @current_question += 1
  end

  #Метод, проверяющий остались ли еще воросы
  def final_question?
    @current_question == @questions.size
  end

  #Метод показывает вопрос
  def show_question
    @questions[@current_question]
  end
end
