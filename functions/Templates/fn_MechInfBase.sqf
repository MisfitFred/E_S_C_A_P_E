private ["_number", "_position", "_groupStartPosition", "_currentPosition", "_vehicleDirection", "_object", "_numberOfVehicles", "_positionIsValid", "_allVehiclesCreated", "_vehicleCounter"];
private["_obj","_objpos","_dir","_gunner"];

_groupStartPosition = [_this,0] call bis_fnc_param;
if(isNil "_groupStartPosition") exitwith  {diag_log format ["fn_MechInfBase.sqf no valid postion received "]};

_numberOfVehicles = 4;
_positionIsValid = 1;
_vehicleCounter = 0;
// creates vehilces until maximum number of vehicles is reaches or no valid position was found.  

// This alogithm orders the units in acircle arround the "_groupStartPosition".
_deltaAngleDefault = 360/_numberOfVehicles;

// To reeduce the impression of a symetric structure for players some variances were defined.    
_deltaAngelVariance = 0.8;  //Value [0..1], should be below 0.8 to avoid collisions
_minimumDistanceFromCenter = 30;
_maximumDistanceFromCenter = 100;

_currentPosition = +_groupStartPosition;

_errorCounter = 0;
//_group = createGroup east;  //does not work, because then the vehilce start moving and leaving their camo net.
diag_log format ["fn_MechInfBase.sqf start creating vehicles "];
while {_vehicleCounter < _numberOfVehicles && _errorCounter < 50} do {   
  
  	
  	//calculate the position deviation for this vehicle
     _distanceFromCenter = _minimumDistanceFromCenter + random (_maximumDistanceFromCenter - _minimumDistanceFromCenter);
     _deltaAngle = _vehicleCounter * _deltaAngleDefault + ((random  (_deltaAngleDefault*_deltaAngelVariance) ) - ( _deltaAngleDefault * _deltaAngelVariance / 2));     
     _currentPosition = [_groupStartPosition, [(_groupStartPosition select 0) + _distanceFromCenter, (_groupStartPosition select 1), 0],   _deltaAngle] call drn_fnc_CL_RotatePosition;
     
     _vehiclePosition = _currentPosition findEmptyPosition [0,_distanceFromCenter,"rhs_bmp2k_msv"];    
     
	_positionIsValid = count _vehiclePosition; 
    
	if (_positionIsValid >= 1 ) then { 
    	_vehicleCounter = _vehicleCounter + 1;
		_vehicleDirection = random 360;
		_object = createVehicle ["CamoNet_BLUFOR_big_Curator_F", _vehiclePosition, [], 0, "NONE"];
		_object setDir _vehicleDirection;        
        /*
         _markername = format["MechInfVehilce%1",_vehiclePosition];
         _marker = createMarker [_markername, _vehiclePosition ];
         _marker setMarkerType "hd_dot";
        */       
         diag_log format ["fn_MechInfBase.sqf position for Tank position _pos=%1, vehilce number=%2  ", _vehiclePosition, _vehicleCounter];                      
 		[_vehiclePosition,_vehicleDirection,"rhs_bmp2k_msv",A3E_VAR_Side_Opfor] call BIS_fnc_spawnVehicle;                                      

	}
    else
    {
      //position is invalid, try again
    };
    sleep 1;
    
    _errorCounter = _errorCounter + 1; //how ever we shall take care tha we left this loop anytime
    
};
diag_log format ["%1 : helpMe: ", _groupStartPosition];