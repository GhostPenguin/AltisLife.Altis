/*
** Author: [Your Name]
** Description: Makes the player jump when pressing the "space" key.
*/

fnc_jump = {
    private _player = _this select 0;

    // Check if the player is on the ground
    if (surfaceIsWater (getPos _player)) exitWith {
        hint "Can't jump in water!";
    };
    
    if (_player getPos [0, 0, -1] select 2 < 0.5) then {
        // Apply jump effect
        _player setVelocity [0, 0, 5]; // Adjust the Z velocity to simulate the jump height
        _player playMoveNow "AovrPercMstpslowWrflDf_ver1";
    };
};

// Add event handler to listen for the "space" key press
player addEventHandler ["KeyDown", {
    params ["_unit", "_key"];

    // 57 is the code for the "space" key
    if (_key isEqualTo 57) then {
        [_unit] call fnc_jump;
    };
}];