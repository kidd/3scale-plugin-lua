UsageReport = {}
function UsageReport.new(data)
	 local self = {}

   function self.period_start()
   end

   function self.period_end()
   end

   function self.is_overlimit()
      current_value < max_value
   end

   for k,v in pairs({"metric", "period", "period_start", "period_end", "current_value", "max_value"}) do
      self[v] = data[v]
   end

   return self
end
return UsageReport
