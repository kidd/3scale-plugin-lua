Response = {}
function Response.new()
   local self = {}

   local success = false
   local error_message = ""
   local v_error_code = ""

   function self.set_to_succeeded()
      success = true
      error_message = ""
      v_error_code = nil
   end

   function self.set_to_failed(msg, code)
      v_error_code = (code or nil)
      success = false
      error_message = mgs
   end

   function self.succeeded()
      return success
   end

   function self.failed()
      return not self.succeeded()
   end

   function self.error_messages()
      return error_message
   end

   function self.error_code()
      return v_error_code
   end
   return self
end

return Response
