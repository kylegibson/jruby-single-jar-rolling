namespace :dist do
  task :generate_main_java do
    package = "com.nutwow.nutwow.src"
    main_java = %$
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
    evaler.eval(runtime, "require '#{package.join "/"}/application_bootstrap'");
    JavaEmbedUtils.terminate(runtime);
  }
}
      $
    f = File.new "src/Main.java", "w"
    f.write main_java
    f.close
  end

  task :generate_application_bootstrap_rb do
    package = "com.nutwow.nutwow.src"
    application_bootstrap_rb = %|
include Java
$LOAD_PATH << "src"                              # running from filesystem
$LOAD_PATH << "#{package.join "/"}"              # running from jar
$LOAD_PATH << "vendor/constructor-1.0.0/lib"
$CLASSPATH << "vendor/swingx-0.9.2.jar"          # running from filesystem

require "nutwow"
nutwow = nutwow.new
nutwow.run
      |
    f = File.new "src/application_bootstrap.rb", "w"
    f.write application_bootstrap_rb
    f.close
  end

  task :generate_build_dist_xml do
    package = "com.nutwow.nutwow.src"
    build_dist_xml_rb = %|
  <target name="dist" description="Create the deliverable jar">
    <taskdef name="jarjar" 
             classname="com.tonicsystems.jarjar.JarJarTask" 
             classpath="vendor/jarjar-1.0rc7.jar"/>
    <mkdir dir="pkg"/>
    <jarjar destfile="pkg/NutWOW.jar">
      <manifest>
        <attribute name="Main-Class" value="#{package}.Main"/>
      </manifest>
      <fileset dir="classes"/>
      <zipfileset src="lib/jruby-complete-1.1.2.jar"/>
      <zipfileset src="lib/swingx-0.9.2.jar"/>
      <zipfileset dir="lib/constructor-1.0.0" prefix="vendor/constructor-1.0.0"/>
    </jarjar>
  </target>
      |
    f = File.new "build_dist.xml", "w"
    f.write build_dist_xml_rb
    f.close
  end
  
  task :build_main_class do

  end

  desc "Build the deliverable jar"
  task :build => [:clean, 'java:compile'] do
    build_cmd = "ant dist"
    if PLATFORM =~ /mswin/
      sh(build_cmd + '&') # makes windows wait until build is done
    else
      sh build_cmd 
    end
  end
end
