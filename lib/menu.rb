# frozen_string_literal: true

require 'csv'
require 'tty-prompt'

require_relative '../lib/book'
PROMPT = TTY::Prompt.new

# Функционал меню
module FunctionMenu
  def self.list_author_char(list_author, first)
    author = list_author.find_all { |k| k.letter == first }
    authors = author.map(&:name)
    authors.sort
    authors
  end

  def self.second_menu(list_author, first)
    level_second = list_author_char(list_author, first)
    if level_second.length.zero?
      puts('Не найденно таких авторов')
      return first_menu(list_author)
    end
    level_second.push('Вернемся на первый уровень меню')
    level_second.push('Завершить работу')
    authors = PROMPT.select('Второй уровень меню', level_second)
    return 'Завершить работу' if authors == 'Завершить работу'
    if authors == 'Вернемся на первый уровень меню'
      return first_menu(list_author)
    end

    [first, authors]
  end

  def self.first_menu(list_author)
    level_one = ('А'..'Я').to_a
    level_one.push('Завершить работу')
    first = PROMPT.select('Первый уровень меню', level_one)
    return 'Завершить работу' if first == 'Завершить работу'

    second_menu(list_author, first)
  end
end
