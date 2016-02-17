--
-- request parameter
--

local _M = {}

function _M.get_param( id )
    if "GET" == ngx.var.request_method then
        args = ngx.req.get_uri_args()
    elseif "POST" == ngx.var.request_method then
        args = ngx.req.get_post_args()
    end

    local param = args[id]

    return param
end

return _M
