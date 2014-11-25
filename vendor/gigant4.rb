require 'imdb'
require 'awesome_print'
require 'kinopoisk_parser'
require 'open-uri'
require 'rubypress'


wp = Rubypress::Client.new(:host => "gigant-cinema.ru", 
                           :username => "mibamur", 
                           :password => "Fxb23saL",
                           :retry_timeouts => true)

head_content='[vc_row][vc_column width="1/1"][vc_column_text]'
foot_content='[/vc_column_text][/vc_column][/vc_row][vc_row][vc_column width="1/1"][vh_image_gallery onclick="link_image" custom_links_target="_self" img_size="183x183" title="Photos 6 & Videos 1" images="824,826,969,825,827,828,823"][/vc_column][/vc_row][vc_row][vc_column width="1/1"][vh_event_tickets event_title="Showtime & Tickets"][/vc_column][/vc_row]'

FILMNAME="Джон Уик"
m = Kinopoisk::Movie.new FILMNAME
ap m.id
ap m.title
ap m.url

ap m.actors
ap m.art_directors
ap m.box_office_ru
ap m.box_office_us
ap m.box_office_world
ap m.budget
ap m.composers
ap m.countries
ap m.description
ap m.directors
ap m.duration
ap m.editors
ap m.genres
ap m.imdb_rating
ap m.imdb_rating_count
ap m.length
ap m.minimal_age
ap m.operators
ap m.poster
ap m.poster_big
ap m.premiere_ru
ap m.premiere_world
ap m.producers
ap m.rating
ap m.rating_count
ap m.slogan
ap m.title_en
ap m.writers
ap m.year

