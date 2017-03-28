apache_tomcat node['apache_tomcat']['home'] do

              mirror node['apache_tomcat']['mirror']
              version node['apache_tomcat']['version']

end

group node['apache_tomcat']['group'] do
              system true
              only_if { node['apache_tomcat']['create_service_user'] }

end

user node['apache_tomcat']['user'] do
  comment 'Tomcat Service User'
  system true
  group node['apache_tomcat']['group']
  shell '/bin/false'
  only_if { node['apache_tomcat']['create_service_user'] }

end


apache_tomcat_instance 'base' do
  %w(base shutdown_port http_port ajp_port ssl_port jmx_port debug_port).each do |a|
    send(a, node['apache_tomcat'][a]) unless node['apache_tomcat'][a].nil?
  end
  only_if { node['apache_tomcat']['run_base_instance'] }
end
