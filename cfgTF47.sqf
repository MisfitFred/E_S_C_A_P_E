// --- TICKET SYSTEM & LOGGING ----------------------------------------------------------------------------------------------------------------------
// Modify this value to change the initial ticket count.
#define ACE3    0
#define ACRE    0
 
TICKETS_WEST = 100;
 
// Max Tickets the Team may ever have - tickets gained beyond that point are lost
TICKETS_SOFTCAP = 100;
TICKETS_HARDCAP = 150;
 
// This is the Mission ID for the Database Log - set to 0 to disable DB Logging
// 0 ... disabled
// 1 ... Takistan Domination
// 2 ... Fallujah Insurgency
// 3 ... Reshmaan Patrol Ops
// 4 ... Takistan Domination Mod Version
// 5 ... Takistan Domination Gefechtsübungszentrum (GUeZ) Version
// 7 ... ISLA DI CAPRAIA PatrolOps Mod
// 9 ... Invade&Annex Al Rayak
// 7 ... I&A Altis
// 99... Development Server
TF47_MISSIONID = 1;
 
// Mission Name/Version Info for Log
TF47_MISSIONINFO = "CO-154 Insurgency Kunduz";
 
_pathtoscripts = "tf47CoreScripts\";
 
// _infantryStaminaClass = "US_Delta_Force_EP1";
 
// --- DESPAWN PREVENTION MARKERS -------------------------------------------------------------------------------------------------------------------
_despawnPreventionMarkers = [
        ["respawn_west","respawn_west_1",250]
];
 
// --- BASE CLEAN-UP MARKERS ------------------------------------------------------------------------------------------------------------------------
// see basecleanup.sqf for details
// Markers to Check for Base Clean-up Process
// [Marker Name, Clean-up Distance]
_baseCleanupMarkers = [["respawn_west","respawn_west_1",200]];
 
 
 
// --- MAP CONTROL MARKERS --------------------------------------------------------------------------------------------------------------------------
//              see mcmarker.sqf and mcmarkerchange.sqf for details
_statusMarkersInit = false;
_statusMarkerData = [
        ["a_1",                         ["mc1marker",                           "b_hq",                         "ColorGreen",           "CCT - Command and Control ""SPECTRE""",                                                true]],
        ["a_2",                         ["mc2marker",                           "b_hq",                         "ColorGreen",           "CCT - Fliegerleitoffizier ""TOPMAN""",                                                 true]]
        // ["raven1",           ["callsign_raven1",                     "b_air",                        "ColorBrown",           "RAVEN-01",                                                                                                             false]],
        // ["raven2",           ["callsign_raven2",                     "b_air",                        "ColorBrown",           "RAVEN-02",                                                                                                             false]],
        // ["butterfly1",       ["callsign_butterfly1",         "b_air",                        "ColorBrown",           "BUTTERFLY-01",                                                                                                 false]],
        // ["butterfly2",       ["callsign_butterfly2",         "b_air",                        "ColorBrown",           "BUTTERFLY-02",                                                                                                 false]],
        // ["pelican1",         ["callsign_pelican1",           "b_air",                        "ColorBrown",           "PELICAN",                                                                                                              false]],
        // ["griffin1",         ["callsign_griffin1",           "b_air",                        "ColorBrown",           "GRIFFIN-01",                                                                                                   false]],
        // ["griffin2",         ["callsign_murphy1",            "b_air",                        "ColorBrown",           "GRIFFIN-02",                                                                                                   false]],
        // ["dragon1",          ["callsign_dragon1",            "b_air",                        "ColorOrange",          "DRAGON",                                                                                                               false]],
        // ["firefly1",         ["callsign_firefly1",           "b_air",                        "ColorOrange",          "FIREFLY",                                                                                                              false]],
        // ["thunderbird1",     ["callsign_thunderbird1",       "b_plane",                      "ColorOrange",          "THUNDERBIRD",                                                                                                  false]],
        // ["falcon1",          ["callsign_falcon1",            "b_plane",                      "ColorOrange",          "FALCON-01",                                                                                                    false]],
        // ["falcon2",          ["callsign_falcon2",            "b_plane",                      "ColorOrange",          "FALCON-02",                                                                                                    false]],
        // ["c130",                     ["callsign_c130",                       "b_plane",                      "ColorBrown",           "C130J",                                                                                                                false]],
        // ["rhino1",           ["callsign_rhino1",                     "b_armor",                      "ColorOrange",          "RHINO-01",                                                                                                             false]],
        // ["rhino2",           ["callsign_rhino2",                     "b_armor",                      "ColorOrange",          "RHINO-02",                                                                                                             false]],
        // ["tiger1",           ["callsign_tiger1",                     "b_mech_inf",           "ColorOrange",          "TIGER-01",                                                                                                             false]],
        // ["tiger2",           ["callsign_tiger2",                     "b_mech_inf",           "ColorOrange",          "TIGER-02",                                                                                                             false]]
];
_statusMarkers = [_statusMarkerData, []] call CBA_fnc_hashCreate;
 
 
 
