Response = {}
function Response.new()
	 local self = {}

	 self.success = false
	 self.error_message = ""
	 self.v_error_code = ""

	 function self:set_to_succeeded()
			self.success = true
			self.error_message = ""
			self.v_error_code = nil
	 end

	 function self:set_to_failed(msg, code)
			self.v_error_code = (code or nil)
			self.success = false
			self.error_message = mgs
	 end

	 function self:succeeded()
			return self.success
	 end

	 function self:failed()
			return not self:succeeded()
	 end

	 function self:error_messages()
			return self.error_message
	 end

	 function self:error_code()
			return self.v_error_code
	 end


	 return self
end

return Response
