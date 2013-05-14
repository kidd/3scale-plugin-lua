AuthorizeResponse = {}

function AuthorizeResponse.bless (self)
   local plan
   local app_key
   local redirect_url
   local usage_reports = {}

   function plan() return plan end
   function app_key() return app_key end
   function redirect_url() return redirect_url end
   function usage_reports() return usage_reports end

   function add_usage_report(opts)
      table.insert(usage_reports, UsageReport.new(opts))
   end

   return self
end

function AuthorizeResponse.new()
   return AuthorizeResponse.bless(Response.new())
end
return AuthorizeResponse
