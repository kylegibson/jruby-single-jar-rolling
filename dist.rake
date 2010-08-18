namespace :dist do
  task :generate_main_java do
    package = "com.nutwow.nutwow.src"
    path = "src/Main.java"
    main_java = %|
package #{package};
import org.jruby.Ruby;
import org.jruby.RubyRuntimeAdapter;
import org.jruby.javasupport.JavaEmbedUtils;  
import java.util.ArrayList;
// This technique for starting JRuby is taken from
// http://wiki.jruby.org/wiki/Direct_JRuby_Embedding
public class Main {
  public static void main(String[] args) {
    Ruby runtime = JavaEmbedUtils.initialize(new ArrayList());
    RubyRuntimeAdapter evaler = JavaEmbedUtils.newRuntimeAdapter();
    evaler.eval(runtime, "require '#{package.gsub(".","/")}/application_bootstrap'");
    JavaEmbedUtils.terminate(runtime);
  }
}
      |
    f = File.new path, "w"
    f.write main_java.strip
    f.close
  end

  task :generate_application_bootstrap_rb do
    package = "com.nutwow.nutwow.src"
    path = "src/application_bootstrap.rb"
    application_bootstrap_rb = %|
include Java
$LOAD_PATH << "src"                      # running from filesystem
$LOAD_PATH << "#{package.gsub(".","/")}" # running from jar
require "nutwow"
app = NutWOW.new
app.run
      |
    f = File.new path, "w"
    f.write application_bootstrap_rb.strip
    f.close
  end

  task :generate_build_dist_xml do
    package = "com.nutwow.nutwow.src"
    path = "build_dist.xml"
    build_dist_xml_rb = %|
  <target name="dist" description="Create the deliverable jar">
    <taskdef name="jarjar" 
             classname="com.tonicsystems.jarjar.JarJarTask" 
             classpath="lib/jarjar.jar"/>
    <mkdir dir="pkg"/>
    <jarjar destfile="pkg/NutWOW.jar">
      <manifest>
        <attribute name="Main-Class" value="#{package}.Main"/>
      </manifest>
      <fileset dir="classes"/>
      <zipfileset src="lib/jruby-complete.jar"/>
    </jarjar>
  </target>
      |
    f = File.new path, "w"
    f.write build_dist_xml_rb.strip
    f.close
  end

  task :compile_ruby_files do

  end

  task :compile_main_class => [:generate_main_java] do
    
  end

  desc "Build the deliverable jar"
  task :build => [:generate_main_java, 
    :generate_build_dist_xml, 
    :generate_build_dist_xml] do

    build_cmd = "ant dist"
    if PLATFORM =~ /mswin/
      sh(build_cmd + '&') # makes windows wait until build is done
    else
      sh build_cmd 
    end
  end
end
