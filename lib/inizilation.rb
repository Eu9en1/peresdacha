# frozen_string_literal: true

require_relative '../lib/category'
require_relative '../lib/house'
require_relative '../lib/author'
require_relative '../lib/book'

require 'json'

# Инизилизация
module Init
  def self.read_json
    file = File.read('./Books.json')
    table = JSON.parse(file)
    list_category = init_category(table['categories'])
    list_house = init_house(table['publishingHouses'])
    list_author = init_autor(table['internalAuthors'])
    list_book = init_book(table['books'], list_category, list_house,
                          list_author)
    [list_book, list_author]
  end

  def self.init_category(table)
    list_category = []
    table.each do |item|
      list_category += Array.new(1, Category.new(item))
    end
    list_category
  end

  def self.init_house(table)
    list_house = []
    table.each do |item|
      list_house += Array.new(1, House.new(item))
    end
    list_house
  end

  def self.init_autor(table)
    list_author = []
    table.each do |item|
      list_author += Array.new(1, Author.new(item))
    end
    list_author
  end

  def self.init_book(table, categories, house, autors)
    list_book = []
    table.each do |item|
      list_book += Array.new(1, Book.new(item, categories, house, autors))
    end
    list_book
  end
end
