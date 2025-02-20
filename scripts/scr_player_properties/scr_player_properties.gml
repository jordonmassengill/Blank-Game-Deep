// In scr_player_properties
function create_player_properties() {
    var props = create_creature_properties();
    
    // Existing properties
    props.can_progress_level = true;
    props.respawn_on_death = true;
    props.input.using_controller = gamepad_is_connected(0);
    props.max_health = 150;
    props.current_health = 150;
    props.crit_level = 1;
    props.aoe_level = 3;          // Simple direct property for AOE level
    props.inventory = create_inventory();
    
    // Connect AOE level to stats system
    props.stats.area_of_effect = props.aoe_level;
    
    // Add simple currency property
    props.currency = 0;
    
    // Update death function
    props.die = function() {
        currency = 0;  // Lose currency on death
        room_restart();
    }
    
    // Add debug function to display currency
    props.debug_info = function() {
        return "Currency: " + string(currency);
    }
    
    return props;
}