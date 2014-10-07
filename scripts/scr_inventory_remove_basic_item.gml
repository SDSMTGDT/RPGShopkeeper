/*
 * Function for adding an item to an inventory
 * 
 * 2 arguments
 * 
 * argument0    inv - obj_inventory or index of data structure to modify
 * argument1    item - Enum of basic item to remove
 * argument2    count - Number of items to remove
 */

var inv = argument0;
var item = argument1;
var count = abs(argument2);

// Verify argument types
if (object_get_name(inv) == "obj_inventory")
    inv = inv.inventory;
if (!is_real(inv) || !ds_exists(inv, ds_type_map))
    exit;

// Make sure key exists
if (!ds_map_exists(inv, argument1))
    ds_map_add(inv, argument1, 0);

// Add items to inventory
ds_map_replace(inv, argument1, ds_map_find_value(inv, argument1) - argument2);
if (ds_map_find_value(inv, argument1) < 0)
    ds_map_replace(inv, argument1, 0);

