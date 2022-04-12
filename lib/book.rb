# frozen_string_literal: true

# Данные о книгах
class Book
  attr_reader :category_name, :name, :authors_name, :money, :isbn,
              :last_date, :house_name

  def initialize(record, categories, houses, authors)
    @id = record['id']

    @name = record['attributes']['name']

    @last_date = record['attributes']['lastReleaseDate']

    @isbn = record['attributes']['isbn']

    @category_id = record['relationships']['category']

    @category_name = category_name_get(categories)

    @house_id = record['relationships']['publishingHouse']

    @house_name = house_name_get(houses)

    @authors_id = id_get(record['relationships']['authors'])

    @authors_name = author_name_get(authors)

    @money = record['attributes']['amountTotal']
  end

  def category_name_get(categories)
    categories.each do |item|
      return item.name if item.id == @category_id
    end
    ''
  end

  def house_name_get(houses)
    houses.each do |house|
      return house.name if house.id == @house_id
    end
    ''
  end

  def id_get(list_author)
    list = []
    list_author.each do |author|
      list.append(author['id'])
    end
    list
  end

  def author_name_get(authors)
    author_name_list = []
    authors.each do |item|
      @authors_id.each do |author|
        author_name_list.push(item.name) if item.id == author
      end
    end
    author_name_list
  end
end
