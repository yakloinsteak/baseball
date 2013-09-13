require 'spec_helper'

describe StatsController do
  specify { expect(:get => '/stats').to route_to(:controller => 'stats', :action => 'index') }
  specify { expect(:get => '/stats.html?a=3').to route_to(:action => 'index', :controller => 'stats', format: 'html', a: '3') }
end
