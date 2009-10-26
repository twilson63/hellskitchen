node[:xsendfile].each do |xsendfile|
  if xsendfile == "install"
    package "apache2-threaded-dev" do
      action :install
    end

    script "install_sendfile" do
      interpreter "bash"
      user "root"
      cwd "/tmp"
      code <<-EOH 
      wget http://tn123.ath.cx/mod_xsendfile/mod_xsendfile-0.9.tar.gz
      tar -zxvf mod_xsendfile-0.9.tar.gz
      cd mod_xsendfile-0.9
      apxs2 mod_xsendfile.c
  
      EOH
    end


    template "/etc/apache2/mods-available/xsendfile.load" do
      source "xsendfile.load.erb"
    end

    execute "a2enmod" do
      command "a2enmod xsendfile"
    end
  end
end