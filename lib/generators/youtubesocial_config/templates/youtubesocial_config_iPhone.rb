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
  
  def setPriority
     
     posicao = 0 
     cursor = Youtubesocial.getAll[posicao]
      
      while cursor != nil # enquanto houver registros
         
        if !cursor.search_term.eql?("")
          cursor.priority = 1
          cursor.save
        elsif !cursor.account_name.eql?("")
          cursor.priority = 2
          cursor.save
        elsif !cursor.category.eql?("nill")
          cursor.priority = 3
          cursor.save
        else 
          cursor.priority = 4
          cursor.save
        end
       
        posicao += 1 # posicao++
        cursor = Youtubesocial.getAll[posicao]
  end
end

  def getUrl 
      
      setPriority()
      
     if (params[:area_id].nil?)
       youtube = Youtubesocial.getAll
     else
       youtube = Youtubesocial.getYoutube(params[:area_id].to_i)
     end
     
     posicao = 0 
     cursor = Youtubesocial.getAll[posicao]
     
     while cursor != nil # enquanto houver registros
       
       case cursor.priority.to_i #cada prioridade implica uma url...
      
          when 1
           cursor.url = "http://gdata.youtube.com/feeds/api/videos?q=" + cursor.search_term.gsub('+',"%2B").gsub(/ /,"+") + "&start-index=1&max-results=10&v=2&format=5"
           cursor.save #atualiza o campo o url
           
          when 2
            cursor.url = "http://gdata.youtube.com/feeds/api/videos?v=2&author=" + cursor.account_name.gsub('+',"%2B").gsub(/ /,"+") + "&format=5"
            cursor.save 
              
          when 3
            cursor.url = "http://gdata.youtube.com/feeds/api/videos/-/" + cursor.category.to_s + "?v=2&format=5"
            cursor.save
            
          when 4
            cursor.url = "http://gdata.youtube.com/feeds/api/standardfeeds/" + cursor.feed_id.to_s  + "?v=2&format=5"
            cursor.save
            
        end
    posicao += 1 # posicao++
    cursor = Youtubesocial.getAll[posicao]
  end
      render :text => youtube.entries.to_json #imrpime os campos, agora com url definido
  end

end
