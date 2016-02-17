-- config initialize 

local _M = {}

_M.range_map = {
    bucket_1 = { range_start=0,range_end=1000 },
    bucket_2 = { range_start=1001,range_end=2000 },
    bucket_3 = { range_start=2001,range_end=3000 },
    bucket_4 = { range_start=3001,range_end=4000 },
    bucket_5 = { range_start=4001,range_end=5000 },
    bucket_6 = { range_start=5001,range_end=6000 },
    bucket_7 = { range_start=6001,range_end=7000 },
    bucket_8 = { range_start=7001,range_end=8000 },
    bucket_9 = { range_start=8001,range_end=9000 },
    bucket_10 = { range_start=9001,range_end=10000 }
}


_M.hash_map = {
    bucket_1 = { range_start=0,range_end=9 },
    bucket_2 = { range_start=10,range_end=19 },
    bucket_3 = { range_start=20,range_end=29 },
    bucket_4 = { range_start=30,range_end=39 },
    bucket_5 = { range_start=40,range_end=49 },
    bucket_6 = { range_start=50,range_end=59 },
    bucket_7 = { range_start=60,range_end=69 },
    bucket_8 = { range_start=70,range_end=79 },
    bucket_9 = { range_start=80,range_end=89 },
    bucket_10 = { range_start=90,range_end=99 }
}

_M.int_hash_standard = 100

_M.int_hash_max_len = 7 

_M.redis_key_prefix = "greyrelease_"


_M.redis_conf = {
    ["host"] = ngx.var.redis_host,
    ["port"] = ngx.var.redis_port,
    ["uds"] = ngx.var.redis_uds,
    ["pool_size"] = ngx.var.redis_pool_size,
    ["idle_time"] = ngx.var.redis_keepalive_timeout,
    ["timeout"] = ngx.var.redis_timeout,
    ["dbid"] = ngx.var.redis_dbid
}


return _M
