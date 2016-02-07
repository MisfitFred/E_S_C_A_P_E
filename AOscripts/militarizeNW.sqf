////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//																																  //
//                      		***		ARMA3 Domination-Like-Script v1.0 - by Sepp	***											  //
//																																  //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


//////////////// Exit if not server /////////////////////////////////////////////////////////////////////////////////////////////
if(!isServer) exitwith {};

//////////////// Declare Variables  /////////////////////////////////////////////////////////////////////////////////////////////

private ["_Playertext", "_NumOfPlayers", "_ao_select", "_ao_mkr", "_trig", "_trig_rt", "_log_pos", "_ao_task", "_mkr_text", "_ao_name", "_ao_rad", "_position","_flatPos", "_ao_iniText"];



_ao_select			= "";
_ao_mkr				= "";
_trig				= "";
_log_pos			= 0;
_mkr_text 			= "";
_ao_name 			= "";
_ao_rad 			= 350;


//////////////// Count all playable Blufor Units /////////////////////////////////////////////////////////////////////////////////

_NumOfPlayers = west countSide playableUnits;


//////////////// Deletes/Moves all remaining Marker/Object/Trigger ////////////////////////////////////////////////////////////////////

		"ao_mkr1" setmarkerpos [0,0,0];
		sleep 1;
		if (alive  radiotower) then {deletevehicle radiotower;};
		sleep 1;
		[trig_rt setpos [0,0,0]] call BIS_fnc_MP;
		sleep 1;
		if (alive helipad) then {deletevehicle helipad;};
		sleep 0.1;
		if (alive captureBunker1) then {deletevehicle captureBunker1;};
		sleep 0.1;
		if (alive captureBunker2) then {deletevehicle captureBunker2;};
		sleep 0.1;
		if (alive captureBunker3) then {deletevehicle captureBunker3;};
		sleep 0.1;
        deleteMarker "BunkerMarker1";
		sleep 0.1;
        deleteMarker "BunkerMarker2";
		sleep 0.1;
        deleteMarker "BunkerMarker3";
		sleep 30;	



//////////////// Random Selects the AO  //////////////////////////////////////////////////////////////////////////////////////////		
_ao_select = ["nagara","shamali","airfield","rasman","bastam","falar","mulladost","nur"] call BIS_fnc_selectRandom;





//////////////// AO is nagara ////////////////////////////////////////////////////////////////////////////////////////////////		
if ( _ao_select == "nagara") then {
									_log_pos   			= log_nagara;
									//_ao_rad    			= 200;
									//_mkr_text  		=
									_ao_name   		= "Nagara";
									//_ao_array_member 	= "nagara";
									
									sleep 1;
									
};

//////////////// AO is shamali ////////////////////////////////////////////////////////////////////////////////////////////////		
if ( _ao_select == "shamali") then {
									_log_pos   			= log_shamali;
									//_ao_rad    			= 150;
									//_mkr_text 	 	=
									_ao_name   			= "Samali";
									//_ao_array_member 	= "shamali";
									
									sleep 1;
									
};

//////////////// AO is airfield ////////////////////////////////////////////////////////////////////////////////////////////////		
if ( _ao_select == "airfield") then {
									_log_pos   			= log_airfield;
									//_ao_rad    			= 300;
									_ao_name   			= "Rasman Airfield";
									sleep 1;
									
};

//////////////// AO is rasman ////////////////////////////////////////////////////////////////////////////////////////////////		
if ( _ao_select == "rasman") then {
									_log_pos   			= log_rasman;
									//_ao_rad    			= 250;
									_ao_name   			= "Rasman";								
									sleep 1;
									
};

//////////////// AO is bastam ////////////////////////////////////////////////////////////////////////////////////////////////		
if ( _ao_select == "bastam") then {
									_log_pos   			= log_bastam;
									//_ao_rad    			= 200;
									_ao_name   			= "Bastam";
									sleep 1;
									
};

//////////////// AO is falar ////////////////////////////////////////////////////////////////////////////////////////////////		
if ( _ao_select == "falar") then {
									_log_pos   			= log_falar;
									//_ao_rad    			= 250;
									_ao_name   			= "Falar";								
									sleep 1;
									
};

//////////////// AO is mulladost ////////////////////////////////////////////////////////////////////////////////////////////////		
if ( _ao_select == "mulladost") then {
									_log_pos   			= log_mulladost;
									//_ao_rad    			= 200;
									_ao_name   			= "Mulladost";
									sleep 1;
									
};

//////////////// AO is nur ////////////////////////////////////////////////////////////////////////////////////////////////		
if ( _ao_select == "nur") then {
									_log_pos   			= log_nur;
									//_ao_rad    			= 350;
									_ao_name   			= "Nur";								
									sleep 1;
									
};

