module Searchable
  extend ActiveSupport::Concern

  MAX_RESULTS   = 25
  DEFAULT_YEAR  = 1998
  DEFAULT_ORDER = 'batting_average desc'

  module ClassMethods
    def _nulls_last str
      str + ' NULLS LAST'
    end

    def associations_to_preload
      {:player => {:teams => {:division => :league}}}
    end
  end

  included do
    #TDB
    scope :search, lambda { |p|
      _year = p.fetch(:year, DEFAULT_YEAR)
      order_by = _nulls_last(p.fetch(:order_by, DEFAULT_ORDER))

      where(year: _year). #p.fetch(:year, DEFAULT_YEAR)).
      includes(associations_to_preload).
      #order(_nulls_last p.fetch(:order_by, DEFAULT_ORDER)).
      order(order_by).
      limit(MAX_RESULTS)
    }
  end
end
