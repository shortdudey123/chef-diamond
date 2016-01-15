default['diamond']['user'] = 'diamond'
default['diamond']['group'] = 'nogroup'
default['diamond']['install_method'] = 'source' # file | package | source
default['diamond']['package_name'] = 'diamond'
default['diamond']['version'] = ''
default['diamond']['graphite_server_role'] = nil
default['diamond']['graphite_server'] = 'graphite'
default['diamond']['graphite_port'] = '2003'
default['diamond']['graphite_pickle_port'] = '2004'
default['diamond']['path_prefix'] = 'servers'
default['diamond']['hostname_method'] = 'smart'
default['diamond']['interval'] = '300'
default['diamond']['handlers'] = 'diamond.handler.graphite.GraphiteHandler, diamond.handler.archive.ArchiveHandler'
default['diamond']['source_repository'] = 'git://github.com/BrightcoveOS/Diamond.git'
default['diamond']['source_path'] = '/usr/local/share/diamond_src'
default['diamond']['source_reference'] = 'master'
default['diamond']['add_collectors'] = %w(cpu diskspace diskusage loadavg memory network vmstat tcp)
