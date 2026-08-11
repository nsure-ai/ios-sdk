//
//  NSureCrashRuntime.h
//  nSure
//
//  Small crash-runtime surface that still belongs to NSure after replacing
//  the custom crash reporter with KSCrash.
//

#ifndef NSureCrashRuntime_h
#define NSureCrashRuntime_h

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define NSURE_TRY \
    @try {

#define NSURE_CATCH \
    } @catch (NSException *nsureEx) {                                  \
        NSLog(@"[NSureCrash] caught public-API exception: %@ "         \
              @"reason=%@ userInfo=%@",                                \
              nsureEx.name, nsureEx.reason, nsureEx.userInfo);         \
    } @catch (id nsureUnk) {                                           \
        NSLog(@"[NSureCrash] caught non-NSException object "           \
              @"in public API: %@", nsureUnk);                         \
    }

@protocol NSureCrashSubsystemHooks <NSObject>
- (void)checkVersionRecovery;
- (void)markPreviousLaunchCrashedIfNeeded;
- (void)bumpLaunchCounter;
- (BOOL)isInSafeMode;
- (void)emitSafeModeEvent;
- (void)markSDKDisabled;
- (void)snapshotBinaryImages;
- (BOOL)initFastWriter;
- (void)deliverPendingCrashes;
- (BOOL)installCrashHandlers;
- (void)uninstallCrashHandlers;
- (void)emitAppInitDone;
@end

const char * _Nullable NSureCrashAppIdBridge_currentAppId(void);

/// Publish appId UTF-8 bytes into the signal-safe cache. Strdup'd; pass nil to clear.
void NSureCrashAppIdBridge_publishCurrentAppId(NSString * _Nullable appId);

/// Silent device-id accessor for the crash-delivery path. Returns the
/// UTF-8 device id if the shared NSure instance exists, NULL otherwise.
/// Unlike +[NSure sharedInstance], this never emits a warning when
/// called before +sharedInstanceWithAppID: — next-launch crash delivery
/// can legitimately run before the host app re-initializes the SDK.
const char * _Nullable NSureCrashDeviceIdBridge_currentDeviceId(void);

/// Publish deviceId UTF-8 bytes into the signal-safe cache. Strdup'd; pass nil to clear.
void NSureCrashDeviceIdBridge_publishCurrentDeviceId(NSString * _Nullable deviceId);

/// Async-signal-safe partner-id bridge: returns the cached UTF-8 bytes
/// published at SDK init, or NULL if unset.
const char * _Nullable NSureCrashPartnerIdBridge_currentPartnerId(void);

/// Publish partnerId UTF-8 bytes into the signal-safe cache. Strdup'd; pass nil to clear.
void NSureCrashPartnerIdBridge_publishCurrentPartnerId(NSString * _Nullable partnerId);

NS_ASSUME_NONNULL_END

#endif /* NSureCrashRuntime_h */
