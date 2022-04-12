# frozen_string_literal: true

require 'date'

# Данные об авторе
class Author
  attr_reader :name, :id, :letter

  def initialize(record)
    @id = record['id']

    @name = record['authorName']

    @letter = record['letter']
  end
end
