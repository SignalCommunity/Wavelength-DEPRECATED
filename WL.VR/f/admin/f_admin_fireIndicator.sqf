if !(hasInterface) exitWith {};

waitUntil {!isNull player};
waitUntil {!isNil "PABST_ADMIN_SAFESTART_public_isSafe" && {PABST_ADMIN_SAFESTART_public_isSafe}};

_player = player;

_masterAdminList = ["76561197976319415","76561198005847836","76561198089674282","76561198015013044","76561197991686585"];	//killpact, mysticalpony, hunter, bismarck and jonbons see notifications
private _masterUnitsList = [];


{
	if ((getPlayerUID _x) in _masterAdminList) then {
		_masterUnitsList = _masterUnitsList + [_x];
	};
} forEach allPlayers;


[
	[
		[_player],
		{
			params ["_unit"];
			_bsm_fnc_notify = {
				params ["_firer"];
				hint format["%1 has fired/thrown a weapon.",name _firer];
				systemChat format["%1 has fired/thrown a weapon.",name _firer];
			};
			_handle = _unit addEventHandler ["fired",_bsm_fnc_notify];
			
			waitUntil {!PABST_ADMIN_SAFESTART_public_isSafe};
			_unit removeEventHandler ["fired",_handle];
		}
	],
	"BIS_fnc_spawn",
	_masterUnitsList,
	false
] call BIS_fnc_MP;