/*
 * Function for adding an item to an inventory
 * 
 * 2 arguments
 * 
 * argument0    inv - obj_inventory or index of data structure to modify
 * argument1    item - obj_inventory_item to add to inventory
 */

var inv = argument0;
var item = argument1;

// Verify argument types
if (object_get_name(inv) == "obj_inventory")
    inv = inv.inventory;
if (!is_real(inv) || ds_exists(inv, ds_type_list))
    exit;

// Make sure item isn't already in inventory.
if (ds_list_find_index(inv, item) != -1)
    exit;

// Insert the item into the data structure
ds_list_add(inv, item);

