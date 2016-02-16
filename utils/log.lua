-- 
-- greyrelease log module
--
-- allen.mh@alibaba-inc.com
--

local _M = {}

_M._VERSION = '1.0.0'

-- access log / debug log 
_M.access = function( msg )
    ngx.log( ngx.INFO,msg )
end


-- error log 
_M.err = function( msg )
    ngx.log( ngx.ERR, msg )
end

return _M
