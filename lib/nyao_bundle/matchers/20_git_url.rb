NyaoBundle::Matcher::create(:git_url) do |project, opt|
  next nil unless project =~ /.+\.git$/

  opt[:getter] = :git
  opt[:name] ||= project[/.+\/(.+)\.git$/, 1]
  next project
end
