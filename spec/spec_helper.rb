require 'pathname'
ProjectRoot = Pathname.new(File::expand_path('../../', __FILE__))

require_relative ProjectRoot.join('lib', 'get_projects')
