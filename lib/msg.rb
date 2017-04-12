class Msg
  attr_reader :csv_row, :subject, :template
  def initialize(csv_row, contents)
    @csv_row = csv_row
    @subject, *lines = contents.split("\n")
    @template = lines.join("\n").strip
  end

  def email
    csv_row['email']
  end

  def body
    s = template
    csv_row.each do |key, value|
      s = s.gsub("{{%s}}" % key, value)
    end
    s
  end
end
