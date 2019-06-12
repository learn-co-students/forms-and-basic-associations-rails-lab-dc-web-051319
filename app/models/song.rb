class Song < ActiveRecord::Base
    belongs_to :artist
    belongs_to :genre
    has_many :notes

    def genre_name=(genre)
        self.genre = Genre.find_or_create_by(name: genre)
    end
 
    def genre_name
        self.genre ? self.genre.name : nil
    end

    def artist_name=(artist)
        self.artist = Artist.find_or_create_by(name: artist)
    end
 
    def artist_name
        self.artist ? self.artist.name : nil
    end

    def note_contents=(notes)
        notes.delete("")
        notes.each do |note|
            note = Note.new(content: note)
            self.notes << note
        end
    end

    def note_contents
        self.notes.map(&:content)
    end
end
