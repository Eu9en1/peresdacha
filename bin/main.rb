# frozen_string_literal: true

require_relative '../lib/inizilation'
require_relative '../lib/menu'
require_relative '../lib/printer'

require 'tty-prompt'

PROMPT = TTY::Prompt.new

MENU = { 'Вернемся на первый уровень меню': :first,
         'Вернемся на второй уровень меню': :second,
         'Завершить работу': :exit }
       .freeze

def main
  list_array = Init.read_json
  list_book = list_array[0]
  list_author = list_array[1]
  result = FunctionMenu.first_menu(list_author)
  loop do
    return if result == 'Завершить работу'

    first = result[0]
    author = result[1]
    Printer.first_print(list_book, author)

    case PROMPT.select('Меню', MENU)
    when :first then result = FunctionMenu.first_menu(list_author)
    when :second then result = FunctionMenu.second_menu(list_author, first)
    when :exit then exit
    end
  end
end

main if $PROGRAM_NAME == __FILE__
