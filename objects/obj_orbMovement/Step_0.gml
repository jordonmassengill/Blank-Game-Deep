// obj_orborange Step Event
event_inherited();

// Override just the effect function
function apply_effect(target) {
    target.creature.stats.move_speed += 0.25;
}