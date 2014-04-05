NyaoBundle::Matcher::create(:github) do |project, opt|
  next nil unless (user, repo = project.split('/')).size == 2
  user_rxp = /^[[:alnum:]]([[:alnum:]]|-)*$/
  repo_rxp = /^([[:alnum:]]|\.|-|_)+$/

  if user =~ user_rxp and repo =~ repo_rxp and repo != '.' and repo != '..' then
    opt[:name] ||= repo
    opt[:getter] = :git
    next "https://github.com/#{project}.git"
  else
    next nil
  end
end
