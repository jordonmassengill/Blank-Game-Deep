// obj_Martin Draw Event
draw_self();

// Draw health bar if creature exists
if (variable_instance_exists(id, "creature")) {
    global.health_system.draw_health_bar(id);
}

// Draw shop menu if active
if (variable_instance_exists(id, "shop_menu") && shop_menu[? "active"]) {
    shop_menu_draw(shop_menu, shop, x, y);
}

// Draw interaction prompt when player is nearby
if (!shop_menu[? "active"]) {
    var player = instance_place(x, y - 1, obj_player_creature_parent);
    if (player != noone) {
        var platform_center = x;
        var player_center = player.x;
        var center_threshold = 32;

        if (abs(platform_center - player_center) <= center_threshold) {
            draw_set_halign(fa_center);
            draw_set_color(c_white);
            draw_text(x, y - 48, "Press SPACE/Y to shop");
            draw_set_halign(fa_left);
        }
    }
}