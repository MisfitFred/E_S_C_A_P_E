_reinforcement = ["paradrop","touchdown"] call BIS_fnc_selectRandom;


if ( _reinforcement == "paradrop") then 	{
nul = [helipad,2,true,false,3000,"random",true,250,50,6,0.5,200,true,false,true,true,radiotower,false,"default",nil,nil,nil,false] execVM "LV\heliParadrop.sqf";
};

if ( _reinforcement == "touchdown") then 	{
nul = [helipad,true,2,4,false,false,player,"random",3000,true,false,8,"default",[true,false,false,true],nil,nil,nil,false] execVM "LV\reinforcementChopper.sqf";
};
sleep 0.1;
trig_rt enablesimulation false;
sleep 300;
trig_rt enablesimulation true;