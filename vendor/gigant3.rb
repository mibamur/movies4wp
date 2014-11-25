require 'imdb'
require 'awesome_print'
require 'kinopoisk_parser'
require 'open-uri'
require 'rubypress'



#~ i = Imdb::Search.new("Джон Уик")
#~ ap i.movies.first.id
#~ 
#~ ii = Imdb::Movie.new(i.movies.first.id)
#~ ap ii.title
#~ ap ii.languages
#~ ap ii.length
#~ ap ii.cast_members
#~ 
#~ ap ii.trailer_url


wp = Rubypress::Client.new(:host => "gigant-cinema.ru", 
                           :username => "mibamur", 
                           :password => "Fxb23saL",
                           :retry_timeouts => true)


#~ ap wp.getPostTypes

head_content='[vc_row][vc_column width="1/1"][vc_column_text]'
foot_content='[/vc_column_text][/vc_column][/vc_row][vc_row][vc_column width="1/1"][vh_image_gallery onclick="link_image" custom_links_target="_self" img_size="183x183" title="Photos 6 & Videos 1" images="824,826,969,825,827,828,823"][/vc_column][/vc_row][vc_row][vc_column width="1/1"][vh_event_tickets event_title="Showtime & Tickets"][/vc_column][/vc_row]'


FILMNAME="Джон Уик"
if false
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

end

movie_time_values={}
movie_time_values['date']='11.16.2014'
poster_movies_id=1801


 = Struct.new(:key, :value)
#=> Customer
Customer.new("Dave", "123 Main")

wp.newPost( #:blog_id => 0, # 0 unless using WP Multi-Site, then use the blog id
		:content => {
					 :post_status  => "publish",
					 :post_content => head_content+"\nThis is the body\n"+foot_content,
					 :post_title   => FILMNAME,
					 :post_name    => "/кого",
					 :post_author  => 2, # 1 if there is only the admin user, otherwise the user's id
					 :sticky 		=> false,
					 :post_format 	=> "standard"
					 #~ 
					 #~ :custom_fields => [ [:key => "event_actors", :value => "Киракако"] ]
				 },
		:custom_fields => [
					{
						"key" => "event_box_office",
						"value" => "150000"
					},
					{
						"key" => "event_country",
						"value" => "США, Индия"
					},
					{
						"key" => "event_director",
						"value" => "event_director"
					}]
		 )

wp.getPosts(:filter => { :post_type => 'movies'}).each_with_index do |post, ndx|
	#~ ap post
	#~ ap post['post_id']+' '+URI::decode(post['post_name'])+' '+post['post_title']
	ap post

	#~ ap post['post_status']
	#~ ap post['post_type']
	#~ ap post['post_format']
	#~ ap post['post_content']
	#~ ap post['terms']
	#~ break if ndx>3
	
end


#~ ap wp.getTaxonomies
#~ ap wp.getTerms
#~ ap wp.getOptions

#~ ap wp.setOptions


#~ ap wp.getPosts 
#~ ap wp.getPostFormats

#~ f = File.new(FILENAME, 'rb').read
#~ wp.uploadFile(:data => {
	#~ :name => FILENAME,
	#~ :type => MIME::Types.type_for(FILENAME).first.to_s,
	#~ :bits => XMLRPC::Base64.new(IO.read(FILENAME))
#~ })


#~ 
#~ ap wp.getPost(:id=>654)
    
    #~ wp.getPosts
    #~ wp.newPost
    #~ wp.editPost
    #~ wp.deletePost
    #~ wp.getPostType
    #~ wp.getPostTypes
    #~ wp.getPostFormats
    #~ wp.getPostStatusList
