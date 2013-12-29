
#include "SDL_config.h"

#ifdef __ANDROID__

/* Include the SDL main definition header */
#include "SDL_main.h"

/*******************************************************************************
                 Functions called by JNI
*******************************************************************************/
#include <jni.h>

/* Called before SDL_main() to initialize JNI bindings in SDL library */
extern void SDL_Android_Init(JNIEnv* env, jclass cls);

/* Start up the SDL app */
void Java_org_libsdl_app_SDLActivity_nativeInit(JNIEnv* env, jclass cls, jobject obj)
{
    /* This interface could expand with ABI negotiation, calbacks, etc. */
    SDL_Android_Init(env, cls);

    SDL_SetMainReady();

    /* get argument from SDLMain in SDLActivity.java */
    jboolean isCopy;
    const char* str = (*env)->GetStringUTFChars(env, obj, &isCopy);

    /* Run the application code! */
    int status;
    int argc;

    if (SDL_strlen(str) > 0)
    	argc = 2;
    else
        argc = 1;

    /* assemble argv depending on whether we have an argument or not */
    char *argv[argc + 1];
    argv[0] = SDL_strdup("SDL_app");
    if (SDL_strlen(str) > 0)
    	argv[1] = SDL_strdup(str);
    argv[argc] = NULL;

    if (isCopy == JNI_TRUE)
    	(*env)->ReleaseStringUTFChars(env, obj, str);

    status = SDL_main(argc, argv);

    /* Do not issue an exit or the whole application will terminate instead of just the SDL thread */
    /* exit(status); */
}

#endif /* __ANDROID__ */

/* vi: set ts=4 sw=4 expandtab: */