// --- LIFT RULES -----------------------------------------------------------------------------------------------------------------------------------
//              see vehicleOnSpawn.sqf
// _LiftHelicopters = ["seagull1","seagull2","pelican1"];
// _NoLiftHelicopters = ["crow1", "crow2", "dustoff1", "griffin1", "goose1", "manticore1"];
 
 
// --- No JUMP OUT VEH -----------------------------------------------------------------------------------------------------------------------------------
//              see vehicleOnEnter.sqf
_JumpOutHelicopters = [];
 
 
 
// --- VEHICLE RESTRICTIONS -------------------------------------------------------------------------------------------------------------------------
// Vehicle Name, Driver Whitelist ID (0 for None), Crew Whitelist ID (0 for None), Driver Slots, Crew Slots
_vehicleRestrictionData = [
        // AH-6
        ["ah6",                       [1, 1,  ["a_73","a_74"],                               ["a_73","a_74"]]],
        // MH-6
        ["mh6",                       [1, 1,  ["a_71","a_72"],                               ["a_71","a_72"]]],
        // UH-60
        ["uh60",                      [1, 1,  ["a_67","a_68","a_69","a_70"],                 ["a_67","a_68","a_69","a_70"]]],
		// AW-101
        ["aw101",                     [1, 1,  ["b_31","b_32"],                               ["b_31","b_32"]]],
        // AW-159
        ["aw159",                     [1, 1,  ["b_29","b_30"],                               ["b_29","b_30"]]],
		
		
        ["t1",                     [2, 2,  ["a_61","a_62","a_63","a_64","a_65","a_66"],      ["a_61","a_62","a_63","a_64","a_65","a_66"]]],
        ["t2",                     [2, 2,  ["a_61","a_62","a_63","a_64","a_65","a_66"],      ["a_61","a_62","a_63","a_64","a_65","a_66"]]],
        ["t3",                     [2, 2,  ["g_39","g_40","g_41","g_42","g_43","g_44"],      ["g_39","g_40","g_41","g_42","g_43","g_44"]]],
        ["t4",                     [2, 2,  ["g_39","g_40","g_41","g_42","g_43","g_44"],      ["g_39","g_40","g_41","g_42","g_43","g_44"]]]
		
		
		// AH6
        //["ah6",                                       [1, 1,  ["rotwa21","rotwa22"],                                          ["rotwa21","rotwa22"]]],
        // A-10/F-16
        //["a10",                               [1, 1,  ["fixwa11","fixwa21"],                                          []]],
        // A-10/F-16
        //["f16",                               [1, 1,  ["fixwa11","fixwa21"],                                          []]],
        // MH-6
        //["mh6",                                       [1, 1,  ["rotwt31","rotwt32"],                                          ["rotwt31","rotwt32"]]],
        // CH-47
        //["ch47",                                      [1, 1,  ["rotwt21","rotwt22","rotwt23","rotwt24"],                                              ["rotwt21","rotwt22","rotwt23","rotwt24"]]],
        // C-130
        //["c130",                                      [1, 1,  ["fixwt11","fixwt12","fixwt13"],                        ["fixwt11","fixwt12","fixwt13"]]],
        // UH60M (DUSTOFF)
        //["dustoff",                   [1, 1,  ["rotwt41","rotwt42"],                      ["rotwt41"],["rotwt42"]]],
       
        
       
        // ["raven2",                   [1, 1,  ["rottrans11","rottrans12","rottrans21","rottrans22"],                                          ["rottrans11","rottrans12","rottrans13","rottrans14","rottrans21","rottrans22","rottrans23","rottrans24","rottrans25","rottrans26"]]],
        // ["pelican1",                 [1, 1,  ["rottrans11","rottrans12","rottrans21","rottrans22"],                                          ["rottrans11","rottrans12","rottrans13","rottrans14","rottrans21","rottrans22","rottrans23","rottrans24","rottrans25","rottrans26"]]],
        // ["griffin1",                 [1, 1,  ["rottrans11","rottrans12","rottrans21","rottrans22"],                                          ["rottrans11","rottrans12","rottrans13","rottrans14","rottrans21","rottrans22","rottrans23","rottrans24","rottrans25","rottrans26"]]],
        // ["griffin2",                 [1, 1,  ["rottrans11","rottrans12","rottrans21","rottrans22"],                                          ["rottrans11","rottrans12","rottrans13","rottrans14","rottrans21","rottrans22","rottrans23","rottrans24","rottrans25","rottrans26"]]],
        // ["butterfly1",               [1, 1,  ["rottrans11","rottrans12","rottrans21","rottrans22"],                                          ["rottrans11","rottrans12","rottrans13","rottrans14","rottrans21","rottrans22","rottrans23","rottrans24","rottrans25","rottrans26"]]],
        // ["butterfly2",               [1, 1,  ["rottrans11","rottrans12","rottrans21","rottrans22"],                                          ["rottrans11","rottrans12","rottrans13","rottrans14","rottrans21","rottrans22","rottrans23","rottrans24","rottrans25","rottrans26"]]],
        // ["c1301",                    [1, 1,  ["rottrans11","rottrans12","rottrans21","rottrans22"],                                          ["rottrans11","rottrans12","rottrans13","rottrans14","rottrans21","rottrans22","rottrans23","rottrans24","rottrans25","rottrans26"]]],
 
        // ["dragon1",          [1, 1,  ["rotwa11","rotwa12"],                                                                                                  ["rotwa11","rotwa12"]]]
        // ["firefly1",                 [1, 1,  ["rotatt21","rotatt22"],                                                                                                        ["rotatt21","rotatt22","rotatt23","rotatt24"]]],
 
        // ["thunderbird1",     [1, 1,  ["fixatt11","fixatt21","fixatt22","fixatt31"],                                                          []]],
        // ["falcon1",          [1, 1,  ["fixatt11","fixatt21","fixatt22","fixatt31"],                                                          []]],
        // ["falcon2",          [1, 1,  ["fixatt11","fixatt21","fixatt22","fixatt31"],                                                          ["fixatt22"]]],
        // ["rhino1",                   [2, 2,  ["tank11","tank12","tank13","tank14","tank21","tank22","tank23","tank24"],      []]],
        // ["rhino2",                   [2, 2,  ["tank11","tank12","tank13","tank14","tank21","tank22","tank23","tank24"],      []]],
        // ["tiger1",                   [2, 2,  ["tank11","tank12","tank13","tank14","tank21","tank22","tank23","tank24"],      []]],
        // ["tiger2",                   [2, 2,  ["tank11","tank12","tank13","tank14","tank21","tank22","tank23","tank24"],      []]]
];
_vehicleRestrictions = [_vehicleRestrictionData, []] call CBA_fnc_hashCreate;
 
 
 
