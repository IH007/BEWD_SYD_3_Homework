
require 'json'
require 'rest-client'
# require 'byebug'

class ProcessStoryType
  attr_accessor :story_type_select

  def get_story_type
    puts ''
    while ((@story_type_select != "new") and (@story_type_select != "hot") and (@story_type_select != "rising") and (@story_type_select != "end") )
      print 'Getting stories from Mashable & enter story_type: "new" OR "rising" OR "hot" OR "end" to End: '
      @story_type_select =  gets.strip
      @story_type_select = @story_type_select.gsub(/[^a-zA-Z0-9\-]/,"")

    end
  end

end

class ProcessStory

  attr_accessor :stories, :story_type

  def initialize
    @stories = []
  end

  # def reset_story_hash
  #   #stories.clear
  # end

  def story_data
    rest_data = RestClient.get('http://mashable.com/stories.json')
    json_data = JSON.parse(rest_data)
    #puts '%-20.20s' % json_data[@story_type]
    news = json_data[@story_type]

    news.each do |news_story|
      # puts  @story_type  , news_story['title'], news_story['channel'], news_story['link'],  'M#'
      story_hash = {:story_type => @story_type, :title => news_story['title'], :channel => news_story['channel'], :link => news_story['link'], :source => 'M#'}
      @stories << story_hash
    end
  end

  def show_all_stories
    puts "\n+++++++++++++++++++++++++++++++++++++"
    @stories.each do |story|
     #p story
     puts "Story: #{ '%-20.20s' % story[:title][0..20].gsub(/\s\w+\s*$/, '...')},   Cat: #{ '%-10.10s' % story[:channel]},  Type & Source: #{story[:source] + " & " + story[:story_type]}"
     puts "URL: #{ '%-70.70s' % story[:link]}"
     puts '------------------------------'
    end
    puts ''
  end

end


my_story_type = ProcessStoryType.new
my_story_type.get_story_type

my_story = ProcessStory.new

while my_story_type.story_type_select != 'end'

  my_story.story_type  = my_story_type.story_type_select

  my_story.story_data
  my_story.show_all_stories

  my_story_type.story_type_select = '' # resetting to get next story type
  my_story_type.get_story_type

end

