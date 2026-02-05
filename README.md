# Objective-C
Follow the below steps to integrate the iOS library from source with an Objective-C project.

### Step 1: Add nSure SDK to your app using Cocoapod
If you haven’t already, install the latest version of CocoaPods.
```
  pod init
```
Add this line to your Podfile:
```
  pod 'nSure'
``` 
Run the following command:
```
  pod install
```
### Step 2: Initialize
Import “NSure.h” into AppDelegate.m, and initialize nSure within `application:didFinishLaunchingWithOptions:`

```objc
#import <nSure/nSure.h>

- (BOOL)application:(UIApplication *)applicationdidFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [NSure sharedInstanceWithAppID:@"iOS_OBJC_SAMPLE_APP_ID" partherID:@"PARTNER_ID"];
    
    // Optionally specify a custom configuration base URL
    [NSure sharedInstanceWithAppID:@"iOS_OBJC_SAMPLE_APP_ID"
                         partherID:@"PARTNER_ID"
                     configBaseUrl:@"https://custom-config-url.com"];
}
```
#### Initialization Parameters:

* **sharedInstanceWithAppID**  
  The application identifier provided by nSure.ai.
* **partnerID**  
  The partner identifier provided by nSure.ai. If no partner ID is provided, set this value to `nil`.
* **configBaseUrl**  
  An optional base URL used for DNS cloaking. This value will be provided by nSure.ai when applicable. If no value is provided, set this to `nil`.

### Step 3: Retrieve device id from the sdk
The sdk exposes a property "deviceId" on NSure.sharedInstance and one can use this property to retrieve the device id.

The merchant has to retrieve the device id from the sdk and pass it to the merchant's server. The merchant's server has to add this device id in every call to nSure servers. The request body should contain the device id under a property called sessionInfo. 
For example sessionInfo:
```json
{ "deviceId": "user-device-id" }
```
Objective-C property access:
```objc
NSure.sharedInstance.deviceId
```

---

# Swift
Follow the below steps to integrate the iOS library from source with an Swift project.

### Step 1: Add nSure SDK to your app
If you haven’t already, install the latest version of CocoaPods.
```
  pod init
```
Add this line to your Podfile:
```
  pod 'nSure'
``` 
Run the following command:
```
  pod install
```

### Step 2: Initialize
Import “nSure” module into AppDelegate.swift, and initialize nSure within `application:didFinishLaunchingWithOptions:`

```swift
import nSure
func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        NSure.sharedInstance(withAppID: "iOS_SWIFT_SAMPLE_APP_ID", partherID: "PARTNER_ID")
        
        // Optionally specify a custom configuration base URL
        NSure.sharedInstance(withAppID: "iOS_SWIFT_SAMPLE_APP_ID",
                             partherID: "PARTNER_ID",
                             configBaseUrl: "https://custom-config-url.com")
}
```
#### Initialization Parameters:

* **sharedInstanceWithAppID**  
  The application identifier provided by nSure.ai.
* **partnerID**  
  The partner identifier provided by nSure.ai. If no partner ID is provided, set this value to `nil`.
* **configBaseUrl**  
  An optional base URL used for DNS cloaking. This value will be provided by nSure.ai when applicable. If no value is provided, set this to `nil`.

### Step 3: Retrieve device id from the sdk
The sdk exposes a property "deviceId" on NSure.sharedInstance and one can use this property to retrieve the device id.

The merchant has to retrieve the device id from the sdk and pass it to the merchant's server. The merchant's server has to add this device id in every call to nSure servers. The request body should contain the device id under a property called sessionInfo. 
For example sessionInfo:
```json
{ "deviceId": "user-device-id" }
```
Swift property access:
```swift
NSure.sharedInstance.deviceId
```

---
