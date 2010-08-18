load "dist.rake"

HERE = File.expand_path(File.dirname(__FILE__))
JRUBY = "scripts/jruby"

task :default => ["jruby:spec:run"]

namespace :nutwow do
  desc "Run nutwow"
  task :run => ['dist:generate_application_bootstrap_rb'] do
    sh %|#{JRUBY} src/application_bootstrap.rb|
  end
end

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

