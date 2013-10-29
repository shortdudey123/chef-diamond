include_recipe "build-essential"
include_recipe "git"

case node['platform_family']
when "debian"
  # needed to generate deb package
  package "devscripts"
  package "git"
  package "python-support"
  package "python-configobj"
  package "python-mock"
  package "cdbs"
when "redhat"
  package "python-configobj"
  package "rpm-build"
  package "git"
end

# TODO: move source directory to an attribute
git node["diamond"]["source_path"] do
  repository node["diamond"]["source_repository"]
  reference node["diamond"]["source_reference"]
  action :sync
  notifies :run, "execute[build diamond]"
end

case node['platform_family']
when "debian"
  execute "build diamond" do
    command "cd #{node["diamond"]["source_path"]};make builddeb"
    action :nothing
    notifies :run, "execute[install diamond]"
  end
  
  execute "install diamond" do 
    command "cd #{node["diamond"]["source_path"]};dpkg -i build/diamond_*_all.deb"
    action :nothing
    notifies :restart, "service[diamond]"
  end
  
else
  # TODO: test this
  execute "build diamond" do
    command "cd #{node["diamond"]["source_path"]};make buildrpm"
    action :nothing
    notifies :run, "execute[install diamond]"
  end
  
  execute "install diamond" do 
    command "cd #{node["diamond"]["source_path"]};rpm -ivh dist/*.noarch.rpm"
    action :nothing
    notifies :restart, "service[diamond]"
  end
end
