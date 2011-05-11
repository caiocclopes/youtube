module Youtubesocial
  module Model
    
    class YoutubeModel
      include Mongoid::Document
      
      field :search_term
      field :account_name
      field :url
      field :category # Sports, Comedy, Travel....
      field :feed_id  #most_viewed, top_rated, most_recent.....
      field :priority, type: Integer
      field :area_id, type: Integer
      validates_uniqueness_of :area_id, :message => "area id ja existente"
      validates_presence_of :area_id, :message => "nao pode ser nulo"
    end
  
  end
end

#categories = [["All","all"], ["Autos & vehicles","autos&vehicles"],["Comedy","comedy"],["Education","education"],["Entertainment","entertainment"],["Film & Animation","film&animation"],["Gaming","gaming"],["Howto & Style","howto&style"],["Music","music"],["News & Politics","news&politics"],["Nonprofits & Activism","nonprofits&activism"],["People & Blogs","people&blogs"],["Pets & Animals","pets&animals"], ["Science & Technology","science&technology"],["Sports","sports"],["Travel & Events","travel&events"] ]
  #feeds = [["Top Rated","top_rated"],["Most Viewed" "most_viewed"],["Top Favorites", "top_favorites"],["Most Popular","most_popular"], ["Most Recent","most_recent"],["Most Discussed","most_discussed"],["Most Responded""most_responded"],["Recently Featured","recently_featured"]]