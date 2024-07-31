#pragma newdecls required
#pragma semicolon 1
#pragma tabsize 4

/**
 * Description
 * @param timer		Timer handle.
 * @param pack		Data pack.
 */
static Action			Timer_ClearStack(Handle timer, DataPack pack)
{
	int					attacker;
	int					stackIdx;

	pack.Reset();
	attacker = pack.ReadCell();
	stackIdx = pack.ReadCell();
	g_eaClients[attacker].iaStack[stackIdx] = 0;
	return (Plugin_Continue);
}

Action					Hook_OnTakeDamage(int victim, int &attacker,
						int &inflictor, float &damage, int &damagetype,
						int &weapon, float damageForce[3],
						float damagePosition[3])
{
	int					dmg;
	int					stackIdx;
	DataPack			pack;

	dmg = RoundFloat(damage);
	if (0 < attacker && MaxClients >= attacker &&
	!IsFakeClient(attacker) && IsClientInGame(attacker))
	{
		stackIdx = GetFreeStackIndex(attacker);
		g_eaClients[attacker].iaStack[stackIdx] = dmg;
		CreateDataTimer(g_eHudConfig.holdTime + g_eHudConfig.fxTime,
		Timer_ClearStack, pack, TIMER_DATA_HNDL_CLOSE | TIMER_FLAG_NO_MAPCHANGE);
		pack.WriteCell(attacker, false);
		pack.WriteCell(stackIdx, false);
		SetHudTextParams(g_eHudConfig.x + g_eHudConfig.stackXOffset * stackIdx,
		g_eHudConfig.y + g_eHudConfig.stackYOffset * stackIdx,
		g_eHudConfig.holdTime, g_eHudConfig.r, g_eHudConfig.g,
		g_eHudConfig.b, g_eHudConfig.a, g_eHudConfig.effect,
		g_eHudConfig.fxTime, g_eHudConfig.fadeIn,
		g_eHudConfig.fadeOut);
		ShowHudText(attacker, -1, "-%i", dmg);
	}
	return (Plugin_Continue);
}