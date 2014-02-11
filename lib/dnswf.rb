# -*- coding: utf-8 -*-
%w(command rake version).each do |lib|
  require_relative 'dns_workflow/' + lib
end
