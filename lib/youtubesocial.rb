require "rubygems"
require "youtubesocial/model1"
module Youtubesocial
  class << self

       def getYoutube(area)
           if(area.is_a? Numeric)
             return Youtubesocial::Model::YoutubeModel.where(area_id: area)
           else
             return nil
           end
         end


       def getAll
         return Youtubesocial::Model::YoutubeModel.all.entries
       end

   end
end
