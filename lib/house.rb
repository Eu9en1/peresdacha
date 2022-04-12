# frozen_string_literal: true

require 'date'

# Данные об издательствах
class House
  attr_reader :id, :name

  def initialize(record)
    @id = record['id']

    @name = record['publishingHouse']
  end
end
