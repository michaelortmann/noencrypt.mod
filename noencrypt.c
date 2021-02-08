/*
 * noencrypt.c - no encryption of passwords
 */
 
#define MAKING_NOENCRYPT
#define MODULE_NAME "encryption" /* allegdedly ;) */
#include "../module.h"
#include <stdlib.h>

#undef global
static Function * global = NULL;

static int noencrypt_expmem()
{
   int size = 0;
   return size;
}

/* a report on the module status */
static void noencrypt_report (int idx, int details)
{
   Context;
   if (details) {
     dprintf(idx, "    NULL encryption module\n");
     dprintf(idx, "    Passwords are stored in clear text!\n");
   }
}

static char *noencrypt_close()
{
   return "You can't unload an encryption module";
}

static void encrypt_pass (char * text, char * new)
{
strcpy(new, text);
}

char *noencrypt_start ();

static Function noencrypt_table[] =
{
   (Function) noencrypt_start,
   (Function) noencrypt_close,
   (Function) noencrypt_expmem,
   (Function) noencrypt_report,
};

char *noencrypt_start (Function * global_funcs)
{
   if (global_funcs) {
      global = global_funcs;
      if (!module_rename("noencrypt",MODULE_NAME))
        return "Already loaded.";
      Context;
      module_register(MODULE_NAME, noencrypt_table, 1, 5);
      if (!module_depend(MODULE_NAME, "eggdrop", 108, 4)) {
        module_undepend(MODULE_NAME);
        return "This module requires Eggdrop 1.8.4 or later.";
      }
      add_hook(HOOK_ENCRYPT_PASS, (Function) encrypt_pass);
      }
   return NULL;
}
