private["_player","_didJIP","_players","_placed","_playerIsZeus","_isPlayerDead","_uid"];

_player = _this select 0;
_didJIP =  _this select 1;

if(name _player == "HC") then {
    ["HC present. Offloading AI."] spawn a3e_fnc_debugmsg;
    A3E_HC_ID = owner _player;
    if(A3E_HC_ID==0) exitwith {
         ["Getting HC ID failed!"] spawn a3e_fnc_debugmsg;
    };
} else {
    
    diag_log format["initPlayerServer: %1 joined the Game!  didJIP=%2",name _player, _didJIP];
    waitUntil({        
        diag_log format["initPlayerServer: %1 joined the Game!  didJIP=%2",name _player, _didJIP];
        (!("Error: No unit" == (name _player)) && (alive _player));
    });
    	 
	if(isNil("A3E_Players")) then {
		A3E_Players = [];
	};
    A3E_Players = A3E_Players + [_player];
    publicVariable "A3E_Players";
	
	[[[_player], {(_this select 0) setCaptive true;}], "BIS_fnc_spawn", _player, false] call BIS_fnc_MP;
	diag_log format["Escape debug: %1 is waiting for prison creation.", name _player];
    waituntil{sleep 0.5;(!isNil("A3E_FenceIsCreated") && !isNil("A3E_StartPos") && !isNil("A3E_ParamsParsed"))};
	diag_log format["Escape debug: %1 will be placed now.", name _player];
	_placed = false;
     
     
     // Added by Fred: start
     _playerIsZeus = false;     
     if (!isNil "Zeus_1") then {         
     	if(_player == Zeus_1) then {
           _playerIsZeus = true; 
        }else {
           _playerIsZeus = false;
        };         
     };   
 
     // Check if player is dead                 
     _isPlayerDead = false;
     _uid = getPlayerUID _player;
     waitUntil {!(isNil "A3E_ListOfKilledPlayers");};
     if (_uid in A3E_ListOfKilledPlayers) then
     {         
     	 //["Initialize", [_player, [], true]] call BIS_fnc_EGSpectator;
         _player setVariable ["A3E_isDead",true, true];
         _isPlayerDead = true;             
     };
 	diag_log format["initPlayerServer: (initPlayerLocal)  %1 isPlayerDead=%2.", name _player, _isPlayerDead];  
         
    // Added by Fred: Dead players or Zeus will not be placed into prison they will spawn at "respawn" marker position.       
    if((!_playerIsZeus) && (!_isPlayerDead)) then {
		if(time>60) then {
			_players = [] call A3E_fnc_GetPlayers;
			{
				if(_x != _player) exitwith {
					_player setpos [(getpos _x select 0) + (random 4) - 2, (getpos _x select 1) + (random 6) - 3, 0];
					_placed = true;
					diag_log format["Escape debug: %1 placed at %2.", name _player, name _x];
				};
			} foreach _players;	
		};
		if(!_placed) then {
			_player setpos [(A3E_StartPos select 0)+random 5.0-2.5,(A3E_StartPos select 1)+random 5.0-2.5,0];
			_player setdir (random 360);
			diag_log format["Escape debug: %1 placed at prison.", name _player];
		};
     };
	sleep 0.5;
	diag_log format["Escape debug: %1 is now ready (serverside).", name _player];
	_player setvariable["A3E_PlayerInitialized",true,true];
};
