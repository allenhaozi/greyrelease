
-- grey release index

local policyset = require "greyrelease.conf.policyset"
local transform = require "greyrelease.components.transform"
local servermap = require "greyrelease.components.servermap"
local logtools  = require "greyrelease.utils.log"
local request = require "greyrelease.components.request"


-- define the grey flow policy
local flow_policy = policyset.grey_policy_id_range 

-- define the grey flow key : request parameter, assign certain parameter 
-- request url example : http(s)://host/?uuid=xxxx&a=b&c=d
local hash_id = request.get_param( "uuid" )

local bucket = transform.get_bucket_by_id( hash_id, flow_policy )

local upstream = servermap.get_upstream_by_bucket( bucket )


-- record access log
logtools.access( flow_policy .. '#' .. hash_id .. '#' .. bucket .. '#' .. upstream )

ngx.var.backend = upstream
