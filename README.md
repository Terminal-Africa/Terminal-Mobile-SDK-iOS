# TShipSDK

SDK to make TShip API integration for iOS developers easier.

## Creating and Getting TShipSDK Instance

To create an instance of `TShipSDK` you call the `TShipSDK.createInstance(secretKey: String)` method which takes your Secret Key which can be found in the Api Keys section of the settings tab on the [Terminal dashboard](https://app.terminal.africa/) -> Api Keys. The `createInstance` method returns the new instance created.

This method will create a static instance of the `TShipSDK` that can be accessed through the `TShipSDK.instance` property. The `TShipSDK.instance` is optional and will be nil until it is created. 

Since the instance is static it would be best to call `createInstance` in your AppDelegate so you can retrieve the instance with `TShipSDK.instance` anywhere in your app.
