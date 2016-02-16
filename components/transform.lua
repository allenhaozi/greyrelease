-- transform 

-- get buecket id by request parameter and grey flow policy

local strings = require "resty.string"
local policyset = require "greyrelease.conf.policyset"
local init = require "greyrelease.conf.init"
local crc32 = require "greyrelease.utils.crc32"

local _M = {}


local get_bucket_by_hash = function( string_id )

    if string_id == nil then
        return nil
    end

    -- transform id : string to numeric 
    local int_crc32 = crc32.hash( string_id )
    -- intercept string : keep the init predefined max length 
    local string_sub = string.sub( int_crc32, 0, init.int_hash_max_len )
    -- fmod by hash_standard 
    local int_mod = math.fmod( string_sub, init.int_hash_standard )
   
    for k,v in pairs(init.hash_map) do 
        if v['range_start'] <= int_mod and int_mod <= v['range_end'] then
            bucket = k
            break
        end
    end
    return bucket
end

function _M.get_bucket_by_id( id, policy )

    if policy == policyset.grey_policy_id_hash then
        bucket = get_bucket_by_hash( id )
    elseif plicy == policyset.grey_policy_id_range then
        ngx.say( 'developing ... ' )
    else 
        -- default vlaue
    end

    return bucket 

end

return _M
