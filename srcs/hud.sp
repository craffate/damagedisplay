#pragma newdecls required
#pragma semicolon 1
#pragma tabsize 4

enum struct				HudConfig
{
	float				x;
	float				y;
	float				holdTime;
	int					r;
	int					g;
	int					b;
	int					a;
	int					effect;
	float				fxTime;
	float				fadeIn;
	float				fadeOut;
	float				stackXOffset;
	float				stackYOffset;
}

HudConfig				g_eHudConfig;

/**
 * Load HUD configuration.
 */
void					LoadHudConfig()
{
	g_eHudConfig.x = 0.55;
	g_eHudConfig.y = 0.0;
	g_eHudConfig.holdTime = 1.0;
	g_eHudConfig.r = 0;
	g_eHudConfig.g = 0;
	g_eHudConfig.b = 255;
	g_eHudConfig.a = 0;
	g_eHudConfig.effect = 0;
	g_eHudConfig.fxTime = 1.0;
	g_eHudConfig.fadeIn = 0.1;
	g_eHudConfig.fadeOut = 0.1;
	g_eHudConfig.stackXOffset = 0.0;
	g_eHudConfig.stackYOffset = -0.025;
}