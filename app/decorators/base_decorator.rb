class BaseDecorator < Draper::Decorator
  FORMAT = "%.4f"

  private

  def _nil_to_na val
    val.nil? ? 'N/A' : val
  end

  def _pretty_float num
    "%.4f" % num.to_f
  end

  def _paired_cells_to_rows parts
    evens = []
    odds  = []

    parts.each_with_index do |val,idx|
      evens << val if idx.even?
      odds  << val if idx.odd?
    end

    odds.zip(evens).map { |pair| "<tr>#{pair.join}</tr>" }.join.html_safe
  end
end
