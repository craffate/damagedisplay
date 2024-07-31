#pragma newdecls required
#pragma semicolon 1
#pragma tabsize 4

#if !defined CLIENT_MAX_STACK_SIZE
	#define CLIENT_MAX_STACK_SIZE 20
#endif

enum struct				Client
{
	int					iaStack[CLIENT_MAX_STACK_SIZE];
}

Client					g_eaClients[MAXPLAYERS + 1];

/**
 * Reset a client information.
 * @param client	Client index to reset.
 */
void					ResetClient(const int client)
{
	int					stack[CLIENT_MAX_STACK_SIZE];

	g_eaClients[client].iaStack = stack;
}

/**
 * Get an free index from a client stack.
 * @param client	Client index.
 * @return  An index for the client stack that can be used for
 * displaying a game_text point entity.
 */
int						GetFreeStackIndex(const int client)
{
	int					ret;

	ret = CLIENT_MAX_STACK_SIZE - 1;
	while (-1 < ret && 0 < g_eaClients[client].iaStack[ret])
	{
		ret -= 1;
	}
	if (0 > ret)
	{
		ret = CLIENT_MAX_STACK_SIZE - 1;
	}
	return (ret);
}