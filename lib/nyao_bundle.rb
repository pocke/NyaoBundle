require_relative 'nyao_bundle/getter'
require_relative 'nyao_bundle/matcher'

module NyaoBundle
  module_function
  def get(project, opt = {})
    if opt[:getter] then
      address = project
    else
      address = nil
      Matcher.any? do |key, matcher|
        address = matcher.call(project, opt)
      end
      raise Matcher::DontMatch unless address
    end

    Getter[opt[:getter]].call(address, opt)
  end
end
