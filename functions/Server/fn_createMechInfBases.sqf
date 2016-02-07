if(!isserver) exitwith {};
if (1 > Param_MechanInfCompanyForce)  exitwith {};

private ["_positions", "_i", "_j", "_tooCloseAnotherPos", "_mechinfbasecount", "_pos", "_countNW", "_countNE", "_countSE", "_countSW", "_isOk","_MechInfBaseRegionCount", "_x"];

_positions = [];
_i = 0;

_countNW = 0;
_countNE = 0;
_countSE = 0;
_countSW = 0;

/* 
 * creates "Param_MechanInfCompanyForce" infantry companies in every region 
*/

_mechinfbasecount = 0;
_MechInfBaseRegionCount = Param_MechanInfCompanyForce*5;

while {count _positions < _MechInfBaseRegionCount} do {
    _isOk = false;
    _j = 0;

    while {!_isOk} do {
        _pos = call A3E_fnc_findFlatArea;
        _isOk = true;


        if (_pos select 0 <= ((getpos center) select 0) && _pos select 1 > ((getpos center)select 1)) then {
            if (_countNW <= _MechInfBaseRegionCount) then {
                _countNW = _countNW + 1;
            }
            else {
                _isOk = false;
            };
        };
        if (_pos select 0 > ((getpos center)select 0) && _pos select 1 > ((getpos center) select 1)) then {
            if (_countNE <= _MechInfBaseRegionCount) then {
                _countNE = _countNE + 1;
            }
            else {
                _isOk = false;
            };
        };
        if (_pos select 0 > ((getpos center)select 0) && _pos select 1 <= ((getpos center) select 1)) then {
            if (_countSE <= _MechInfBaseRegionCount) then {
                _countSE = _countSE + 1;
            }
            else {
                _isOk = false;
            };
        };
        if (_pos select 0 <= ((getpos center)select 0) && _pos select 1 <= ((getpos center) select 1)) then {
            if (_countSW <= _MechInfBaseRegionCount) then {
                _countSW = _countSW + 1;
            }
            else {
                _isOk = false;
            };
        };
        _j = _j + 1;
        if (_j > 100) then {
            _isOk = true;
        };        
        _mechinfbasecount = _mechinfbasecount + 1;     
    };
    _tooCloseAnotherPos = false;
	//Check if too close to another depot, comcenter or start
	{
        if (_pos distance _x < A3E_ClearedPositionDistance) then {
            _tooCloseAnotherPos = true;
        };
    } foreach A3E_Var_ClearedPositions;


    if (!_tooCloseAnotherPos) then {
        
        // Position seems to be ok, set a trigger which creates a mech inf company when the playergroup is nearby. 
        // Possbile weakness could be that only player 0  
        _positions pushBack  _pos;
		A3E_Var_ClearedPositions pushBack _pos;  
                       
        ["A3E_MechInfBasepMarker" + str _mechinfbasecount,_pos,"o_mech_inf"] call A3E_fnc_createLocationMarker;               
		_playerGroup = [] call A3E_fnc_GetPlayerGroup;
		_trigger = createTrigger ["EmptyDetector", _pos];
        _trigger triggerAttachVehicle [(call A3E_fnc_GetPlayers) select 0];	
		_trigger setTriggerArea[1000, 1000, 0, false];
		_trigger setTriggerActivation ["MEMBER", "PRESENT", false];
		_trigger setTriggerStatements ["this", "[getPos thisTrigger] spawn A3E_fnc_MechInfBase",""]; 
                 
         diag_log format ["fn_createMechInfBases.sqf   position for MechInfGroup _pos=%1,  ", _pos];       
    };

    _i = _i + 1;
    if (_i > 100) exitWith {
        _positions
    };        
};