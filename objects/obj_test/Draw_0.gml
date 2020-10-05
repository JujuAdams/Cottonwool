if (!surface_exists(surface)) surface = surface_create(100, 100);

surface_set_target(surface);
draw_clear(c_red);
surface_reset_target();

draw_surface(surface, 10, 10);