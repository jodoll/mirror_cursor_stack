local mock_data = {
    extend = function(any)
    end
}

local mock_data_provider = {
    init_mock = function()
        _G.data = mock_data
    end
}
return mock_data_provider