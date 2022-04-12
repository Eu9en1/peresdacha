# frozen_string_literal: true

require 'date'

# Данные о категориях
class Category
  attr_reader :id, :name

  def initialize(record)
    @id = record['id']

    @name = record['categoryName']
  end
end
