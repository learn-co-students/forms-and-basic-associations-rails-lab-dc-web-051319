# frozen_string_literal: true

class Note < ActiveRecord::Base
  # add associations here
  belongs_to :song
end
