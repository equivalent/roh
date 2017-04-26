require "roh/version"

class Roh
  PredicateNotChecked = Class.new(StandardError)

  attr_reader :error

  def initialize(default: {}, &block)
    @error = false
    @result = begin
      yield
    rescue Errno::ECONNREFUSED => error
      @error = error
      default # sensible default
    end
  end

  def ok?
    @ok_predicate_checked = true
    @error == false
  end

  def result
    unless @ok_predicate_checked
      raise PredicateNotChecked, '#ok? must be called prior to accessing response data'
    end

    @result
  end
end
