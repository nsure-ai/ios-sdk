//
//  NSureKSCrashBridge.h
//  nSure
//
//  Objective-C shim around the vendored KSCrash target. Lives in the
//  nSure_Private framework submodule (nSure.private.modulemap), reachable
//  from in-framework Swift via `import nSure_Private`. Not part of the
//  public umbrella; host apps that `#import <nSure/NSure.h>` do not see it.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSureKSCrashBridge : NSObject

+ (BOOL)install;
+ (BOOL)installWithUserInfo:(NSDictionary<NSString *, id> *)userInfo NS_SWIFT_NAME(install(userInfo:));
+ (void)setUserInfo:(NSDictionary<NSString *, id> *)userInfo NS_SWIFT_NAME(setUserInfo(_:));
+ (NSArray<NSDictionary<NSString *, id> *> *)pendingReports;
+ (void)deleteReportWithID:(NSNumber *)reportID;
+ (void)cleanupOrphanedRunSidecars;
+ (void)noteRemoteConfigDisabledAfterInstall;

// Kill-switch epoch: marks the time remote config disabled crash reporting
// mid-run. KSCrash cannot uninstall monitors until process restart, so any
// report captured after this epoch must be dropped on next-launch delivery.
// Epoch is `[NSDate timeIntervalSinceReferenceDate]`. 0 means not disabled.
+ (void)markCrashReportingDisabledAtEpoch:(NSTimeInterval)epoch;
+ (NSTimeInterval)crashReportingDisabledAtEpoch;
+ (void)clearCrashReportingDisabledAtEpoch;

@end

NS_ASSUME_NONNULL_END
