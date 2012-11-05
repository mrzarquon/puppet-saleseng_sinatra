require 'rubygems'
require 'sinatra'
require 'puppet'
require 'puppet/face'

$LOAD_PATH.unshift('/Users/chris/.puppet/modules/stack_builder/lib')
$LOAD_PATH.unshift('/Users/chris/.puppet/modules/cloud_provisioner/lib')
build_args = { 
  'name' => 'cbarker',
  'config' => '/Users/chris/saleseng.yaml',
} 


get '/' do
  'Welcome to Stack Builder, HTML 2 edition'
  erb :indexbody
end

get '/build' do
  'Building Stack'
  Puppet::Face[:stack, :current].build(build_args)
end

get '/destroy' do
  'Destroying Stack'
  Puppet::Face[:stack, :current].destroy(build_args)
end




__END__

@@ indexbody
<a href="/build">Build</a><br>
<a href="/destroy">Destroy<a><br>


