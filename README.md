# Cordova Facebook InviteAppLinks Plugin

Simple plugin that invite app with appLinkUrl and previewImageUrl through Facebook SDK.

Inviting app with appLinkUrl and previewImageUrl is something that could be done in JavaScript.

##Versions
Sample app is built and tested with Cordova 3.6.3 (Android and iOS) and we only support Cordova version > 3.0.

We currently tested FacebookSDK for following platforms and versions:

- [FacebookSDK iOS 4.2](https://developers.facebook.com/docs/ios/)

- [FacebookSDK Android 4.2](https://developers.facebook.com/docs/android/)

##Prerequisites

###iOS
Download the latest [FacebookSDK](https://developers.facebook.com/docs/ios/), and follow the [getting started guideline](https://developers.facebook.com/docs/ios/getting-started/).

The guideline is well documented and people at Facebook may change stuff in the future, so we stick to that instead of fancy cordova plugin hacks (well, cordova people also modify plugin flow too).

###Android

Unlike iOS, Android [getting started guideline](https://developers.facebook.com/docs/android/getting-started/) is pretty long and scary.


## Using
Clone the plugin

    $ git clone https://github.com/twirmhq/cordova-facebook-invites.git

Create a new Cordova Project

    $ cordova start exampleproj sidemenu
    
Install the plugin

    $ cd exampleproj
    $ cordova plugin add https://github.com/twirmhq/cordova-facebook-invites.git

##Usage

In [IOS Xcode Project](https://developers.facebook.com/docs/ios/getting-started#startcoding) 
Replace the openURL method in your AppDelegate.m (if already exists, add it otherwise) with the following code block

		#import <FBSDKCoreKit/FBSDKCoreKit.h>

		- (void)applicationDidBecomeActive:(UIApplication *)application {
		  [FBSDKAppEvents activateApp];
		}

		- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
		  return [[FBSDKApplicationDelegate sharedInstance] application:application
						  didFinishLaunchingWithOptions:launchOptions];
		}

		- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
		  return [[FBSDKApplicationDelegate sharedInstance] application:application
									openURL:url
							      sourceApplication:sourceApplication
								     annotation:annotation];
		}
    
Detaily for [IOS](https://developers.facebook.com/docs/ios/getting-started)

Detaily for [Android](https://developers.facebook.com/docs/android/getting-started)

Edit `www/js/app.js` and add the following code inside `ondeviceready`

```js

    inviteapplinks.appInvite("http://myapp.example.com/definition", "http://myapp.example.com/previewimg/preview.jpg", success, failure);
```

Install iOS or Android platform

    cordova platform add ios
    cordova platform add android
    
Run the code

    cordova run 

The plugin has the following methods:

* [canShow](#canShow)
* [appInvite](#appInvite)

***

###appInvite
triggers the App Invite Dialog with parameter- appLinkUrl and previewImageUrl

>####parameters

>> *appLinkUrl*: string: Your app linkurl.

>> *previewImageUrl*: string: Your previewimage url.

>> *successCallback*: function: If success, we return an string "true", else "false". 

>> *failureCallback*: function: Called with failure reason string.

###canShow
check if Facebook app is installed on the mobile

>####parameters

>>*successCallback*: function: Called with no params. If return value is 1, canShow, else disableShow. 

>>*failureCallback*: function: Called with failure reason string.


***

A simple example for canShow() and appInvite()

add canShow Buttoon in html body as following.


	``` <a href="#" class="btn" onclick="canShowButton();">canShow</a> ```



```js

	var success = function(message) {
		//If appInvite call  successes, code here.
		//...
		
	}

	var failure = function(message) {
		console.log("appInvite call failed with error: " + message);

		//If appInvite call fails, code here.
	}

	function canShowButton()
	{
		
		inviteapplinks.canShow(function( successmsg ){
			if (successmsg)  
			{
				//After canShow call, if successmsg is 1, canShow is true.
				inviteapplinks.appInvite("http://primenumber.parseapp.com/definition", "https://tctechcrunch2011.files.wordpress.com/2014/10/inbox-feature.jpg", success, failure);
			}
			else 
			{
				// elseif successmsg is 0, canShow is false.
				alert("Sorry, Cannot show!!!");
			}
				
		}, 
		function( errormsg ){
			//If canShow call failed, ...
			console.log("canShow call failed with error: " + errormsg);
		});
	}		

```

## More Info

For more information on setting up Cordova see [the documentation](http://cordova.apache.org/docs/en/4.0.0/guide_cli_index.md.html#The%20Command-Line%20Interface)

For more info on plugins see the [Plugin Development Guide](http://cordova.apache.org/docs/en/4.0.0/guide_hybrid_plugins_index.md.html#Plugin%20Development%20Guide)

For more info on plugins see the [Facebook Development Reference](https://developers.facebook.com/quickstarts/)