// --- SECURE SLOTS ---------------------------------------------------------------------------------------------------------------------------------
// Slot Name, Whitelist ID
_secureSlots = [
        ["a_1", 3],     // CCT Command and Control
        ["a_2", 3]      // CCT 1st JTAC
        //["mc3",1],    // Tower
        //["Zeus1", 5], //Zeus 1
        //["Zeus2", 5]  //Zeus 2
];
 
// --- ALL SLOTS ------------------------------------------------------------------------------------------------------------------------------------
// used by Domination for Playermarkers, etc...
_allslots = [];
 
// --- Infantry Ticket Costs ------------------------------------------------------------------------------------------------------------------------
// Infantry:                                            2 Tickets
// Infantry Squad Medics:                       		3 Tickets
// Infantry Fireteamleader								4 Tickets
// Infantry Squad Lead:                         		5 Tickets
// Infantry Platoon Lead								6 Tickets
// Tank Crew:                                           10 Tickets
// UH60 Crew:   				       					10 Tickets
// MH-6 Crew:                                           10 Tickets
// AH-6 Crew:         				    				10 Tickets
// Mission Control Slots:                       		15 Tickets
// Zeus Slot:                                           100 Tickets
 
_infantryTicketsDefault = 2;
_infantryTicketsData = [

        // Platoon Lead
		
		["a_4",6],	["b_1",6],	["g_1",6],
		
        //Squad Lead
        ["a_5",5],	["a_7",5],	["a_21",5],	["a_35",5],	["a_49",5],	["b_5",5],	["b_13",5],	["b_21",5],	["b_2",5],	["g_2",5],	["g_3",5],	["g_15",5],	["g_27",5],
		
		//Fireteam Lead
		["a_9",4],	["a_13",4],	["a_17",4],	["a_23",4],	["a_27",4],	["a_31",4],	["a_37",4],	["a_41",4],	["a_45",4],	["a_51",4],	["a_56",4],	["g_9",4],	["g_21",4],	["g_33",4],
       
        // Medics
        ["a_3",3],	["a_6",3],	["a_8",3],	["a_22",3],	["a_36",3],	["a_50",3],	["a_75",5],	["a_76",5],	["b_3",3],	["b_9",3],	["b_17",3],	["b_25",3],	["b_33",5],	["b_34",5],
	    
		["g_4",3],	["g_10",3],	["g_16",3],	["g_22",3],	["g_28",5],	["G_34",5],
	   
	    // SPZ Crew
		
	    ["a_61", 10],	["a_62", 10],	["a_63", 10],	["a_64", 10],	["a_65", 10],	["a_66", 10],
		
        // Ah6
        ["a_73", 10],            ["a_74", 10],
       
		// Mh6
        ["a_71", 10],            ["a_72", 10],
	   
        // UH60
        ["a_67", 10],  		     ["a_68", 10],    ["a_69", 7],    ["a_70", 7],
       
        // AW101 Crew
        ["b_31",10],                ["b_32",10],
       
        // AW159
        ["b_29",10],       		["b_30",10],
       
        // MH6
        //["rotwt31",5],                ["rotwt32",5],
       
        // CH47
        //["rotwt21",10],               ["rotwt22",10],         ["rotwt23",10],         ["rotwt24",10],
       
        // C-130
        //["fixwt11",13],               ["fixwt12",13],         ["fixwt12",13],
       
        // UH60M (DUSTOFF)
        //["rotwt41",7],                ["rotwt42",7],          ["rotwt43",10],         ["rotwt44",10],
 
        // CCT, JTAC, TOWER
        ["a_1", 10],            ["a_2", 10]
 
];
_infantryTickets = [_infantryTicketsData, _infantryTicketsDefault] call CBA_fnc_hashCreate;
 
