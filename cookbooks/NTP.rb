package "ntp" do
 
     action [:install] 
end 

template "/etc/ntp.conf" do 
     source "ntp.conf.erb" 
     variables( :ntp_server => "time.nist.gov" ) 
     notifies :restart, "service[ntpd]" 
end

service 'ntpd' do
    action [:enable,:start] 
end      
