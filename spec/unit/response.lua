setup(function()
				 Response = require("threescale.response")
			end)

teardown(function()
		 response = nil
			end)

describe("Response object",
				 function()
						it("creates the object",
							 function()
									assert.is_not_nil(Response.new(j))
							 end)

						it("can be set to succeed",
							 function()
									local res = Response.new()
									res:set_to_succeeded()
									assert.is_true(res:succeeded())
									assert.is_true(res:error_messages() == "")
									end)

						it("can be set to failed",
							 function()
									local res = Response.new()
									res:set_to_failed("msg", 409)
									assert.is_false(res:succeeded())
									assert.is_false(res:error_messages() == "")
									assert.is_true(res:error_code() == 409)
									end)
				end)
