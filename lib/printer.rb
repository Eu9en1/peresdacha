# frozen_string_literal: true

require 'csv'
require 'tty-prompt'

require_relative '../lib/book'
PROMPT = TTY::Prompt.new

# Класс вывода и обработки
module Printer
  def self.book_author(list_book, author)
    list_book.find_all { |x| x.authors_name.include? author }
  end

  def self.book_name(list_book)
    list_name = list_book.map(&:name)
    list_name.sort
  end

  def self.with_any_author(list_book)
    list_book.find_all { |x| x.authors_name.length > 1 }
  end

  def self.authors_name_list(list_book, author)
    authors = list_book.map(&:authors_name)
    author_uniq = []
    authors.each do |author_list|
      author_list.each do |new_author|
        if !author_uniq.include?(new_author) && author != new_author
          author_uniq.push(new_author)
        end
      end
    end
    author_uniq
  end

  def self.first_print(list_book, author)
    list_book_authors = book_author(list_book, author)
    counter = list_book_authors.length
    counter_authors = with_any_author(list_book_authors).length
    authors_with_any = authors_name_list(list_book_authors, author)
    book_name_list = book_name(list_book_authors)
    print_info(counter, counter_authors, authors_with_any, book_name_list)
  end

  def self.print_info(counter, counter_authors, authors_with_any, book)
    puts('Количество книг данного автора, которые есть' \
         " в настоящий момент #{counter}")
    puts('Количество книг данного автора, которые' \
         "были написаны в соавторстве #{counter_authors}")
    puts("Список уникальных имён соавторов #{authors_with_any}")
    puts("Список книг данного автора #{book}")
  end
end
