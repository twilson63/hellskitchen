node[:s3fs].each do |s3fs|
  if s3fs == "install"
    package "libcurl4-openssl-dev" do
      action :install
    end

    package "libfuse-dev" do
      action :install
    end

    package "libfuse2" do
      action :install
    end
    
    
    s3fs_tarball = "s3fs-r177-source.tar.gz"
    s3fs_tarball_src = "http://s3fs.googlecode.com/files/#{ s3fs_tarball }"

    script "install_s3fs" do
  
      interpreter "bash"
      user "root"
      cwd "/tmp"
      code <<-EOH 
      wget #{ s3fs_tarball_src } 
      tar -xzvs #{ s3fs_tarball } 
      cd ./s3fs 
      make 
      sudo make install 
      EOH
    end
  end
end
