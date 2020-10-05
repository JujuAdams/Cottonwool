/// Returns an array that contains structs for all surfaces being tracked by Cottonwool
///
/// @param inclusive   Whether to include surfaces that are referenced but no longer exist

function cottonwool_get_array(_inclusive)
{
    var _array = [];
    
    var _i = 0;
    repeat(array_length(global.__cottonwool_structs))
    {
        if (weak_ref_alive(global.__cottonwool_structs[_i]))
        {
            var _meta = global.__cottonwool_meta[_i];
            if (surface_exists(_meta.surface) || _inclusive) array_push(_array, _meta);
        }
        
        ++_i;
    }
    
    return _array;
}