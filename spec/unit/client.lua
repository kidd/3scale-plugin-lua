
describe("a test", function()
						it("works", function()
									assert.is_true(true)
												end)
									 end)

setup(function()
				 TSClient = require("threescale.client")
			end)

teardown(function()
		 client = nil
			end)


describe("Threescale object",
				 function()
						it("creates an object",
							 function()
									assert.is_not_nil(TSClient.new())
							 end)
				 end)
