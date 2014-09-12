
require 'json'
require 'rest-client'
# require 'byebug'

class Processm
  attr_accessor :stories, :story_type

  def initialize (stories, story_type)
    @stories = stories
    @story_type = story_type
  end

  def reset_story_hash
    stories.clear
  end

  def story_data
    rest_data = RestClient.get('http://mashable.com/stories.json')
    json_data = JSON.parse(rest_data)
    news = json_data[story_type]
    news.each do |news_story|
      story_hash = {:story_type => story_type, :title => news_story['title'], :channel => news_story['channel'], :link => news_story['link'], :source => 'M#'}
      stories << story_hash
    end
  end

  def show_all_stories
    stories.each do |story|
     puts "Story: #{ '%-20.20s' % story[:title][0..20].gsub(/\s\w+\s*$/, '...')},   Cat: #{ '%-10.10s' % story[:channel]},  Type & Source: #{story[:source] + " & " + story[:story_type]}"
     puts "URL: #{ '%-70.70s' % story[:link]}"
     puts
    end
  end

end

class Processstorytype
  attr_accessor :story_type2
  def initialize
    @story_type2 = ''
  end
  def get_story_type
    while ((@story_type2 != "new") and (@story_type2 != "hot") and (@story_type2 != "rising") and (@story_type2 != "end") )
      puts 'Getting stories from Mashable & enter story_type: "new" OR "rising" OR "hot" OR "end" to End'
      @story_type2 = gets
      @story_type2 = @story_type2.gsub(/[^a-zA-Z0-9\-]/,"")
    end
  end
end

my_stories = []
my_story_type = ''

new_story_type = Processstorytype.new
new_story_type.get_story_type
my_story_type = new_story_type.story_type2

#puts my_story_type, 'fff'
#if my_story_type != 'end' # canmot get this to work
  current_story = Processm.new(my_stories, my_story_type)
  current_story.story_data
  current_story.show_all_stories
#end if

exit