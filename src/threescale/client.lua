-- http://lua-users.org/wiki/ObjectOrientationClosureApproach
http = require("socket.http")
inspect = require("inspect")

require("LuaXml") -- from kidd/LuaXML
-- utils = require("utils")				--
TSClient = {}

function table.delete(table, key)
    local element = table[key]
    table[key] = nil
    return element
end

function TSClient.new(provider_key)
   local self = {}

	 local scheme = "https://"
   local host = "su1.3scale.net"
	 local provider_key = provider_key

   function self.authorize(app_id, app_key)
			path = '/transactions/authorize.xml'
			req_path = {scheme , path , path, "?provider_key=",
									provider_key, "&app_id=", app_id}

			if app_key then
				 table.insert(reqpath, "&app_key=")
				 table.insert(req_path, app_key)
			end
			response = http.request(table.concat(req_path, ""))
			return response.body
   end

   function self.report(t)
			return t
   end

   function self.authrep(t)
			path = "/transactions/authrep.xml?provider_key=".. provider_key

      options_usage = table.delete(t, 'usage')
      options_log   = table.delete(t, 'log')

			for k,v in pairs(t) do
				 path = path .. "&" .. k .. "=" .. v
			end

			if not options_usage then
				 options_usage = {hits=1}
			end

      usage = {}
			for metric,value in pairs(options_usage) do
				 table.insert(usage, string.format("[usage][%s]=%d", metric, value))
			end

			path = path .. "&".. table.concat(usage, "&")

      if options_log then
				 log = {}
				 for metric,value in pairs(options_log) do
						table.insert(log, string.format("[log][%s]=%d", metric, value))
				 end
				 path = path .. table.concat(usage, "&")
      end
			body, status, h = http.request(scheme .. host .. path)

			if status == 200 then
				 build_authorize_response(body)
			else
				 build_error_response(body)
			end
      -- case http_response
      -- when Net::HTTPSuccess,Net::HTTPConflict
			-- build_authorize_response(http_response.body)
      -- when Net::HTTPClientError

      -- else
			-- 	 raise ServerError.new(http_response)
    	 -- end
			return body

	 end

	 function dump(o)
			if type(o) == 'table' then
				 local s = '{ '
				 for k,v in pairs(o) do
						if type(k) ~= 'number' then k = '"'..k..'"' end
						s = s .. '['..k..'] = ' .. dump(v) .. ','
				 end
				 return s .. '} '
			else
				 return tostring(o)
			end
	 end

	 function build_authorize_response(xml_str)
			local xml_info = xml.eval(xml_str)
			local response = AuthorizeResponse.new()
			print(dump(xml_info))

			print("\n")
			print("\n")
			print(xml_info:find("authorized")[1])
			if  xml_info:find("authorized")[1] then
				 response.success!
			end
	 end

   return self
end

return TSClient
-- Application:
-- local m1 = TSClient.new ()
-- local m2 = TSClient.new ()
-- m1:sethp (100)
-- m1:heal (13)
-- m2:sethp (90)
-- m2:heal (5)
-- print ("TSClient 1 has got "..m1.hp.." hit points")
-- print ("TSClient 2 has got "..m2.hp.." hit points")
