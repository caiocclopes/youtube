# Use this generator like this:
# rails g youtubesocial_config

class YoutubesocialConfigGenerator < Rails::Generators::Base

  def self.source_root
    @source_root ||= File.join(File.dirname(__FILE__), 'templates')
  end

  def generate_scaffold
    generate("scaffold", "youtubesocial_config account_name:string search_term:string area_id:integer category:string feed_id:string")
    remove_file "./app/models/youtubesocial_config.rb"
    template "youtubesocial_config_model.rb", "./app/models/youtubesocial_config.rb"
    template "youtubesocial_config_iPhone.rb", "./app/controllers/youtubesocial_controller.rb"
    template "youtubesocial_config_form.html.erb", "./app/views/youtubesocial_configs/_form.html.erb"
  end

end