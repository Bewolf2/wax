function waxBind()
  local class = waxBindClass()
  setfenv(2, class._M)
  return class
end

-- So you can create a class without screwing with the function environment
function waxBindClass()
  local className = waxbindcontext['classname']
  local instance = waxbindcontext['classaddr']

  local unbindkey = className..instance;

  local tmp = string.format("0x%x", instance)
  print("waxBind { "..className.." "..tmp.." }")

  local class = wax.bind.bind(className, instance)

  class.className = className

  class._M = setmetatable({
      self = class,
    },
    {
      __newindex = function(self, key, value)
        print('bindclass set ['..key..'=')
        print(value)
        print(']')
        class[key] = value
      end,

      __index = function(self, key)
        local vv = class[key] or _G[key]
        --print('bindclass get ['..key..'=')
        --print(vv)
        --print(']')
        return vv
      end,

    }
  )

  _G[className] = class
  wax_bind_map = wax_bind_map or {}
  local key = { unbindkey = class }
  table.append(wax_bind_map, key)

  package.loaded[className] = class

  return class
end

function waxUnbindClass()
    
    local className = waxunbindcontext['classname']
    local instance = waxunbindcontext['classaddr']
    
    local unbindkey = className..instance;
    local unbindtable = wax_bind_map or {};
    local class = unbindtable[unbindkey];
    print(unbindkey)
    if class then
        print(class)
        wax.bind.unbind(class)
        
        for i=1, #unbindtable do
            if unbindtable[i] == unbindkey then
                table.remove(t, i)
                break;
            end
        end
    end
    

end



