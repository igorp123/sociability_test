# Класс Test, описывает процесс прохождения теста и хранит вопросы
class Test
  YES_ANSWER = 2
  NO_ANSWER = 1

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
      @score += YES_ANSWER
    elsif user_choice == 3
      @score += NO_ANSWER
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
