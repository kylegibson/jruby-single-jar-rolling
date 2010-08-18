include Java

path = File.expand_path("../src", File.dirname(__FILE__))
$LOAD_PATH << path

def require_all_files_in_path path
  Dir["#{path}/*.rb"].select{|f|f!="application_bootstrap.rb"}.each{|f|require f}  
end
require_all_files_in_path path 
