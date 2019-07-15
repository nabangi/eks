require 'sinatra'
require 'mongo'
require 'logger'

configure do
  set :bind, '0.0.0.0'
  set :server, :puma
  set :logger, $logger
  $logger = Logger.new(STDOUT)
  $logger.level = Logger::DEBUG
end

Mongo::Logger.logger = Logger.new(STDOUT)
Mongo::Logger.logger.level = Logger::DEBUG

get "/" do
  otherMes = "The frontend page is working"
	erb :show, :locals => {otherMessage: otherMes}
end

get "/database" do
	theMes = "database page"
	otherMes = []
  mongHost = ENV["mongo_service_host"] || "mongo_service_host"
  mongPort = ENV["mongo_service_port"] || "mongo_service_port"
  begin
    mongClient = Mongo::Client.new([mongHost + ":" + mongPort], :database => "theQuotes", :server_selection_timeout => 2)
    mongClient[:theColl].find.each { |rec| otherMes << rec }
    mongClient.close
    erb :dataBase, :locals => {otherMessage: otherMes}
  rescue Mongo::Error => er
    $logger.error "Unable to fetch environment variables mongo_service_host and mongo_service_port"
    otherMes = "Database unavailable...<br />" + er.message
    erb :error, :locals => {otherMessage: otherMes}
  rescue SocketError => err
    otherMes = "Cannot load the database..socket error....<br />" + err.message
    erb :error, :locals => {otherMessage: otherMes}
  end

end
