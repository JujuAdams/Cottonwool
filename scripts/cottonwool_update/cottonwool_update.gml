/// This function must be run once every frame by a controller instance

function cottonwool_update()
{
    var _size = array_length(global.__cottonwool_structs);
    if (_size > 0)
    {
        var _i = global.__cottonwool_test_index;
        repeat(min(COTTONWOOL_ITERATION_SIZE, _size))
        {
            if (weak_ref_alive(global.__cottonwool_structs[_i]))
            {
                _i = (_i + 1) mod _size;
            }
            else
            {
                var _surface = global.__cottonwool_meta[_i].surface;
                
                if (_surface != application_surface) //Never try to free the application surface
                {
                    if (__surface_exists(_surface))
                    {
                        __surface_free(_surface);
                        if (COTTONWOOL_TEST_MODE) show_error("Cottonwool:\nLost reference to surface that still exists\n \n" + string(global.__cottonwool_meta[_i]) + "\n ", false);
                    }
                    
                    if (COTTONWOOL_VERBOSE) __cottonwool_trace("Lost reference: ", global.__cottonwool_meta[_i]);
                }
                
                array_delete(global.__cottonwool_structs, _i, 1);
                array_delete(global.__cottonwool_meta, _i, 1);
                --_size;
            }
        }
        
        global.__cottonwool_test_index = _i;
    }
}



#region Aliased Functions

#region Create, free, exists, texture, width/height getters

#macro surface_create     cottonwool_surface_create
#macro __surface_create   surface_create
function cottonwool_surface_create(_width, _height)
{
    if (COTTONWOOL_ALIAS_FUNCTIONS)
    {
        return __cottonwool_new_record(__surface_create(_width, _height));
    }
    else
    {
        return __surface_create(_width, _height);
    }
}

#macro surface_create_ext     cottonwool_surface_create_ext
#macro __surface_create_ext   surface_create_ext
function cottonwool_surface_create_ext(_name, _width, _height)
{
    if (COTTONWOOL_ALIAS_FUNCTIONS)
    {
        return __cottonwool_new_record(__surface_create_ext(_name, _width, _height));
    }
    else
    {
        return __surface_create_ext(_name, _width, _height);
    }
}

#macro surface_exists     cottonwool_surface_exists
#macro __surface_exists   surface_exists
function cottonwool_surface_exists(_surface)
{
    if (COTTONWOOL_ALIAS_FUNCTIONS && is_struct(_surface)) _surface = _surface.surface;
    return __surface_exists(_surface);
}

#macro surface_free     cottonwool_surface_free
#macro __surface_free   surface_free
function cottonwool_surface_free(_surface)
{
    if (COTTONWOOL_ALIAS_FUNCTIONS && is_struct(_surface)) _surface = _surface.surface;
    return __surface_free(_surface);
}

#macro surface_get_texture     cottonwool_surface_get_texture
#macro __surface_get_texture   surface_get_texture
function cottonwool_surface_get_texture(_surface)
{
    if (COTTONWOOL_ALIAS_FUNCTIONS && is_struct(_surface)) _surface = _surface.surface;
    return __surface_get_texture(_surface);
}

#macro surface_get_width     cottonwool_surface_get_width
#macro __surface_get_width   surface_get_width
function cottonwool_surface_get_width(_surface)
{
    if (COTTONWOOL_ALIAS_FUNCTIONS && is_struct(_surface)) _surface = _surface.surface;
    return __surface_get_width(_surface);
}

#macro surface_get_height     cottonwool_surface_get_height
#macro __surface_get_height   surface_get_height
function cottonwool_surface_get_height(_surface)
{
    if (COTTONWOOL_ALIAS_FUNCTIONS && is_struct(_surface)) _surface = _surface.surface;
    return __surface_get_height(_surface);
}

#endregion

#region Target setting/getting

#macro surface_set_target     cottonwool_surface_set_target
#macro __surface_set_target   surface_set_target
function cottonwool_surface_set_target(_surface)
{
    if (COTTONWOOL_ALIAS_FUNCTIONS && is_struct(_surface)) _surface = _surface.surface;
    return __surface_set_target(_surface);
}

#macro surface_set_target_ext     cottonwool_surface_set_target_ext
#macro __surface_set_target_ext   surface_set_target_ext
function cottonwool_surface_set_target_ext(_surface, _index)
{
    if (COTTONWOOL_ALIAS_FUNCTIONS && is_struct(_surface)) _surface = _surface.surface;
    return __surface_set_target_ext(_surface, _index);
}

