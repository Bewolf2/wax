//
//  wax_bind.m
//  Lua
//
//  Created by Baiyi on 1/17/13.
//

#import "wax_bind.h"

#import "wax.h"
#import "wax_instance.h"
#import "wax_helpers.h"

#import "lua.h"
#import "lauxlib.h"

static int bind(lua_State *L);
static int unbind(lua_State *L);

static const struct luaL_Reg MetaMethods[] = {
    {NULL, NULL}
};

static const struct luaL_Reg Methods[] = {
    {"bind", bind},
    {"unbind", unbind},
    {NULL, NULL}
};

int luaopen_wax_bind(lua_State *L) {
    BEGIN_STACK_MODIFY(L);

    luaL_newmetatable(L, WAX_BIND_METATABLE_NAME);
    luaL_register(L, NULL, MetaMethods);
    luaL_register(L, WAX_BIND_METATABLE_NAME, Methods);

    // Set the metatable for the module
    luaL_getmetatable(L, WAX_BIND_METATABLE_NAME);
    lua_setmetatable(L, -2);
    
    END_STACK_MODIFY(L, 0)
    
    return 1;
}

// Creates a new ObjC class
static int bind(lua_State *L) {

    const char *className = luaL_checkstring(L, 1);
    Class klass = objc_getClass(className);
    if (klass) {
        long instance = luaL_checknumber(L, 2);
        Class iclass = (Class)instance;
        wax_instance_userdata* userdata = wax_instance_create(L, iclass, NO);
        userdata->isInstanceBind = true;
    }
    else {
        lua_pushnil(L);
    }
    return 1;
}

static int unbind(lua_State *L) {
    
    wax_instance_userdata *instanceUserdata = (wax_instance_userdata *)luaL_checkudata(L, 1, WAX_INSTANCE_METATABLE_NAME);
    
    if(instanceUserdata->isInstanceBind) {
        
        if(instanceUserdata->luaImp != nil) {
            
            [instanceUserdata->luaImp removeAllObjects];
            [instanceUserdata->luaImp release];
            instanceUserdata->luaImp = nil;
            
        }
        
    }
    
    return 0;
}

