private["_listOfAllPlayers","_listOfActivePlayers","_isZeus"];
//_modifier = [_this, 0, 1] call BIS_fnc_param;
_listOfAllPlayers = allPlayers;

/* Changed by Fred, take care that Zeus and dead player will not be part of player list*/
_listOfActivePlayers = [];
waitUntil  {
	{
	    diag_log format["Escape debug: (GetPlayers) %1 check for Zeus.", _x];
	    if (isNil "Zeus_1") then 
	    {
	       diag_log format["Escape debug: (GetPlayers) Zeus_1 is not present. Check Player %1", _x];
	       /*
	       if((isPlayer _x) && !((getPlayerUID _x) in A3E_ListOfKilledPlayers)) then {
	           diag_log format["Escape debug: (GetPlayers) %1 added to player list", _x];
				_listOfActivePlayers  pushBack _x;
			};
	        */
	        if(isPlayer _x) then {
	          diag_log format["Escape debug: (GetPlayers) %1 is a real player", _x];  
	          _uid = getPlayerUID _x;
	          if  !(_uid in A3E_ListOfKilledPlayers) then {
	              diag_log format["Escape debug: (GetPlayers) %1 uid %2 is not on list of killed players %3 is a real player", _x, _uid, A3E_ListOfKilledPlayers];
	              _listOfActivePlayers  pushBack _x;
	          }; 
	        };  
	    } else {
	        diag_log format["Escape debug: (GetPlayers) Zeus_1 is present. Check Player %1", _x];
	       	if((isPlayer _x) && (_x != Zeus_1) && !((getPlayerUID _x) in A3E_ListOfKilledPlayers)) then {
	            diag_log format["Escape debug: (GetPlayers) %1 added to player list", _x];
				_listOfActivePlayers  pushBack  _x;
			}; 	        
	    };		
	}foreach _listOfAllPlayers;
	!(0 == count _listOfActivePlayers);    
};   
/*@ Todo: In Case only Zeus joint the server or only Zeus is present how ever. Zeus shall be returned, but effect on other scripts must be evaluated.*/
// Descission: this is not the responsibility of this script. All callers must be able to handle "grpNull" 
diag_log format["Escape debug: (GetPlayers) return %1", _listOfActivePlayers];
_listOfActivePlayers