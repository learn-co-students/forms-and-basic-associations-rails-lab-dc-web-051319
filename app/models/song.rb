# frozen_string_literal: true

class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    artist&.name
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    genre&.name
  end

  def note_contents
    notes.collect(&:content)
  end

  def note_contents=(contents)
    contents.each do |content|
      if content != ''
        note = Note.create(content: content)
        notes << note
      end
    end
  end
end