// --- SatCon----------------------------------------------------------------------------------------------------------------------------------------
_satConSlotsData = [
        //["mc1",  true]
];
_satConSlots = [_satConSlotsData, false] call CBA_fnc_hashCreate;
 
// --- Active Mods ----------------------------------------------------------------------------------------------------------------------------------
_activeModsData = [
];
_activeMods = [_activeModsData, false] call CBA_fnc_hashCreate;
 
// --- Default Loadouts -----------------------------------------------------------------------------------------------------------------------------
_defaultLoadoutsData = [
/*
        ["armor11", "crew"],                    ["armor12", "crew"],                    ["armor13", "crew"],
        ["armor21", "crew"],                    ["armor22", "crew"],                    ["armor23", "crew"],
        ["rotwt11", "crew"],                    ["rotwt12", "crew"],                    ["rotwt13", "crew"],                    ["rotwt14", "crew"],            ["rotwt15", "crew"],
        ["rotwt21", "crew"],                    ["rotwt22", "crew"],                    ["rotwt23", "crew"],                    ["rotwt24", "crew"],            ["rotwt25", "crew"],
        ["rotwa11", "crew"],                    ["rotwa12", "crew"],
        ["fixwa11", "crew"],                    ["fixwa12", "crew"],                    ["fixwa13", 10],
        ["maceact", "squadleader"],     ["mace11", "squadleader"],              ["mace21", "squadleader"],              ["mace31", "squadleader"],
        ["hammeract", "squadleader"],   ["hammer11", "squadleader"],    ["hammer21", "squadleader"],    ["hammer31", "squadleader"],
        ["mace12", "medic"],                    ["mace22", "medic"],                    ["mace32", "medic"],
        ["hammer12", "medic"],                  ["hammer22", "medic"],                  ["hammer32", "medic"],
        ["mc1", "cct"],                                 ["mc2", "cct"],                                 ["mc3", "cct"],                                 ["mc4", "cct"],                                 ["mc5", "cct"]
*/
];
_defaultLoadouts = [_defaultLoadoutsData, "basic"] call CBA_fnc_hashCreate;