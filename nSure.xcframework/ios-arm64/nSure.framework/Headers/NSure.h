//
//  NSure
//
//  Copyright © 2021 nSure. All rights reserved.
//

#import <UIKit/UIKit.h>

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

@end

