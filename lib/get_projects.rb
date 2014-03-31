require_relative 'get_projects/getter'
require_relative 'get_projects/matcher'

module GetProjects
  class << self
    def get(project, opt = {})
      address = nil
      Matcher.any? do |matcher|
        address = matcher.call(project, opt)
      end
      raise Matcher::DontMatch unless address

      Getter[opt[:getter]].call(address, opt)
    end
  end
end
