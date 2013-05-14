AuthorizeResponse = {}
Response = require("threescale.response")
UsageReport = require("threescale.usage_report")

function AuthorizeResponse.bless (self)
   local plan
   local app_key
   local redirect_url
   local usage_reports = {}

   function self.plan() return plan end
   function self.app_key() return app_key end
   function self.redirect_url() return redirect_url end
   function self.usage_reports() return usage_reports end

   function self.add_usage_report(opts)
      table.insert(usage_reports, UsageReport.new(opts))
   end

   return self
end

function AuthorizeResponse.new()
   return AuthorizeResponse.bless(Response.new())
end

return AuthorizeResponse
