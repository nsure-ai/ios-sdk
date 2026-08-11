//
//  NSure
//
//  Copyright © 2021 nSure. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <nSure/NSureLogDelegateTryCatch.h>

@interface NSure : NSObject

/*!
 Returns (and creates, if needed) a singleton instance of the API.
 
 This method will return a singleton instance of the <code>nSure</code> class for
 you using the given app ID.

 @param appId   your app ID
 @param partherID   Optional  parther ID
 */
+ (nonnull NSure*)sharedInstanceWithAppID:(NSString *_Nonnull)appId partherID:(NSString *_Nullable)partherID;


/*!
 Returns (and creates, if needed) a singleton instance of the API.
 
 This method will return a singleton instance of the <code>nSure</code> class for
 you using the given app ID.

 @param appId   your app ID
 */
+ (nonnull NSure*)sharedInstanceWithAppID:(NSString *_Nonnull)appId;

/**
 Returns (and creates, if needed) a singleton instance of the API.
 
 This method will return a singleton instance of the <code>nSure</code> class for
 you using the given app ID and configuration base URL.

 @param appId         your app ID
 @param partherID     Optional  parther ID
 @param configBaseUrl Optional configuration base URL to override the default API endpoint
 */
+ (nonnull NSure*)sharedInstanceWithAppID:(NSString * _Nonnull)appId
                               partherID:(NSString * _Nullable)partherID
                           configBaseUrl:(NSString * _Nullable)configBaseUrl;

/*!
 *  Returns a previously instantiated singleton instance.
 */
+ (nullable NSure*)sharedInstance;

/**
 *  Returns the nSure device ID.
 */
@property (nonatomic, strong, readonly) NSString * _Nonnull deviceId;

/*!
 *  Returns the nSure SDK version.
 */
@property (nonatomic, readonly) NSString * _Nonnull version;

+ (NSString *_Nonnull)sdkVersion;
+ (NSString *_Nonnull)partnerId;

/// Seconds elapsed since the SDK class was loaded (mach_absolute_time based).
+ (double)timeSinceAppStart;

/// Duration of the synchronous portion of SDK init, in milliseconds.
/// Returns 0 if init has not completed yet.
+ (int64_t)sdkInitDurationMs;

/// Test-only helper that intentionally crashes from inside the SDK so the
/// crash reporter can be validated end-to-end.
- (void)simulateSDKCrashForTesting;

@end