#macro surface_get_target     cottonwool_surface_get_target
#macro __surface_get_target   surface_get_target
function cottonwool_surface_get_target()
{
    if (COTTONWOOL_ALIAS_FUNCTIONS)
    {
        return __cottonwool_find_surface(__surface_get_target());
    }
    else
    {
        return __surface_get_target();
    }
}

#macro surface_get_target_ext     cottonwool_surface_get_target_ext
#macro __surface_get_target_ext   surface_get_target_ext
function cottonwool_surface_get_target_ext(_index)
{
    if (COTTONWOOL_ALIAS_FUNCTIONS)
    {
        return __cottonwool_find_surface(__surface_get_target_ext(_index));
    }
    else
    {
        return __surface_get_target_ext(_index);
    }
}

#endregion

#region Miscellaneous

#macro surface_getpixel     cottonwool_surface_getpixel
#macro __surface_getpixel   surface_getpixel
function cottonwool_surface_getpixel(_surface, _x, _y)
{
    if (COTTONWOOL_ALIAS_FUNCTIONS && is_struct(_surface)) _surface = _surface.surface;
    return __surface_getpixel(_surface, _x, _y);
}

#macro surface_getpixel_ext     cottonwool_surface_getpixel_ext
#macro __surface_getpixel_ext   surface_getpixel_ext
function cottonwool_surface_getpixel_ext(_surface, _x, _y)
{
    if (COTTONWOOL_ALIAS_FUNCTIONS && is_struct(_surface)) _surface = _surface.surface;
    return __surface_getpixel_ext(_surface, _x, _y);
}

#macro surface_resize     cottonwool_surface_resize
#macro __surface_resize   surface_resize
function cottonwool_surface_resize(_surface, _width, _height)
{
    if (COTTONWOOL_ALIAS_FUNCTIONS && is_struct(_surface)) _surface = _surface.surface;
    return __surface_resize(_surface, _width, _height);
}

#macro view_set_surface_id     cottonwool_view_set_surface_id
#macro __view_set_surface_id   view_set_surface_id
function cottonwool_view_set_surface_id(_view, _surface)
{
    if (COTTONWOOL_ALIAS_FUNCTIONS)
    {
        if (COTTONWOOL_WARNING_VIEW_SURFACE) show_error("Cottonwool:\nWarning! Cottonwool cannot safely manage surfaces used with view_set_surface_id()\nPlease make sure to proactively call surface_free() on view surfaces to ensure no memory leaks occur\n(Set COTTONWOOL_WARNING_VIEW_SURFACE to <false> to hide this warning\n ", true);
        if (is_struct(_surface)) _surface = _surface.surface;
    }
    
    return __view_set_surface_id(_view, _surface);
}

#macro view_get_surface_id     cottonwool_view_get_surface_id
#macro __view_get_surface_id   view_get_surface_id
function cottonwool_view_get_surface_id(_view)
{
    if (COTTONWOOL_ALIAS_FUNCTIONS && COTTONWOOL_WARNING_VIEW_SURFACE) show_error("Cottonwool:\nWarning! Cottonwool cannot safely manage surfaces used with view_get_surface_id()\nPlease make sure to proactively call surface_free() on view surfaces to ensure no memory leaks occur\n(Set COTTONWOOL_WARNING_VIEW_SURFACE to <false> to hide this warning\n ", true);
    return __view_get_surface_id(_view);
}

#endregion

#region Copying, saving

#macro surface_copy     cottonwool_surface_copy
#macro __surface_copy   surface_copy
function cottonwool_surface_copy(_destination, _x, _y, _source)
{
    if (COTTONWOOL_ALIAS_FUNCTIONS && is_struct(_destination) && is_struct(_source))
    {
        _destination = _destination.surface;
        _source = _source.surface;
    }
    
    return __surface_copy(_destination, _x, _y, _source);
}

#macro surface_copy_part     cottonwool_surface_copy_part
#macro __surface_copy_part   surface_copy_part
function cottonwool_surface_copy_part(_destination, _x, _y, _source, _xs, _ys, _ws, _hs)
{
    if (COTTONWOOL_ALIAS_FUNCTIONS && is_struct(_destination) && is_struct(_source))
    {
        _destination = _destination.surface;
        _source = _source.surface;
    }
    
    return __surface_copy_part(_destination, _x, _y, _source, _xs, _ys, _ws, _hs);
}

