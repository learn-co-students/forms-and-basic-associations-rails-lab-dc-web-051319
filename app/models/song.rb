class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(genre)
    self.genre = Genre.find_or_create_by(name: genre)
  end

  def genre_name
    return self.genre.name if self.genre
  end

  def artist_name=(artist)
    self.artist = Artist.find_or_create_by(name: artist)
  end

  def artist_name
    return self.artist.name if self.artist
  end

  def note_contents=(notes)
    notes.delete("")
    notes.each do |note|
      new_note = Note.new(content: note)
      self.notes << new_note
    end
  end
  
  def note_contents
    self.notes.collect do |note|
      note.content
    end
  end


end
