// ==WindhawkMod==
// @id              disable-dwm-extended-frames
// @name            Disable DWM Extended Frames
// @description     Disables DwmExtendFrameIntoClientArea and related functions.
// @version         0.1
// @author          Taniko Yamamoto
// @github          https://github.com/YukisCoffee
// @twitter         https://twitter.com/kirasicecreamm

// @include         explorer.exe
// @include         mblctr.exe
// @include         palemoon.exe
// @include         *
// @include         CalcPlus.exe

// @exclude         VSCodium.exe
// @exclude         Discord.exe
// @exclude         wmplayer.exe
// @exclude         ApplicationFrameHost.exe
// @exclude         ResourceHacker.exe
// @exclude         simpress.exe
// @exclude         soffice.bin
// @exclude         musescore.exe

// ==/WindhawkMod==

// ==WindhawkModReadme==
/*
# Disable DWM Extended Frames

This script disables `DwmExtendFrameIntoClientArea` and related functions,
which helps some Windows programs render correctly with the Basic theme
enabled.

This should only be used along with something like BasicThemer3, as it will
cause problems for programs that are able to use DWM frames.
*/
// ==/WindhawkModReadme==

#include <dwmapi.h>

// For some reason, this isn't guaranteed to be imported. At least the mingw64 version of
// dwmapi.h doesn't define this, but the value seems to be constant so idk I'll just define
// it myself:
#ifndef DWM_E_COMPOSITIONDISABLED
    #define DWM_E_COMPOSITIONDISABLED 0x80263001
#endif

// Evil C preprocessor abuse :troll:
// I could have made this an inline function realistically, but it's nicer
// to make it as short as possible and make the most assumptions possible.
// Here be dragons:
#pragma region "YukisCoffee's preprocessor helpers for Windhawk"
    #define YcTokenConcatInternal(x, y) x ## y
    #define YcTokenConcat(x, y) YcTokenConcatInternal(x, y)

    #define YcSimpleFunctionHook(LIBRARY, FUNCTION)                 \
        FARPROC YcTokenConcat(p, FUNCTION) = GetProcAddress(        \
            LIBRARY,                                                \
            #FUNCTION                                               \
        );                                                          \
                                                                    \
        if (!YcTokenConcat(p, FUNCTION))                            \
        {                                                           \
            Wh_Log(L"Failed to get address of " #FUNCTION);         \
            return FALSE;                                           \
        }                                                           \
                                                                    \
        if (!Wh_SetFunctionHook(                                    \
            (void *)YcTokenConcat(p, FUNCTION),                     \
            (void *)YcTokenConcat(FUNCTION, _hook),                 \
            (void **)&YcTokenConcat(FUNCTION, _orig)                \
        )) Wh_Log("Failed to hook function " #FUNCTION)
#pragma endregion

#pragma region "DWM hooks"
    typedef HRESULT (*DwmIsCompositionEnabled_t)(OUT BOOL *pfEnabled);
    DwmIsCompositionEnabled_t DwmIsCompositionEnabled_orig;
    HRESULT DwmIsCompositionEnabled_hook(BOOL *pfEnabled)
    {
        HRESULT result = DwmIsCompositionEnabled_orig(pfEnabled);

        if (S_OK == result)
        {
            *pfEnabled = FALSE;
        }

        return result;
    }

    typedef HRESULT (*DwmExtendFrameIntoClientArea_t)(HWND, const MARGINS *);
    DwmExtendFrameIntoClientArea_t DwmExtendFrameIntoClientArea_orig;
    HRESULT DwmExtendFrameIntoClientArea_hook(HWND hWnd, const MARGINS *pMarInset)
    {
        return DWM_E_COMPOSITIONDISABLED;
    }

    typedef HRESULT (*DwmEnableBlurBehindWindow_t)(HWND, const DWM_BLURBEHIND *);
    DwmEnableBlurBehindWindow_t DwmEnableBlurBehindWindow_orig;
    HRESULT DwmEnableBlurBehindWindow_hook(HWND hWnd, const DWM_BLURBEHIND *pBlurBehind)
    {
        return DWM_E_COMPOSITIONDISABLED;
    }

    typedef HRESULT (WINAPI *DwmSetWindowAttribute_t)(HWND, DWORD, LPCVOID, DWORD);
    DwmSetWindowAttribute_t DwmSetWindowAttribute_orig;
    HRESULT WINAPI DwmSetWindowAttribute_hook(HWND hWnd, DWORD dwAttribute, LPCVOID pvAttribute, DWORD cbAttribute)
    {
        if (dwAttribute != DWMWA_EXTENDED_FRAME_BOUNDS)
        {
            if (
                (dwAttribute > 15) &&
                (dwAttribute != 65537)
                )
            {
                Wh_Log(L"SWA:    %i\r\n", dwAttribute);
            }

            return DwmSetWindowAttribute_orig(hWnd, dwAttribute, pvAttribute, cbAttribute);
        }
        else
        {
            Wh_Log(L"SWA:    DWMWA_EXTENDED_FRAME_BOUNDS\r\n");
            return S_OK;
        }
    };
#pragma endregion

struct WINCOMPATTRDATA
{
    int nAttribute;
    PVOID pData;
    ULONG ulDataSize;
};

typedef BOOL (WINAPI *SetWindowCompositionAttribute_t)(HWND, WINCOMPATTRDATA *);
SetWindowCompositionAttribute_t SetWindowCompositionAttribute_orig;
BOOL WINAPI SetWindowCompositionAttribute_hook(HWND hWnd, WINCOMPATTRDATA *data)
{
    if (data->nAttribute == 19)
    {
        return TRUE;
    }
    else
    {
        return SetWindowCompositionAttribute_orig(hWnd, data);
    }
}

typedef BOOL (WINAPI *IsCompositionActive_t)(void);
IsCompositionActive_t IsCompositionActive_orig;
BOOL WINAPI IsCompositionActive_hook()
{
    return FALSE;
}

// Windhawk insertion point function:
BOOL Wh_ModInit()
{
    Wh_Log(L"Initialising DisableDwmExtendFrame");

    HMODULE dwmapiModule = LoadLibrary(L"dwmapi.dll");

    if (!dwmapiModule)
    {
        Wh_Log(L"Failed to load dwmapi.dll");
        return FALSE;
    }

    HMODULE user32Module = LoadLibrary(L"user32.dll");

    if (!user32Module)
    {
        Wh_Log(L"Failed to load user32.dll");
        return FALSE;
    }

    HMODULE uxthemeModule = LoadLibrary(L"uxtheme.dll");

    if (!uxthemeModule)
    {
        Wh_Log(L"Failed to load uxtheme.dll");
        return FALSE;
    }
    YcSimpleFunctionHook(dwmapiModule, DwmExtendFrameIntoClientArea);
    YcSimpleFunctionHook(dwmapiModule, DwmIsCompositionEnabled);
    YcSimpleFunctionHook(dwmapiModule, DwmEnableBlurBehindWindow);
    YcSimpleFunctionHook(dwmapiModule, DwmSetWindowAttribute);

    YcSimpleFunctionHook(user32Module, SetWindowCompositionAttribute);

    YcSimpleFunctionHook(uxthemeModule, IsCompositionActive);

    return TRUE;
}

// The mod is being unloaded, free all allocated resources.
void Wh_ModUninit()
{
    Wh_Log(L"Unloading DisableDwmExtendFrame");
}

// Since no settings are supported, this is just a stub.
void Wh_ModSettingsChanged() {}
