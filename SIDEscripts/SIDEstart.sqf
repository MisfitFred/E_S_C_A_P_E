sleep 30;

// ======================== random Side Mission Start ===================================


_SIDEstart = ["W","E"] call BIS_fnc_selectRandom;


if ( _SIDEstart == "E") then 	{
								[] execVM "SIDEscripts\militarizeSideEast.sqf";
};

if ( _SIDEstart == "W") then 	{
								[] execVM "SIDEscripts\militarizeSideWest.sqf";
};
