AOCount = 0;
publicVariable "AOCount";

sleep 30;

// ======================== random Domination Start ===================================


_domistart = ["NE","NW","SE","SW"] call BIS_fnc_selectRandom;


if ( _domistart == "NE") then 	{
								[] execVM "AOscripts\militarizeNE.sqf";
};

if ( _domistart == "NW") then 	{
								[] execVM "AOscripts\militarizeNW.sqf";
};

if ( _domistart == "SE") then 	{
								[] execVM "AOscripts\militarizeSE.sqf";
};

if ( _domistart == "SW") then 	{
								[] execVM "AOscripts\militarizeSW.sqf";
};