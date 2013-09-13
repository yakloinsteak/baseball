module Searchable
  extend ActiveSupport::Concern

  DEFAULT_YEAR  = 1998
  DEFAULT_ORDER = 'batting_average desc'

  module ClassMethods
    define_method(:max_results) { 25 }

    def _nulls_last str
      str + ' NULLS LAST'
    end

    def associations_to_preload
      {:player => {:teams => {:division => :league}}}
    end
  end

  included do
    scope :search, lambda { |p={}|
      _year    = p.fetch(:year, DEFAULT_YEAR)
      order_by = _nulls_last(p.fetch(:order_by, DEFAULT_ORDER))

      where(year: _year).
      includes(associations_to_preload).
      order(order_by).
      limit(max_results)
    }
  end
end
