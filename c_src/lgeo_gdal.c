/*
 *   Copyright (C) 2016 Duncan McGreggor.
 *
 *   Licensed under the Apache License, Version 2.0 (the "License");
 *   you may not use this file except in compliance with the License.
 *   You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 *   Unless required by applicable law or agreed to in writing, software
 *   distributed under the License is distributed on an "AS IS" BASIS,
 *   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *   See the License for the specific language governing permissions and
 *   limitations under the License.
 */

// http://gdal.org/1.11/gdal_8h.html
// http://gdal.org/1.11/gdal_tutorial.html

#include <arpa/inet.h>
#include <stdio.h>
#include <stdarg.h>
#include <string.h>

#include <gdal.h>

#include "erl_nif.h"


/* From https://github.com/iamaleksey/iconverl/blob/master/c_src/iconverl.c */
static int
load(ErlNifEnv *env, void **priv, ERL_NIF_TERM load_info)
{
    GDALAllRegister();
    return 0;
}

void
unload(ErlNifEnv* env, void* priv_data)
{
    // ?
}


/************************************************************************
 *
 *  GDALVersionInfo
 *
 ***********************************************************************/

static ERL_NIF_TERM
get_version_info(ErlNifEnv* env, int argc, const ERL_NIF_TERM argv[])
{
    char *psz_request;
    ERL_NIF_TERM eterm;

    if (argc != 1) {
        return enif_make_badarg(env);
    }

    unsigned len;
    if (!enif_get_list_length(env, argv[0], &len)){
        return enif_make_badarg(env);
    }
    psz_request = malloc(sizeof(char)*(len+1));

    if(!enif_get_string(env, argv[0], psz_request, len+1, ERL_NIF_LATIN1)) {
        return enif_make_badarg(env);
    }

    const char *version_info = GDALVersionInfo(psz_request);
    eterm = enif_make_string(env, version_info, ERL_NIF_LATIN1);
    free(psz_request);
    return enif_make_tuple2(env, enif_make_atom(env, "ok"), eterm);
}


static ErlNifFunc nif_funcs[] =
{
    {"get_version_info", 1, get_version_info}
};

ERL_NIF_INIT(lgeo_gdal, nif_funcs, &load, NULL, NULL, unload);
