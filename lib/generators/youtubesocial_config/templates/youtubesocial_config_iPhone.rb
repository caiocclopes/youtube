class YoutubesocialController < ApplicationController

  def getYoutube
    if (params[:area_id].nil?)
      youtube = Youtubesocial.getAll
    else
      youtube = Youtubesocial.getYoutube(params[:area_id].to_i)
    end

    if (youtube.nil? || youtube.empty?)
      render :text => {:success => false}.to_json
    else
      render :text => youtube.entries.to_json
    end
  end

  def create 
    youtubesocial_config = YoutubeModel.new
    youtubesocial_config.account_name = params[:account_name]
    youtubesocial_config.search_term = params[:search_term]
    youtubesocial_config.priority = params[:priority].to_i
    youtubesocial_config.area_id = params[:area_id].to_i
    youtubesocial_config.category = params[:category]
    youtubesocial_config.feed_id = params[:standard_id]
    youtubesocial_config.url = params[" "]

    if youtube_config.save
      render :text => {:success => true}.to_json
    else
      render :text => {:success => false}.to_json
    end
  end
  
  
  def getUrl 
   
     
     posicao = 0 
     cursor = Youtubesocial.getAll[posicao]
     
     while cursor != nil # enquanto houver registros
       
       case cursor.priority.to_i #cada prioridade implica uma url...
      
          when 1
           cursor.url = "http://gdata.youtube.com/feeds/api/videos?q=" + cursor.search_term.to_s + "&start-index=1&max-results=10&v=2&alt=json"
           cursor.save #atualiza o campo o url
           
          when 2
            cursor.url = "http://gdata.youtube.com/feeds/api/users/" + cursor.account_name.to_s+ "/playlists?v=2&alt=json"
            cursor.save 
              
          when 3
            cursor.url = "http://gdata.youtube.com/feeds/api/videos/-/" + cursor.category.to_s + "?v=2&alt=json"
            cursor.save
            
          when 4
            cursor.url = "http://gdata.youtube.com/feeds/api/standardfeeds/" + cursor.feed_id.to_s  + "?v=2&alt=json"
            cursor.save
            
        end
    posicao += 1 # posicao++
    cursor = Youtubesocial.getAll[posicao]
  end
      youtube = Youtubesocial.getAll 
      render :text => youtube.entries.to_json #imrpime os campos, agora com url definido
  end

end
