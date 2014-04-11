require 'fileutils'
require 'open-uri'

NyaoBundle::Getter::create(:zip_url) do |url, opt|
  name ||= File::basename(url)

  if Dir::exist?(opt[:name]) then
    FileUtils::rm_rf(opt[:name], secure: true)
  end

  Kernel::open(name, 'wb') do |file|
    Kernel::open(url) do |data|
      file.write(data.read)
    end
  end
end
