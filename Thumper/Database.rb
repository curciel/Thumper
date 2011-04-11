#
#  Database.rb
#  Thumper
#
#  Created by Daniel Westendorf on 4/8/11.
#  Copyright 2011 Daniel Westendorf. All rights reserved.
#
require 'rubygems'
require 'sqlite3'
require 'sequel'

DB = Sequel.sqlite(Dir.home + "/Library/Thumper/music.db")
class Artist < Sequel::Model
    plugin :schema
    set_schema do
        String  :id, :primary_key => true
        String  :name
    end
    
    create_table unless table_exists?

end

class Album < Sequel::Model
    plugin :schema
    set_schema do
        String :id, :primary_key => true
        String :title
        String :artist
        String :cover_art
        String :artist_id, :index => true
    end

    create_table unless table_exists?

end

class Song < Sequel::Model
    plugin :schema
    set_schema do
        String :id, :primary_key => true
        String :title
        String :artist
        String :duration
        String :bitrate
        String :track
        String :year
        String :genre
        String :size
        String :suffix
        String :album
        String :cover_art
        String :path
        String :album_id, :index => true
    end

    create_table unless table_exists?
end

class Playlist < Sequel::Model
    plugin :schema
    
    set_schema do
        String :id, :primary_key => true
        String :name
    end
    
    create_table unless table_exists?

end

DB[:playlists].insert(:name => "Thumper Current") if DB[:playlists].empty?

class PlaylistSong < Sequel::Model
    plugin :schema
    
    set_schema do
        String :id, :primary_key => true
        String :playlist_id, :index => true
        String :song_id, :index => true
    end

    create_table unless table_exists?

end