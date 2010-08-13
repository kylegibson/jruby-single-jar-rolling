HERE = File.expand_path(File.dirname(__FILE__))
JRUBY = "scripts/jruby"

namespace :jruby do

	desc "Run JRuby help"
		task :help do
		sh %+#{JRUBY} --help+
	end

	namespace :spec do
		
		desc "Run all of the specs"
		task :run do
			specs = FileList["#{HERE}/tests/*_spec.rb"]
			sh %+#{JRUBY} -S spec -f specdoc #{specs}+
		end

	end

end



