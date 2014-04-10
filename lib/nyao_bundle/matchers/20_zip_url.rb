NyaoBundle::Matcher::create(:zip_url) do |url, opt|
  next nil unless url =~ /^https?:\/\/.+\.zip$/

  opt[:getter] = :zip_url
  opt[:name] ||= url[/.+\/(.+).zip/, 1]
  next url
end
