require 'rubygems'
load 'Rakefile'

INCLUDE_CHAR = "-I"

paths =
  CFLAGS.split( INCLUDE_CHAR ).collect do |path|
    if( not path.empty? )
      clean_string = path.lstrip.rstrip
      clean_string += "/*"
    end
  end.compact

system( "ctags -R --c++-kinds=+p --fields=+iaS --extra=+q #{paths.join(' ')}" )
