module KubeSecrets
  module_function

  def self.load
    if dirs_location
      dirs_location.each do |path|
        dir(path).each do |file|
          Dotenv.load(file)
        end
      end
    end
  end

  def dir(dir_location)
    File.directory?(dir_location) ? Dir["#{dir_location}/*"] : []
  end

  def dirs_location
    ["/tmp/secrets", "/tmp/config"]
  end
end
