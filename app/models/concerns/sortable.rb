module Sortable
  extend ActiveSupport::Concern

  MAX_RESULTS   = 25
  DEFAULT_YEAR  = 1998
  DEFAULT_ORDER = 'batting_average DESC NULLS LAST'

  included do
    scope :search, lambda { |p|
      where(year: p.fetch(:year, DEFAULT_YEAR)).
      includes(:player).
      order(p.fetch(:order_by, DEFAULT_ORDER)).
      limit(MAX_RESULTS)
    }
  end
end
