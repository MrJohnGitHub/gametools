function onRelive61(inid,mon)
    local nmapid = mon:GetMapId(); 
	local nMOn = mon:GetEntry();
    for k,boss_ in pairs(g_nboss) do
        if boss_[1] == nMOn and boss_[3] == nmapid then
            --g_boss_oper(k, 0, nMOn, 0);
            break;
        end
    end
end