//////////////// Spawn Enemy AI in AO ////////////////////////////////////////////////////////////////////////////////////	

		nul = [_log_pos,2,true,2,[6,6],_ao_rad,"default",nil,nil,nil] execVM "LV\fillHouse.sqf";
		nul = [_log_pos,2,_ao_rad,[true,false],[true,false,false],false,[20,0],[0,0],"default",nil,nil,nil] execVM "LV\militarize.sqf";
		nul = [_log_pos,2,_ao_rad,[true,false],[true,false,true],true,[0,0],[3,0],"default",nil,nil,nil] execVM "LV\militarize.sqf";

//////////////// moves a visible marker to the ao //////////////////////////////////////////////////////////////////////////		

		"ao_mkr1" setmarkerpos getpos _log_pos;

//////////////// creates a task/show notification for the ao ///////////////////////////////////////////////////////////////////////////////////////		
		
["tsk1", true, ["Seize the Village held by hostile forces","Seize the AO","Main Mission"],getMarkerPos "ao_mkr1", "ASSIGNED", 1, true, true,"",true] call BIS_fnc_setTask;

//////////////// Hint for completed Main Mission /////////////////////////////////////////////////////////////////////////////////////////// 

ao_endText = format
	[
		"<t align='center' size='1.5'>Mission Completed!</t><br/><t size='1' align='center' color='#01DF01'>%1</t><br/>____________________<br/>Congratulations, you've managed to Seize %1!<br/><br/> Outstanding work, Soldiers!",
		_ao_name
	];


