//
//  wax_class.h
//  Lua
//
//  Created by ProbablyInteractive on 5/20/09.
//  Copyright 2009 Probably Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>

#import "lua.h"

#define WAX_BIND_METATABLE_NAME "wax.bind"

int luaopen_wax_bind(lua_State *L);
