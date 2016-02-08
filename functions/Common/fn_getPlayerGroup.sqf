private["_group","_isZeus"];
//_modifier = [_this, 0, 1] call BIS_fnc_param;

/* Changed by Fred, take care that Zeus and dead player will not used to deterine the player group. I could happen that Zeus must escape :-) */
diag_log format["fn_GetPlayers: enter"];
waitUntil  {
	if(isMultiplayer) then {
		_group = grpNull;
		{
	        //diag_log format["Escape debug: (fn_getPlayerGroup) %1 check for Zeus.", _x];
	        if (isNil "Zeus_1") then 
	        {
	           //diag_log format["Escape debug: (fn_getPlayerGroup) Zeus_1 is not present. Check Player %1", _x];
	           if((isPlayer _x) && !((getPlayerUID _x) in A3E_ListOfKilledPlayers)) exitwith {
	               //diag_log format["Escape debug: (fn_getPlayerGroup) %1 is a valid solution to get the player group", _x];
					_group = group _x;
				};  
	            
	        } else {
	            //diag_log format["Escape debug: (fn_getPlayerGroup) Zeus_1 is present. Check Player %1", _x];
	           	if((isPlayer _x) && (_x != Zeus_1) && !((getPlayerUID _x) in A3E_ListOfKilledPlayers)) exitwith {
	                //diag_log format["Escape debug: (fn_getPlayerGroup) %1 is a valid solution to get the player group, and he's not on slot Zeus_1", _x];
					_group = group _x;
				}; 
	            
	        };
			
		} foreach playableUnits;
	} else {
		_group = group player;
	};   
    !(_group == grpNull);
};
/*@ Todo: In Case only Zeus joint the server or only Zeus is present how ever. Zeus shall be returned, but effect on other scripts must be evaluated.*/
// Descission: this is not the responsibility of this script. All callers must be able to handle "grpNull" 

diag_log format["fn_getPlayerGroup: %1 is player group", _group];
_group