#pragma newdecls required
#pragma semicolon 1
#pragma tabsize 4

#define PLUGIN_NAME "Damage display"
#define PLUGIN_AUTHOR "exha"
#define PLUGIN_DESCRIPTION "Display damage dealt in real-time."
#define PLUGIN_VERSION "1.0.0"
#define PLUGIN_URL ""

#include <sourcemod>
#include <sdkhooks>
#include "hud.sp"
#include "client.sp"
#include "hook.sp"

public Plugin			myinfo =
{
	name = PLUGIN_NAME,
	author = PLUGIN_AUTHOR,
	description = PLUGIN_DESCRIPTION,
	version = PLUGIN_VERSION,
	url = PLUGIN_URL
}

public void				OnPluginStart()
{
	LoadHudConfig();
}

public void				OnClientPutInServer(int client)
{
	ResetClient(client);
	SDKHook(client, SDKHook_OnTakeDamage, Hook_OnTakeDamage);
}

public void				OnClientDisconnect(int client)
{
	SDKUnhook(client, SDKHook_OnTakeDamage, Hook_OnTakeDamage);
}