# -*- coding: utf-8 -*-
%w(command dns vagrant config version).each do |lib|
  require_relative 'dns_workflow/' + lib
end
