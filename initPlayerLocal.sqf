waituntil{!isNull(player)};
//Clientside Stuff
//call compile preprocessFile "Revive\reviveInit.sqf";

_didJIP =  _this select 1;
diag_log format["initPlayerLocal: %1 joined the Game!  didJIP=%2",name player, _didJIP];
[] spawn {
	disableSerialization;
	waitUntil {!isNull(findDisplay 46)};
	(findDisplay 46) displayAddEventHandler ["keyDown", "_this call a3e_fnc_KeyDown"];
};
titleText ["Loading...", "BLACK",0.1];

/* Changed by Fred: Disabe revive system, ACE will be used*/
//call compile preprocessFile "Revive\reviveInit.sqf";
call compile preprocessFile "Scripts\AT\dronehack_init.sqf";
[] call A3E_fnc_addUserActions;
removeAllWeapons player;
/* changed by Fred: remove everything*/
removeAllItems player;
removeBackpack player;
removeGoggles player;
removeHeadgear player;

/* added by Fred: TFAR support or don not assign a radio at start*/
player unassignitem "ItemRadio";
player removeItem "ItemRadio";
//removeAllContainers player; 
removeAllAssignedItems player;

 /*changed by Fred: Why we need a watch at start point:-)*/
//player addItem "ItemWatch";
//player assignItem "ItemWatch";


drn_fnc_Escape_DisableLeaderSetWaypoints = {
	if (!visibleMap) exitwith {};
	
	{
		player groupSelectUnit [_x, false]; 
	} foreach units group player;
};

// If multiplayer, then disable the cheating "move to" waypoint feature.
if (isMultiplayer) then {
	[] spawn {
		waitUntil {!isNull(findDisplay 46)}; 
		// (findDisplay 46) displayAddEventHandler ["KeyDown","_nil=[_this select 1] call drn_fnc_Escape_DisableLeaderSetWaypoints"];
		(findDisplay 46) displayAddEventHandler ["MouseButtonDown","_nil=[_this select 1] call drn_fnc_Escape_DisableLeaderSetWaypoints"];
	};
};

waituntil{sleep 0.1;!isNil("A3E_ParamsParsed")};
/*changed by Fred: ACE Support*/
//AT_Revive_Camera = Param_ReviveView;

  //Disable respawn Button
[] spawn {
	if((Param_RespawnButton)==0) then {
		while{true} do {
			while{isNull ((findDisplay 49) displayCtrl 1010)} do {
				sleep 0.1;
			};
			((findDisplay 49) displayCtrl 1010) ctrlEnable false;
			while{!isNull ((findDisplay 49) displayCtrl 1010)} do {
				sleep 0.1;
			};
		};
	};
};



[] spawn {
	disableSerialization;
	waitUntil {!isNull(findDisplay 46)};
	(findDisplay 46) displayAddEventHandler ["keyDown", "_this call a3e_fnc_KeyDown"];
};

waituntil{sleep 0.1;(!isNil("A3E_FenceIsCreated") && !isNil("A3E_StartPos") && !isNil("A3E_ParamsParsed") && (player getvariable["A3E_PlayerInitialized",false]))};


// Check if player is dead                
_isPlayerDead = false;
_uid = getPlayerUID _player;
waitUntil {!(isNil "A3E_ListOfKilledPlayers");};
if (_uid in A3E_ListOfKilledPlayers) then
{         
	 ["Initialize", [_player, [], true]] call BIS_fnc_EGSpectator;            
    _player setVariable ["A3E_isDead",true, true];
    _isPlayerDead = true;             
};
diag_log format["initPlayerServer: (initPlayerLocal)  %1 isPlayerDead=%2.", name _player, _isPlayerDead];  

sleep 2.0;

if(!isNil("paramsArray")) then {
	paramsArray call A3E_fnc_WriteParamBriefing;
};

diag_log format["Escape debug: %1 is now ready (clientside).", name player];

titleFadeOut 1;
sleep 2;
["Somewhere on", A3E_WorldName , str (date select 2) + "/" + str (date select 1) + "/" + str (date select 0) + " " + str (date select 3) + ":00"] spawn BIS_fnc_infoText;

/* Changed by Fred: Other start setup*/
waituntil{sleep 0.5; !isNil("A3E_PrissonGuard")};
//Does not work on server, because this command must be executed on all clients
A3E_PrissonGuard addAction ["knock guard down", {A3E_PrissonGuard setDamage 1;}, 3, 1, true, true];
    
    
waituntil{sleep 0.5;!isNil("A3E_EscapeHasStarted")};

player setCaptive false;
