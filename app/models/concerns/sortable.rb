module Sortable
  extend ActiveSupport::Concern

  MAX_RESULTS   = 25
  DEFAULT_YEAR  = 1998
  DEFAULT_ORDER = 'batting_average desc'

  module ClassMethods
    def _nulls_last str
      str + ' NULLS LAST'
    end
  end

  included do
    #TDB
    scope :search, lambda { |p|
      where(year: p.fetch(:year, DEFAULT_YEAR)).
      includes(:player => {:teams => {:division => :league}}).
      order(_nulls_last p.fetch(:order_by, DEFAULT_ORDER)).
      limit(MAX_RESULTS)
    }
  end
end
