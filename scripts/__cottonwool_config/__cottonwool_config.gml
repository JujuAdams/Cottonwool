//Whether to automatically swap all surface and surface-related functions for Cottonwool equivalents
//Setting this macro to <true> allows Cottonwool to work transparently without requiring any changes to your function calls
#macro COTTONWOOL_ALIAS_FUNCTIONS  true

//Whether to show an error message when a reference to a surface is lost but the surface still exists
//This is useful if you want to use Cottonwool as a development debug tool instead of as a garbage collection system
#macro COTTONWOOL_TEST_MODE  false

//Whether to show debug messages when surface references are created and lost
#macro COTTONWOOL_VERBOSE  true

//Whether to add callstack fingerprints to surface metadata
//This'll make it much easier to track down where surfaces are being created, but should be set to <false> for public release
#macro COTTONWOOL_CALLSTACK  true

//Don't set this to <false> unless you have to!
#macro COTTONWOOL_WARNING_VIEW_SURFACE  true