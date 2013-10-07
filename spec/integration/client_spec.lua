describe("a test", function()
            it("works", function()
                  assert.is_true(true)
                        end)
                   end)

setup(function()
         TSClient = require("threescale.client")
         Config = dofile('credentials.txt')
         assert.is_not_nil(TSClient)
      end)

teardown(function()
            client = nil
         end)

describe("authrep", function()
            it("creates", function()
                  c = TSClient.new(Config.provider_key)
                  res = c.authrep{user_key = Config.user_key}
                  assert.is_true(res.succeeded())
                  assert.are.equal('', res.error_messages())
                  assert.is_false(res.failed())
                          end)
                    end)
