class HomeController < ApplicationController
    def index
      @models = ActiveRecord::Base.subclasses.collect { |type| type.name }.sort
    end
end
