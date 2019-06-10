class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes# add associations here


  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end


  def artist_name=(name)
  self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  end

  def note_contents=(notes)
   notes.each do |content|
     #goes through each of the notes and gets to the content
     if content.strip != ''
       #right here we are making sure there is actual content within the notes
       self.notes.build(content: content)
       #if there is content then we are going to create a new array with content
       #<Note id: nil, content = "content", song_id = self
     end
   end
 end

  def note_contents
    self.notes.collect do |note|
      note.content
    end
  end
end