#macro buffer_get_surface     cottonwool_buffer_get_surface
#macro __buffer_get_surface   buffer_get_surface
function cottonwool_buffer_get_surface(_buffer, _surface, _offset)
{
    if (COTTONWOOL_ALIAS_FUNCTIONS && is_struct(_surface)) _surface = _surface.surface;
    return __buffer_get_surface(_buffer, _surface, _offset);
}

#macro buffer_set_surface     cottonwool_buffer_set_surface
#macro __buffer_set_surface   buffer_set_surface
function cottonwool_buffer_set_surface(_buffer, _surface, _offset)
{
    if (COTTONWOOL_ALIAS_FUNCTIONS && is_struct(_surface)) _surface = _surface.surface;
    return __buffer_set_surface(_buffer, _surface.surface, _offset);
}

#macro surface_save     cottonwool_surface_save
#macro __surface_save   surface_save
function cottonwool_surface_save(_surface, _filename)
{
    if (COTTONWOOL_ALIAS_FUNCTIONS && is_struct(_surface)) _surface = _surface.surface;
    return __surface_save(_surface, _filename);
}

#macro surface_save_part     cottonwool_surface_save_part
#macro __surface_save_part   surface_save_part
function cottonwool_surface_save_part(_surface, _filename, _x, _y, _width, _height)
{
    if (COTTONWOOL_ALIAS_FUNCTIONS && is_struct(_surface)) _surface = _surface.surface;
    return __surface_save_part(_surface, _filename, _x, _y, _width, _height);
}

#macro sprite_create_from_surface     cottonwool_sprite_create_from_surface
#macro __sprite_create_from_surface   sprite_create_from_surface
function cottonwool_sprite_create_from_surface(_surface, _x, _y, _width, _height, _removeback, _smooth, _xorig, _yorig)
{
    if (COTTONWOOL_ALIAS_FUNCTIONS && is_struct(_surface)) _surface = _surface.surface;
    return __sprite_create_from_surface(_surface, _x, _y, _width, _height, _removeback, _smooth, _xorig, _yorig);
}

#macro sprite_add_from_surface     cottonwool_sprite_add_from_surface
#macro __sprite_add_from_surface   sprite_add_from_surface
function cottonwool_sprite_add_from_surface(_sprite, _surface, _x, _y, _width, _height, _removeback, _smooth)
{
    if (COTTONWOOL_ALIAS_FUNCTIONS && is_struct(_surface)) _surface = _surface.surface;
    return sprite_add_from_surface(_sprite, _surface, _x, _y, _width, _height, _removeback, _smooth);
}

#macro gif_add_surface     cottonwool_gif_add_surface
#macro __gif_add_surface   gif_add_surface
function cottonwool_gif_add_surface()
{
    var _surface = argument[1];
    if (COTTONWOOL_ALIAS_FUNCTIONS && is_struct(_surface)) _surface = _surface.surface;
    switch(argument_count)
    {
        case 3: return __gif_add_surface(argument[0], _surface, argument[2]);
        case 4: return __gif_add_surface(argument[0], _surface, argument[2], argument[3]);
        case 5: return __gif_add_surface(argument[0], _surface, argument[2], argument[3], argument[4]);
        case 6: return __gif_add_surface(argument[0], _surface, argument[2], argument[3], argument[4], argument[5]);
    }
}

#endregion

#region Drawing

#macro draw_surface     cottonwool_draw_surface
#macro __draw_surface   draw_surface
function cottonwool_draw_surface(_surface, _x, _y)
{
    if (COTTONWOOL_ALIAS_FUNCTIONS && is_struct(_surface)) _surface = _surface.surface;
    return __draw_surface(_surface, _x, _y);
}

#macro draw_surface_ext     cottonwool_draw_surface_ext
#macro __draw_surface_ext   draw_surface_ext
function cottonwool_draw_surface_ext(_surface, _x, _y, _xscale, _yscale, _angle, _blend, _alpha)
{
    if (COTTONWOOL_ALIAS_FUNCTIONS && is_struct(_surface)) _surface = _surface.surface;
    return __draw_surface_ext(_surface, _x, _y, _xscale, _yscale, _angle, _blend, _alpha);
}

#macro draw_surface_general     cottonwool_draw_surface_general
#macro __draw_surface_general   draw_surface_general
function cottonwool_draw_surface_general(_surface, _left, _top, _width, _height, _x, _y, _xscale, _yscale, _angle, _blend1, _blend2, _blend3, _blend4, _alpha)
{
    if (COTTONWOOL_ALIAS_FUNCTIONS && is_struct(_surface)) _surface = _surface.surface;
    return __draw_surface_general(_surface, _left, _top, _width, _height, _x, _y, _xscale, _yscale, _angle, _blend1, _blend2, _blend3, _blend4, _alpha);
}

