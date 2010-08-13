def require_all_files_in_path path
  Dir["#{path}/*.rb"].each{ |f| require f }  
end

require_all_files_in_path File.expand_path("../src", File.dirname(__FILE__))
