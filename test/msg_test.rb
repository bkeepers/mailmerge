require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require_relative '../lib/msg'

class MsgTest < Minitest::Test
  def test_replacements
    headers = %w(state bird)
    data = %w(California quail)
    template = "Fun fact!\n\nThe state bird in {{state}} is {{bird}}. We serve {{bird}} fried."
    row = CSV::Row.new(headers, data)

    msg = Msg.new(row, template)
    assert_equal "Fun fact!", msg.subject
    assert_equal "The state bird in California is quail. We serve quail fried.", msg.body
  end
end

