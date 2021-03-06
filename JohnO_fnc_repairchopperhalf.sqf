/**
 * ExileClient_object_vehicle_repair
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_vehicle","_availableHitpoints","_fixable","_equippedMagazines"];
_vehicle = _this select 0;
/*if (ExileClientPlayerIsInCombat) exitWith
{
	["RepairFailedWarning", ["You are in combat!"]] call ExileClient_gui_notification_event_addNotification;
};*/
if (vehicle player isEqualTo _vehicle) exitWith 
{
	[
	"InfoTitleAndText", 
	["No..", "Are you serious?"]
] call ExileClient_gui_toaster_addTemplateToast;
};
_availableHitpoints = (getAllHitPointsDamage _vehicle) select 0;
{
	if((_vehicle getHitPointDamage _x) > 0)exitWith
	{
		_fixable = "potato";
	};
}
forEach _availableHitpoints;

if (isNil "_fixable") exitWith 
{
	[
		"InfoTitleAndText", 
		["Repair Info", "This vehicle is already fully repaired"]
	] call ExileClient_gui_toaster_addTemplateToast;
}; 
if (!local _vehicle) then
{
	[
		"InfoTitleAndText", 
		["Repair Info", "Get in the driver seat first"]
	] call ExileClient_gui_toaster_addTemplateToast;
}
else 
{
	_equippedMagazines = magazines player;
	if ("Exile_Item_Foolbox" in _equippedMagazines) then
	{	
		if ("Exile_Item_Wrench" in _equippedMagazines) then
		{
			if ("Exile_Item_DuctTape" in _equippedMagazines) then
			{
				if ("Exile_Item_JunkMetal" in _equippedMagazines) then
				{
					

				
					player playMove "AinvPknlMstpSnonWnonDr_medic3";	
					player playMove "AinvPknlMstpSnonWnonDr_medic3";	
					sleep 20;
					if (_vehicle isKindOf "car")  then
					{	
						{
							_vehicle setHitPointDamage [_x,0];
						}	forEach _repairable;
					}						
					else
					{
						_vehicle setDamage + damage _vehicle - 0.2;
					};	
					player removeItem "Exile_Item_DuctTape";
					player removeItem "Exile_Item_JunkMetal";
					["Success",["Vehicle repaired"]] call ExileClient_gui_notification_event_addNotification;
						
								
				}
				else
				{
					[
						"InfoTitleAndText", 
						["Repair Info", "You need junkmetal to do that"]
					] call ExileClient_gui_toaster_addTemplateToast;
				};
			}
			else 
			{
				[
					"InfoTitleAndText", 
					["Repair Info", "You need duct tape to do that"]
				] call ExileClient_gui_toaster_addTemplateToast;
			};
		}
		else
		{
			[
				"InfoTitleAndText", 
				["Repair Info", "You need a wrench"]
			] call ExileClient_gui_toaster_addTemplateToast;
		};	
	}
	else
	{
		[
			"InfoTitleAndText", 
			["Repair Info", "You need a tool box"]
		] call ExileClient_gui_toaster_addTemplateToast;
	};
	
};
true