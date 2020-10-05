function cottonwool_update()
{
    var _i = array_length(global.__cottonwool_structs);
    repeat(_i)
    {
        --_i;
        
        if (!weak_ref_alive(global.__cottonwool_structs[_i]))
        {
            var _surface = global.__cottonwool_meta[_i].surface;
            if (__surface_exists(_surface)) __surface_free(_surface);
            
            if (COTTONWOOL_VERBOSE) __cottonwool_trace("Lost reference ", global.__cottonwool_meta[_i]);
            
            array_delete(global.__cottonwool_structs, _i, 1);
            array_delete(global.__cottonwool_meta, _i, 1);
        }
    }
}

function __cottonwool_trace()
{
    var _string = "Cottonwool: ";
    
    var _i = 0;
    repeat(argument_count)
    {
        _string += string(argument[_i]);
        ++_i;
    }
    
    show_debug_message(_string);
}

function cottonwool_surface_create(_width, _height)
{
    var _surface = __surface_create(_width, _height);
    
    var _struct = {surface: _surface};
    array_push(global.__cottonwool_structs, weak_ref_create(_struct));
    
    var _meta = {surface: _surface, width: _width, height: _height};
    array_push(global.__cottonwool_meta, _meta);
    
    if (COTTONWOOL_CALLSTACK) _meta.callstack = debug_get_callstack()
    if (COTTONWOOL_VERBOSE) __cottonwool_trace("Created reference ", _meta);
    
    return _struct;
}

function cottonwool_surface_exists(_struct)
{
    return __surface_exists(_struct.surface);
}

function cottonwool_surface_free(_struct)
{
    return __surface_free(_struct.surface);
}

function cottonwool_surface_set_target(_struct)
{
    return __surface_set_target(_struct.surface);
}

function cottonwool_surface_reset_target()
{
    return __surface_reset_target();
}

function cottonwool_draw_surface(_struct, _x, _y)
{
    return __draw_surface(_struct.surface, _x, _y);
}

global.__cottonwool_structs = [];
global.__cottonwool_meta = [];

#macro surface_create       cottonwool_surface_create
#macro surface_exists       cottonwool_surface_exists
#macro surface_free         cottonwool_surface_free
#macro surface_set_target   cottonwool_surface_set_target
#macro surface_reset_target cottonwool_surface_reset_target
#macro draw_surface         cottonwool_draw_surface

#macro __surface_create       surface_create
#macro __surface_exists       surface_exists
#macro __surface_free         surface_free
#macro __surface_set_target   surface_set_target
#macro __surface_reset_target surface_reset_target
#macro __draw_surface         draw_surface

#macro COTTONWOOL_VERSION ""
#macro COTTONWOOL_DATE    ""