//////////////// create trigger at the ao ////////////////////////////////////////////////////////////////////////////////////////			
		
		sleep 1;
		
		_trig = createTrigger 					["EmptyDetector", getPos _log_pos];   
		_trig setTriggerArea 					[_ao_rad, _ao_rad, 0, false];  
		_trig setTriggerActivation 				["EAST", "notpresent", true];   
		_trig setTriggerStatements 				["this", "0 = execVM ""AOscripts\militarizeNE.sqf""; [ao_endText] remoteExec [""SEPP_fnc_globalHint"",0,false]; 0 = execVM ""sounds\missionComplete.sqf""; [""tsk1"", true, ['Seize the Village held by hostile forces','Seize the AO',""Main Mission""],getMarkerPos ""ao_mkr1"", ""SUCCEEDED"", 1, true, true,"""",true] call BIS_fnc_setTask; deletevehicle thisTrigger; AOcount = AOcount + 1" , ""];
		
		
		
		
	
		
//////////////// create a radiotower /////////////////////////////////////////////////////////////////////////////////////////////

	_position = [[[getPos _log_pos, _ao_rad],_trig],["water","out"]] call BIS_fnc_randomPos;
	_flatPos = _position isFlatEmpty[3, 1, 0.5, 30, 0, false];
	
	while {(count _flatPos) < 1} do {
		_position = [[[getPos _log_pos, _ao_rad],_trig],["water","out"]] call BIS_fnc_randomPos;
		_flatPos = _position isFlatEmpty[3, 1, 0.5, 30, 0, false];
	};
	while {IsOnRoad _flatPos} do {
		_position = [[[getPos _log_pos, _ao_rad],_trig],["water","out"]] call BIS_fnc_randomPos;
		_flatPos = _position isFlatEmpty[3, 1, 0.5, 30, 0, false];
	};

	radiotower = "Land_TTowerBig_2_F" createVehicle _flatPos;
	waitUntil { sleep 0.5; alive radioTower };
	radiotower setVectorUp [0,0,1];
	radiotowerAlive = true;
	
	
//////////////// create 2 ai patrol around radiotower /////////////////////////////////////////////////////////////////////////

		sleep 0.1;
		nul = [radiotower,2,20,[true,false],[false,false,false],false,[2,0],[0,0],"default",nil,nil,nil] execVM "LV\militarize.sqf";	
	
		
//////////////// create a helipad /////////////////////////////////////////////////////////////////////////////////////////////

	_poshelipad = [[[getPos _log_pos, _ao_rad],_trig],["water","out"]] call BIS_fnc_randomPos;
	_flatPoshelipad = _poshelipad isFlatEmpty[15, 1, 0.3, 30, 0, false];
	
	while {(count _flatPoshelipad) < 1} do {
		_poshelipad = [[[getPos _log_pos, _ao_rad],_trig],["water","out"]] call BIS_fnc_randomPos;
		_flatPoshelipad = _poshelipad isFlatEmpty[15, 1, 0.3, 30, 0, false];
	};

	helipad = "Land_HelipadEmpty_F" createVehicle _flatPoshelipad;
	waitUntil { sleep 0.5; alive helipad };
	helipadAlive = true;

			
//////////////// moves reinforcement trigger to the ao ///////////////////////////////////////////////////////////////////////////		

sleep 1;
		
trig_rt setpos (getpos _log_pos);	
			
				
//////////////// Hint for active Main Mission /////////////////////////////////////////////////////////////////////////////////////////// 

_ao_iniText = format
	[
		"<t align='center' size='1.5'>New Target</t><br/><t size='1' align='center' color='#FF0000'>%1</t><br/>____________________<br/>New Mission available near %1 !<br/><br/>Destroy the enemy's Radio Tower to stop them from calling in Reinforcements. <br/><br/> Also watch out for Enemy Bunker, check your Map to see their exact Location.",
		_ao_name
	];

	//-------------------------------------------- Show global target start hint
	
	[_ao_iniText] remoteExec ["SEPP_fnc_globalHint",0,false];
	
	
//////////////// Sound for Hint for active Main Mission /////////////////////////////////////////////////////////////////////////////////////////// 

sleep 0.1;

[] execVM "sounds\missionNew.sqf";
 
//[playSound "mission_new"] call BIS_fnc_MP;


//////////////// Add Capturable Bunker /////////////////////////////////////////////////////////////////////////////////////////// 
	
		_posbunker1 = [[[getPos _log_pos, _ao_rad],_trig],["water","out"]] call BIS_fnc_randomPos;
		_flatPosbunker1 = _posbunker1 isFlatEmpty[3, 1, 0.8, 30, 0, false];
		
		while {(count _flatPosbunker1) < 1} do {
			_posbunker1 = [[[getPos _log_pos, _ao_rad],_trig],["water","out"]] call BIS_fnc_randomPos;
			_flatPosbunker1 = _posbunker1 isFlatEmpty[3, 1, 0.8, 30, 0, false];
		};
		while {IsOnRoad _flatPosbunker1} do {
			_posbunker1 = [[[getPos _log_pos, _ao_rad],_trig],["water","out"]] call BIS_fnc_randomPos;
			_flatPosbunker1 = _posbunker1 isFlatEmpty[3, 1, 0.8, 30, 0, false];
		};

		captureBunker1 = [_flatPosbunker1,5,"Land_fortified_nest_big_EP1", 30, east] call compileFinal preprocessFileLineNumbers "dyncap\createCaptureLocation1.sqf";

		sleep 0.1;
		_posbunker2 = [[[getPos _log_pos, _ao_rad],_trig],["water","out"]] call BIS_fnc_randomPos;
		_flatPosbunker2 = _posbunker2 isFlatEmpty[3, 1, 0.8, 30, 0, false];
	
		while {(count _flatPosbunker2) < 1} do {
			_posbunker2 = [[[getPos _log_pos, _ao_rad],_trig],["water","out"]] call BIS_fnc_randomPos;
			_flatPosbunker2 = _posbunker2 isFlatEmpty[3, 1, 0.8, 30, 0, false];
		};	
		while {IsOnRoad _flatPosbunker2} do {
			_posbunker2 = [[[getPos _log_pos, _ao_rad],_trig],["water","out"]] call BIS_fnc_randomPos;
			_flatPosbunker2 = _posbunker2 isFlatEmpty[3, 1, 0.8, 30, 0, false];
		};

		captureBunker2 = [_flatPosbunker2,5,"Land_fortified_nest_big_EP1", 30, east] call compileFinal preprocessFileLineNumbers "dyncap\createCaptureLocation2.sqf";

		sleep 0.1;
	
		_posbunker3 = [[[getPos _log_pos, _ao_rad],_trig],["water","out"]] call BIS_fnc_randomPos;
		_flatPosbunker3 = _posbunker3 isFlatEmpty[3, 1, 0.8, 30, 0, false];
	
		while {(count _flatPosbunker3) < 1} do {
			_posbunker3 = [[[getPos _log_pos, _ao_rad],_trig],["water","out"]] call BIS_fnc_randomPos;
			_flatPosbunker3 = _posbunker3 isFlatEmpty[3, 1, 0.8, 30, 0, false];
		};
		while {IsOnRoad _flatPosbunker3} do {
			_posbunker3 = [[[getPos _log_pos, _ao_rad],_trig],["water","out"]] call BIS_fnc_randomPos;
			_flatPosbunker3 = _posbunker3 isFlatEmpty[3, 1, 0.8, 30, 0, false];
		};

		captureBunker3 = [_flatPosbunker3,5,"Land_fortified_nest_big_EP1", 30, east] call compileFinal preprocessFileLineNumbers "dyncap\createCaptureLocation3.sqf";



//////////////// Spawn AI in Capturable Bunker /////////////////////////////////////////////////////////////////////////////////////////// 

		sleep 0.1;
		nul = [captureBunker1,2,5,[true,false],[false,false,false],true,[4,0],[0,0],"default",nil,nil,nil] execVM "LV\militarize.sqf";
		sleep 0.1;
		nul = [captureBunker2,2,5,[true,false],[false,false,false],true,[4,0],[0,0],"default",nil,nil,nil] execVM "LV\militarize.sqf";
		sleep 0.1;
		nul = [captureBunker3,2,5,[true,false],[false,false,false],true,[4,0],[0,0],"default",nil,nil,nil] execVM "LV\militarize.sqf";
		
	
