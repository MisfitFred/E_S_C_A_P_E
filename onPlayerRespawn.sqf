/*
* Added by Fred
* Respwan behavior, player shall have nothing except his clothes.
*/

/* changed by Fred: remove everything*/
diag_log format["onPlayerRespawn: %1 joined the Game!",name player];

removeAllItems player;
removeBackpack player;
removeGoggles player;
removeHeadgear player;

/* added by Fred: TFAR support or don not assign a radio at start*/
player unassignitem "ItemRadio";
player removeItem "ItemRadio";
//removeAllContainers player; 
removeAllAssignedItems player;