--[[--
  A test module that shows how modules can be used
  with Tsundere
]]

local test = {}

--[[--
 List down visible repos by a user on github
 Uses bot the json and http libs
 @param user The user whose repo list is desired
 @return nil
]]
function test.get_repos(user)
    -- Basic validation
    if not user then print("Username required") os.exit(1) end
    -- Load libs locally 
    local http = require "lib.http"
    local json = require "lib.json"
    -- use the github api to get the repos
    local endpoint = "https://api.github.com/users/" .. user .. "/repos"
    print ("Will be hitting the following endpoint: ")
    print (endpoint)
    -- Get the Data
    local res = http.get_url(endpoint)
    -- Format the output
    local res_t = json.decode(res)
    for i, v in ipairs(res_t) do
        -- can even add some filtering logic here
        print(i .. ") " .. v.name .. ": " .. v.url)
    end
  
end

return test
