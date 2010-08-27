namespace :dist do
  require 'rake/clean'

  CLEAN.include('classes')
  CLEAN.include('src/Main.java')
  CLEAN.include('src/application_bootstrap.rb')
  CLEAN.include('build_dist.xml')
  CLOBBER.include('pkg')

  task :run do
    %x|java -jar pkg/NutWOW.jar|
  end

  def eval_erb src, dst, bind
    require 'erb'
    f = File.new dst, "w"
    f.write ERB.new(File.read(src)).result(bind).strip
    f.close
  end

  task :generate_main_java do
    bootstrap = "com/nutwow/nutwow/src/application_bootstrap"
    package = "com.nutwow.nutwow.src"
    eval_erb "src/Main.java.erb", "src/Main.java", binding
  end

  task :generate_application_bootstrap_rb do
    package = "com.nutwow.nutwow.src"
    eval_erb "src/application_bootstrap.rb.erb", "src/application_bootstrap.rb", binding
  end

  task :generate_build_dist_xml do
    package = "com.nutwow.nutwow.src"
    eval_erb "build_dist.xml.erb", "build_dist.xml", binding
  end

  output_directory = "classes"
  task :compile_ruby_files => [:generate_application_bootstrap_rb] do
    mkdir_p output_directory
    package = "com/nutwow/nutwow"
    sh %|#{JRUBYC} -p #{package} -t #{output_directory} src|
  end

  task :compile_main_class => [:generate_main_java] do
    mkdir_p output_directory
    sh %|javac -target 1.6 -d #{output_directory} -classpath lib/jruby-complete.jar src/Main.java|
  end

  desc "Compile all source files into class files"
  task :java_compile => [:compile_ruby_files, :compile_main_class]

  task :ant => [:generate_build_dist_xml] do
    build_cmd = "ant dist"
    if PLATFORM =~ /mswin/
      sh(build_cmd + '&') # makes windows wait until build is done
    else
      sh build_cmd 
    end
  end

  desc "Build the deliverable jar"
  task :build => [:java_compile, :ant] 
end
