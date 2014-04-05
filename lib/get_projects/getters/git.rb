NyaoBundle::Getter::create(:git) do |url, opt|
  if Dir::exist?(opt[:name]) then
    Dir::chdir(opt[:name]) do
      system('git', 'pull', '--rebase')
    end
  else
    system('git', 'clone', url, opt[:name])
  end

  Dir::chdir(opt[:name]) do
    system('git', 'submodule', 'update', '--init', '--recursive')
  end
end
