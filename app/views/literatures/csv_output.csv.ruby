require 'csv'
require "nkf"

csv_data = CSV.generate do |csv|
  csv_column_names = %w(Id Author Title Volume Page Url Published Publish Price Keyword State remarks )
  csv << csv_column_names
  @literatures.each do |literature|
    csv_column_values = [
      literature.id,
      literature.author,
      literature.title,
      literature.volume,
      literature.page,
      literature.url,
      literature.published,
      literature.publish,
      literature.price,
      literature.keyword,
      literature.state,
      literature.remarks
    ]
    csv << csv_column_values
  end
end
NKF::nkf('--sjis -Lw', csv_data)
