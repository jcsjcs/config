# load libraries
require 'rubygems'
require 'wirble'             # colourise irb
require 'interactive_editor' # Open vim with the vi command. On :q the contents run within irb.
require 'looksee/shortcuts'  # Examine lookup path of objects. To use: 'lp object'. Help: 'Looksee.help'.
require 'ap'                 # AwesomePrint - call with 'ap object'. For ActiveRecord: 'ap object, :indent => -2' to left-align attributes.
                             # For ActiveRecord, 'ap ActiveRecordClass' will list the attributes and their types.
# Note: For Rails 3 apps, include the following in the Gemfile:
# For Rails Console
# group :development do
#   gem "wirble"
#   gem "awesome_print"
#   gem "looksee"
#   gem "interactive_editor"
#   #gem RUBY_VERSION.include?('1.9') ? 'ruby-debug19' : 'ruby-debug'
# end
# 

# start wirble (with color)
Wirble.init
Wirble.colorize if $stdout.tty?
IRB.conf[:AUTO_INDENT]=true

class Object
  # Return a list of methods defined locally for a particular object.  Useful
  # for seeing what it does whilst losing all the guff that's implemented
  # by its parents (eg Object).
  def local_methods(obj = self)
    (obj.methods - obj.class.superclass.instance_methods).sort
  end

  alias :x :exit             # Shortcut taken from UtilityBelt - quit by typing 'x'

end

def histx
 puts Readline::HISTORY.entries.split("x").last[0..-2].join("\n") 
end

def histexit
 puts Readline::HISTORY.entries.split("exit").last[0..-2].join("\n") 
end

def dump_history(file=nil)
   if file
     File.open(file, "w") do |f|
       f.puts IRB::ReadlineInputMethod::HISTORY.to_a
     end
   else
     puts IRB::ReadlineInputMethod::HISTORY.to_a
   end
end

# Wirble colouring - 2 themes for dark and light background terminals
module StolenFromUtilityBelt
  module Themes
    def self.background(bkg)
      case bkg
      when :dark
        Wirble::Colorize.colors = StolenFromUtilityBelt::Themes::WIRBLE_DEFAULT_THEME
      when :light
        Wirble::Colorize.colors = StolenFromUtilityBelt::Themes::THEME_FOR_WHITE_BKG
      end
    end
    WIRBLE_DEFAULT_THEME = {
      # delimiter colors
      :comma              => :blue,
      :refers             => :blue,

      # container colors (hash and array)
      :open_hash          => :green,
      :close_hash         => :green,
      :open_array         => :green,
      :close_array        => :green,

      # object colors
      :open_object        => :light_red,
      :object_class       => :white,
      :object_addr_prefix => :blue,
      :object_line_prefix => :blue,
      :close_object       => :light_red,

      # symbol colors
      :symbol             => :yellow,
      :symbol_prefix      => :yellow,

      # string colors
      :open_string        => :red,
      :string             => :cyan,
      :close_string       => :red,

      # misc colors
      :number             => :cyan,
      :keyword            => :green,
      :class              => :light_green,
      :range              => :red,
    }
    THEME_FOR_WHITE_BKG = {
      # delimiter colors
      :comma              => :purple,
      :refers             => :blue,

      # container colors (hash and array)
      :open_hash          => :red,
      :close_hash         => :red,
      :open_array         => :red,
      :close_array        => :red,

      # object colors
      :open_object        => :dark_gray,
      :object_class       => :purple,
      :object_addr_prefix => :blue,
      :object_line_prefix => :blue,
      :close_object       => :dark_gray,

      # symbol colors
      :symbol             => :black,
      :symbol_prefix      => :light_gray,

      # string colors
      :open_string        => :blue,
      :string             => :dark_gray,
      :close_string       => :blue,

      # misc colors
      :number             => :black,
      :keyword            => :brown,
      :class              => :red,
      :range              => :blue,
    }
    COLORS = WIRBLE_DEFAULT_THEME
  end
end

# default: dark background
StolenFromUtilityBelt::Themes.background(:dark) if defined? StolenFromUtilityBelt::Themes
#StolenFromUtilityBelt::Themes.background(:light) if defined? StolenFromUtilityBelt::Themes

puts '************** I R B   R E M I N D E R S  **************'
puts '*** "lp object" for lookup. "Lookup.help" for help.  ***'
puts '*** "vi" to edit with vim. :q will execute in irb.   ***'
puts '*** "ap" = Awesome Print. "ap object", "ap Class".   ***'
puts '*** "conf.echo = false/true" to control feedback.    ***'
# Load some customizations for Rails console:
load File.dirname(__FILE__) + '/.railsrc' if $0 == 'irb' && ENV['RAILS_ENV']
load File.dirname(__FILE__) + '/.railsrc' if $0 == 'script/rails' && (!Rails.env.nil? )
#load File.dirname(__FILE__) + '/.merbrc' if $0 == 'irb' && ENV['_'] && ENV['_'] == '/usr/bin/merb'
puts '********************************************************'