#macro draw_surface_part     cottonwool_draw_surface_part
#macro __draw_surface_part   draw_surface_part
function cottonwool_draw_surface_part(_surface, _left, _top, _width, _height, _x, _y)
{
    if (COTTONWOOL_ALIAS_FUNCTIONS && is_struct(_surface)) _surface = _surface.surface;
    return __draw_surface_part(_surface, _left, _top, _width, _height, _x, _y);
}

#macro draw_surface_part_ext     cottonwool_draw_surface_part_ext
#macro __draw_surface_part_ext   draw_surface_part_ext
function cottonwool_draw_surface_part_ext(_surface, _left, _top, _width, _height, _x, _y, _xscale, _yscale, _blend, _alpha)
{
    if (COTTONWOOL_ALIAS_FUNCTIONS && is_struct(_surface)) _surface = _surface.surface;
    return __draw_surface_part_ext(_surface, _left, _top, _width, _height, _x, _y, _xscale, _yscale, _blend, _alpha);
}

#macro draw_surface_stretched     cottonwool_draw_surface_stretched
#macro __draw_surface_stretched   draw_surface_stretched
function cottonwool_draw_surface_stretched(_surface, _x, _y, _width, _height)
{
    if (COTTONWOOL_ALIAS_FUNCTIONS && is_struct(_surface)) _surface = _surface.surface;
    return __draw_surface_stretched(_surface, _x, _y, _width, _height);
}

#macro draw_surface_stretched_ext     cottonwool_draw_surface_stretched_ext
#macro __draw_surface_stretched_ext   draw_surface_stretched_ext
function cottonwool_draw_surface_stretched_ext(_surface, _x, _y, _width, _height, _blend, _alpha)
{
    if (COTTONWOOL_ALIAS_FUNCTIONS && is_struct(_surface)) _surface = _surface.surface;
    return __draw_surface_stretched_ext(_surface, _x, _y, _width, _height, _blend, _alpha);
}

#macro draw_surface_tiled     cottonwool_draw_surface_tiled
#macro __draw_surface_tiled   draw_surface_tiled
function cottonwool_draw_surface_tiled(_surface, _x, _y)
{
    if (COTTONWOOL_ALIAS_FUNCTIONS && is_struct(_surface)) _surface = _surface.surface;
    return __draw_surface_tiled(_surface, _x, _y);
}

#macro draw_surface_tiled_ext     cottonwool_draw_surface_tiled_ext
#macro __draw_surface_tiled_ext   draw_surface_tiled_ext
function cottonwool_draw_surface_tiled_ext(_surface, _x, _y, _xscale, _yscale, _blend, _alpha)
{
    if (COTTONWOOL_ALIAS_FUNCTIONS && is_struct(_surface)) _surface = _surface.surface;
    return __draw_surface_tiled_ext(_surface, _x, _y, _xscale, _yscale, _blend, _alpha);
}

#endregion

#endregion



#region Internal

global.__cottonwool_structs = [];
global.__cottonwool_meta = [];
global.__cottonwool_test_index = 0;

#macro __COTTONWOOL_VERSION   "1.0.0"
#macro __COTTONWOOL_DATE      "2020-10-05"

__cottonwool_trace("Welcome to Cottonwool by @jujuadams! This is version " + __COTTONWOOL_VERSION + ", " + __COTTONWOOL_DATE);

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

function __cottonwool_find_surface(_surface, _create_new)
{
    var _i = 0;
    repeat(array_length(global.__cottonwool_structs))
    {
        if (global.__cottonwool_structs[_i].ref.surface == _surface) return global.__cottonwool_structs[_i].ref;
        ++_i;
    }
    
    if (_create_new) return __cottonwool_new_record(_surface);
    return _surface;
}

function __cottonwool_new_record(_surface)
{
    var _struct = {surface: _surface};
    array_push(global.__cottonwool_structs, weak_ref_create(_struct));
    
    var _meta = {surface: _surface, width: surface_get_width(_surface), height: surface_get_height(_surface)};
    array_push(global.__cottonwool_meta, _meta);
    
    if (COTTONWOOL_CALLSTACK) _meta.callstack = debug_get_callstack();
    if (COTTONWOOL_VERBOSE) __cottonwool_trace("Created reference: ", _meta);
    
    return _struct;
}

#endregion