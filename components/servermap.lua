-- server map 
-- get upstream by bucket_id

local init = require "greyrelease.conf.init"
local redis = require "greyrelease.model.redis"
local log = require "greyrelease.utils.log"

local _M = {}

local get_data_from_redis = function( bucket )

    local data

    if bucket == nil then
        return data
    end

    local key = init.redis_key_prefix .. bucket

    local database
    database = redis:new(init.redis_conf)

    local ok,err = database:connectdb()

    if not ok then
        log.err("connect redis error")
        return data
    end

    local data = database.redis:get( key ) 
   
    local ok,err = database:keepalivedb()

    if not ok then
        log.err("setkeepalivedb error")
    end

    if type( data ) == "userdata" then
        data = nil
    end
    
    return data
    
end


function _M.get_upstream_by_bucket( bucket )
    local upstream = ""
    upstream = get_data_from_redis( bucket )
    -- if the result of hash is nil, set default value
    if upstream == nil then
        upstream = ngx.var.default_backend
    end
    
    return upstream
end

return _M
