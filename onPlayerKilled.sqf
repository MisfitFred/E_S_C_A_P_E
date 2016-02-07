
//Added by Fred: Set Spectator mode for player


_player setVariable ["A3E_isDead",true, true];

_uid = getPlayerUID player;
A3E_ListOfKilledPlayers pushBack _uid;
publicVariable "A3E_ListOfKilledPlayers";


["Initialize", [player, [], true]] call BIS_fnc_EGSpectator;

