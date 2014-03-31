require 'pathname'

# このモジュールにメソッドを追加した場合、それがMatcherになる。
# Matcher は、xxx_yyy.rb といった名前で指定のディレクトリに定義する。
# xxx に数値、yyy に Matcher の名前を指定する。
# xxx の値が小さいほど優先して Matcher が使用される。
module GetProjects::Matcher
  class WrongMatcher < StandardError; end

  # Matcher のリスト
  All = []

  Dirs = [Pathname.new(File::expand_path('../matchers',  __FILE__))]

  class << self
    # メソッドが定義される度に Matcher として登録する。
    def method_added(name)
      matcher = instance_method(name)
      matcher_params = matcher.parameters

      # def matcher(project, opt = {})
      #   ...
      # end
      # のような形になっているべき
      unless matcher_params.size == 2 and matcher_params.first.first == :req and matcher_params.last.first == :opt
        raise WrongMatcher
      end

      All << name
    end

    def add_matchers
      files = []
      Dirs.each do |dir|
        files.concat(dir.children(false))
      end
      files.sort_by{|x|x.basename.to_i}.each do |file|
        require_relative file
      end
    end
  end
  self.add_matchers
end
