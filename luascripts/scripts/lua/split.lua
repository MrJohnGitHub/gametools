function lua_string_split(str, split_char)      
	 local sub_str_tab = {};  
	 while (true) do          
	 local pos = string.find(str,split_char);    
	 if (not pos) then              
	  local size_t = table.getn(sub_str_tab)  
	  table.insert(sub_str_tab,size_t+1,str);  
	  break;    
	 end  
	   
	 local sub_str = string.sub(str, 1, pos - 1);                
	 local size_t = table.getn(sub_str_tab)  
	 table.insert(sub_str_tab,size_t+1,sub_str);  
	 local t = string.len(str);  
	 str = string.sub(str, pos + 1, t);     
	 end      
	 return sub_str_tab;  
end 
