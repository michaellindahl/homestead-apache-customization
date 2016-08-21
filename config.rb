require 'yaml'

class Homestead
  def Homestead.additionalConfig(config)

    confDir = $confDir ||= File.expand_path("~/.homestead")
    homesteadYamlPath = confDir + "/Homestead.yaml"

	if File.exists? homesteadYamlPath then
        settings = YAML::load(File.read(homesteadYamlPath))
        
		config.vm.provision "shell" do |s|
			  s.inline = "rm -f /etc/apache2/sites-enabled/*"
			  s.inline = "rm -f /etc/apache2/sites-available/*"
		end

        # Configure Local Variable To Access Scripts From Remote Location
        script = File.dirname(__FILE__)+"/serve-apache.sh"
	
        settings["sites"].each do |site|
            config.vm.provision "shell" do |s|
                s.path = confDir + "/serve-apache.sh"
        		s.args = [site["map"], site["to"], site["port"] ||= "80", site["ssl"] ||= "443", site["logs"]]
      		end
        end
    end
  end
end