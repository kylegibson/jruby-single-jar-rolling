HERE = File.expand_path(File.dirname(__FILE__))
JRUBY_COMPLETE = "lib/jruby-complete.jar"
JRUBY = "java -Xmx500m -Xss1024k -jar #{JRUBY_COMPLETE}"


namespace :jruby do

	desc "Run JRuby help"
		task :help do
		sh %+#{JRUBY} --help+
	end

	namespace :spec do
		
		desc "Run all of the specs"
		task :run do
			specs = FileList["#{HERE}/tests/*_spec.rb"]
			sh %+#{JRUBY} -S spec -O tests/spec.opts #{specs}+
		end

	end

end



