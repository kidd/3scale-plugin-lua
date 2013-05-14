setup(function()
         AResponse = require("threescale.authorize_response")
      end)

teardown(function()
            response = nil
         end)

describe("authorize_response inherits from response",
				function()
					 it("creates a different object",
							function()
								 r = AResponse.new()
								 r.set_to_succeeded()
								 assert.is_true(r.succeeded())
							end)
				end)
