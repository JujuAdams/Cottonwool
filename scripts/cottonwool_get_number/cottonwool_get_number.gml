/// Returns the number of surfaces being tracked by Cottonwool

function cottonwool_get_number()
{
    return array_length(global.__cottonwool_structs);
}