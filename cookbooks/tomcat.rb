package 'tomcat' do
   action :install
end

package 'tomcat-webapps' do
   action :install
end

package 'tomcat-admin-webapps' do
   action :install
end 

service 'start'
 action [:start, :enable]
only_if do file.exit ('/usr/share/tomcat/webapps/ROOT/index.jsp')
end

service 'tomcat' do
  action [:stop]
end





