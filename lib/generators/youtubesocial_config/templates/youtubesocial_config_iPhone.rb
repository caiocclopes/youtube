class YoutubesocialController < ApplicationController

  def getYoutube
    if (params[:area_id].nil?)
      youtube = Youtube.getAll
    else
      youtube = Youtube.getYoutube(params[:area_id].to_i)
    end

    if (youtube.nil? || youtube.empty?)
      render :text => {:success => false}.to_json
    else
      render :text => youtube.entries.to_json
    end
  end

  def create #############################ver!!###
    youtubesocial_config = YoutubeModel.new
    youtubesocial_config.account_name = params[:account_name]
    youtubesocial_config.search_term = params[:search_term]
    youtubesocial_config.priority = params[:priority].to_i
    youtubesocial_config.area_id = params[:area_id].to_i
    youtubesocial_config.category = params[:category]
    youtubesocial_config.feed_id = params[:standard_id]

    if youtube_config.save
      render :text => {:success => true}.to_json
    else
      render :text => {:success => false}.to_json
    end
  end

end
