//
//  NSureLogDelegateTryCatch.h
//  nSure
//
//  ObjC helper that wraps a block in @try/@catch.
//  Swift cannot catch NSException -- this bridges the gap.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSureLogDelegateTryCatch : NSObject

/// Executes `block` inside @try/@catch. If an NSException is thrown,
/// `onException` is called instead of crashing.
+ (void)tryBlock:(void (NS_NOESCAPE ^)(void))block
     onException:(void (NS_NOESCAPE ^)(void))onException;

/// Same as `tryBlock:onException:` but passes the caught exception to
/// the handler so callers can include `name` / `reason` in their
/// error reporting. Use this for new code; the parameterless variant
/// stays for back-compat with existing call sites.
+ (void)tryBlock:(void (NS_NOESCAPE ^)(void))block
   onExceptionWithDetail:(void (NS_NOESCAPE ^)(NSException *exception))onException;

@end

NS_ASSUME_NONNULL_END
