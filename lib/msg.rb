class Msg
  attr_reader :csv_row, :subject, :body
  def initialize(csv_row, contents)
    @csv_row = csv_row
    csv_row.each do |key, value|
      contents = contents.gsub("{{%s}}" % key, value)
    end

    @subject, *lines = contents.split("\n")
    @body = lines.join("\n").strip
  end

  def email
    csv_row['email']
  end
end
