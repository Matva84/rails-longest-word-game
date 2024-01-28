class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    @word = params[:word]
    letters_str = params[:letters]
    puts(letters_str)
    if all_letters?(@word, letters_str)
      puts("A letter is not included")
    else
      puts("All letters included")
      redirect_to score_path
    end
  end

  def all_letters?(word_str, letters_list)
    word_str.split.each do |letter|
      unless letters_list.include?(letter)
        return false
      end
    end
    return true
  end
end
