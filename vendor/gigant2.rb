require 'imdb'
require 'awesome_print'
require 'kinopoisk_parser'
require 'open-uri'
require 'rubypress'

#~ cat 1.csv | sed 's#  ##g' | sed -e 's# ;#;#g' | sed -e 's#; #;#g'

wp = Rubypress::Client.new(:host => "gigant-cinema.ru",
                           :username => "mibamur",
                           :password => "Fxb23saL",
                           :retry_timeouts => true)

head_content='[vc_row][vc_column width="1/1"][vc_column_text]'
foot_content='[/vc_column_text][/vc_column][/vc_row][vc_row][vc_column width="1/1"][vh_image_gallery onclick="link_image" custom_links_target="_self" img_size="183x183" title="Photos 6 & Videos 1" images="824,826,969,825,827,828,823"][/vc_column][/vc_row][vc_row][vc_column width="1/1"][vh_event_tickets event_title="Showtime & Tickets"][/vc_column][/vc_row]'

FILMNAME="Джон Уик"
CustomFields = Struct.new(:key, :value)
m = Kinopoisk::Movie.new FILMNAME
ap m.id
title=m.title
url  =m.url

ap m

custom_fields_hash={}
custom_fields_hash['event_actors'] = m.actors
custom_fields_hash['event_box_office']     =m.box_office_ru
custom_fields_hash['event_country']        =m.countries
#~ custom_fields_hash=['event_director']
custom_fields_hash['event_imdb_rating']    = m.imdb_rating
#~ custom_fields_hash=['event_imdb_url']
#~ custom_fields_hash=['event_language']        =
#~ custom_fields_hash=['event_official_sites']=
custom_fields_hash['event_release']        = m.premiere_ru
#~ custom_fields_hash=['event_restriction'] =
#~ custom_fields_hash=['event_writers']     =
custom_fields_hash['event_year']           = m.year
#~ custom_fields_hash=['kd_event']

custom_fields_hash['poster_movies_id']     = 1801
custom_fields_hash['movies_length']        = m.length
custom_fields_hash['movie_time_values']    = m.duration

#~ custom_fields_hash=['ratings_average']
#~ custom_fields_hash=['ratings_score']
#~ custom_fields_hash=['ratings_users']

wp.newPost( #:blog_id => 0, # 0 unless using WP Multi-Site, then use the blog id
        :content => {
                     :post_status  => "publish",
                     :post_content => head_content+m.description+foot_content,
                     :post_title   => title,
                     :post_name    => url,
                     :post_author  => 2, # 1 if there is only the admin user, otherwise the user's id
                     :sticky        => false,
                     :post_format   => "standard",
                     :custom_fields => custom_fields_hash.each_pair {|key, val| CustomFields.new(key, val)}
                 }
         )

wp.getPosts(:filter => { :post_type => 'movies'}).each_with_index do |post, ndx|
    #~ ap post
    #~ ap post['post_id']+' '+URI::decode(post['post_name'])+' '+post['post_title']
    #~ ap post

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
