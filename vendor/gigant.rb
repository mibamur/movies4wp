require 'rubypress'
require 'enceladus'
require "awesome_print"
require 'themoviedb'

require 'imdb'



#~ require 'wordpress-client'

#~ client = Wordpress.client
#~ client = Wordpress::Client.new
#~ client.access_token = 'YOUR_ACCESS_TOKEN'

#~ user = client.me
#~ site = user.site
#~ posts = site.posts

#~ ap object, options = {}


wp = Rubypress::Client.new(:host => "gigant-cinema.ru",
                           :username => "mibamur",
                           :password => "Fxb23saL",
                           :retry_timeouts => true)
#~ ap wp.getPosts
#~ ap wp.getPostFormats


Tmdb::Api.key("8a221fc31fcdf12a8af827465574ffc9")
Tmdb::Api.language("ru")

#~ Tmdb::Api.language("de")
configuration = Tmdb::Configuration.new

#~ ap configuration.base_url
#~ ap configuration.secure_base_url
#~ ap configuration.poster_sizes
#~ ap configuration.backdrop_sizes
#~ ap configuration.profile_sizes
#~ ap configuration.logo_sizes

#~ ap @now_playing = Tmdb::Movie.now_playing

t = Tmdb::Movie.find("Джон Уик")
t.each do |dd|
    #~ ap dd.original_title
    movie = Tmdb::Movie.detail(dd.id)

    #~ ap movie.id # 550
    #~ ap movie.status # "Released"
    #~ ap movie.release_date # "1999-10-14"
    #~ ap movie.title # "Fight Club"
    #~ ap movie.original_title # "Fight Club"
    #~ ap movie.tagline # "How much can you know about yourself if you've never been in a fight?"
    #~ ap movie.spoken_languages # [{"iso_639_1"=>"en", "name"=>"English"}]
    #~ ap movie.genres # [{"id"=>28, "name"=>"Action"}, {"id"=>18, "name"=>"Drama"}, {"id"=>53, "name"=>"Thriller"}]
    #~ ap movie.overview # "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion."
    #~ ap movie.poster_path # "/2lECpi35Hnbpa4y46JX0aY3AWTy.jpg"
    #~ ap movie.backdrop_path # "/8uO0gUM8aNqYLs1OsTBQiXu0fEv.jpg"
    #~ ap movie.production_countries # [{"iso_3166_1"=>"DE", "name"=>"Germany"}, {"iso_3166_1"=>"US", "name"=>"United States of America"}]


    movie2 = Tmdb::Movie.images(movie.id)
    #~ ap movie2.backdrops
    movie2.posters.each do |im|

      ap ipa = configuration.base_url+'original'+im.file_path
      puts imf = im.file_path.gsub('/','')

      #~ wp.uploadFile(data: {name: imf, type: 'image/jpeg'} )
      #~ imfile = File.open imf
      #~ wp.uploadFile(data: {name: imf, type: 'image/jpeg', } )

      #~ wp.uploadFile imfile

      FILENAME = imf
      f = File.new(FILENAME, 'rb').read
      #~ wp.uploadFile(:data => {:name => imf,
                              #~ :type => MIME::Types.type_for(FILENAME).first.to_s,
                              #~ :bits => f
                              #~ })
      wp.uploadFile(:data => {
          :name => FILENAME,
          :type => MIME::Types.type_for(FILENAME).first.to_s,
          :bits => XMLRPC::Base64.new(IO.read(FILENAME))
        })
      #~ ap wp.getMediaLibrary
    end

    #~ ap configuration.base_url

    #~ ap configuration.secure_base_url
    #~ ap configuration.poster_sizes

    #~ ap movie.adult # false
    #~ ap movie.belongs_to_collection # nil
    #~ ap movie.budget # 63000000
    #~ ap movie.homepage # ""
    #~ ap movie.imdb_id # "tt0137523"
    #~ ap movie.popularity # 7.4
    #~ ap movie.production_companies # [{"name"=>"20th Century Fox", "id"=>25}, {"name"=>"Fox 2000 Pictures", "id"=> 711}, {"name"=>"Regency Enterprises", "id"=>508}]
    #~
    #~ ap movie.release_date # "1999-10-14"
    #~ ap movie.revenue # 100853753
    #~ ap movie.runtime # 139
    #~ ap movie.vote_average # 8.8
    #~ ap movie.vote_count # 234


end

#~ i = Imdb::Movie.new("0095016")
#~ i.title
#~ i.cast_members.first
i = Imdb::Search.new("Джон Уик")
ap i.movies

#~ puts Tmdb::Genre.list

#~ @search = Tmdb::Search.new
#~ @search.resource('person') # determines type of resource
#~ @search.query('samuel jackson') # the query to search against
#~ @search.fetch # makes request
#~
#~ movie = Tmdb::Movie.detail(550)
#~ ap Tmdb::Movie.latest
#~ ap Tmdb::Movie.upcoming
#~ ap Tmdb::Movie.now_playing

#~ Tmdb::Movie.trailers(22855)
#~ Tmdb::Movie.translations(22855)
#~ Tmdb::Genre.list
#~ Tmdb::Job.list
#~
#~ @movie = Tmdb::Movie.detail(params[:id])
#~ @images = Tmdb::Movie.images(params[:id])
#~ @cast = Tmdb::Movie.casts(params[:id])
#~ @trailers = Tmdb::Movie.trailers(params[:id])
#~ @similar_movies = Tmdb::Movie.similar_movies(params[:id])

 #~ 8c28a1f2
