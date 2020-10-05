/// Returns the *approximate* amount of texture memory (in bytes) allocated to surfaces being tracked by Cottonwool

function cottonwool_get_memory()
{
    var _memory = 0;
    
    var _i = 0;
    repeat(array_length(global.__cottonwool_structs))
    {
        if (weak_ref_alive(global.__cottonwool_structs[_i]))
        {
            var _surface = global.__cottonwool_meta[_i].surface;
            if (surface_exists(_surface)) _memory += __surface_get_width(_surface)*__surface_get_height(_surface);
        }
        
        ++_i;
    }
    
    if (surface_get_depth_disable()) return 4*_memory;
    return 8*_memory;
}