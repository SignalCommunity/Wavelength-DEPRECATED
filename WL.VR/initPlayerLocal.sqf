params ["_player","_isJip"];
//any

// ====================================================================================
// WL - ShackTac UI Settings

STHud_NoSquadBarMode = true;
// KEEP THIS ON FOR NOW... 
//STUI_Occlusion = false;
STUI_RemoveDeadViaProximity = true ;

// ====================================================================================
// WL - JIP Units Auto-teleportation
// Credits: Bismarck
if (_isJip && !isNil "PABST_ADMIN_SAFESTART_public_isSafe" && {!PABST_ADMIN_SAFESTART_public_isSafe} && (f_param_autoTeleport == 1)) then {
  [] execVM "f\JIP\f_JIP_autoTeleport.sqf";
};
// ====================================================================================
