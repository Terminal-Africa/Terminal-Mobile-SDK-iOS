# TShipSDK :ship: :nigeria:

## Table of Contents
1. [Overview](#overview)
2. [Why TShip?](#why-tship)
3. [Features](#features)
4. [Getting Started](#getting-started)
5. [Addresses](#addresses)
6. [Miscellanous](#miscellanous)
6. [Packaging](#packaging)
7. [Request Builders](#request-builders)
8. [Models](#models)

## Overview
The TShip SDK was built on top of the TShip API to make integrating the TShip API in your App easier. The TShip API is a JSON API that provides a single interface for integrating Nigerian shipping carriers such as DHL, Gokada, Sendbox with your applications. The API allows anyone to programatically get shipping rates and arrange pickup and delivery for a parcel. The TShip SDK enables you to easily do all of this in your iOS App. To use the TShip SDK, you need to [create an account on the Terminal website](https://app.terminal.africa/sign-up) and retrieve a Secret Key in your settings. 

#### Technology
TShip aggrevates multiple Shipment carriers operating in Nigeria, e.g. Gokada, Kwik, Sendbox, DHL Express and UPS. We've abstracted integration of the mentioned shipping carriers into a single interface, to provide an easy channel for anyone to build shipping into their products.

In the future, we hope to expand our partnerships to include other shipping carriers outside Africa.

## Why TShip?
We've spent a lot of time building several tools for businesses in the eCommerce space in Nigeria and always found it difficult to build shipping into our apps. Setting up an account with a logistics company in Nigeria still requires individuals to have registered businesses and also provide a lot of documentation. Many businesses in the region, also tend to use a combination of carriers for local and international deliveries, so the set up process can get exhausting. 

For developers with access, you also have to navigate through legacy API systems with often poorly written documentation to build shipping into your apps. We went through that and decided to make it a lot easier for other developers, this is why we created TShip.

Through TShip, developers have a gateway to leading logistics partners on the continent via a single interface, removing the need for unnesseccary documentation and allowing them to focus on what they do best, building great products for the ecosystem.

## Features
This section describes the core features available through the Shipmonk API.

- **Get Live Shipping Rates**:
Get live shipping rates for any of Shipmonk's carrier partners including DHL Express, Gokada, Kwik, Sendbox and UPS. Shipmonk will also provide information about pickup dates and delivery times for each rate request.

- **Arrange Pickup & Delivery**:
Arrange pickup and delivery for your parcels with a single API call. The API call also allows you to specify the type of vehicle needed for the shipment as well as indicate how much assistance you might need to load a large parcel. In the future, Shipmonk will also allow you to schedule shipment requests with our respective carrier partners.

- **Track Shipments**:
Shipmonk provides an endpoint for tracking any shipment arranged via the API. We also include links to specific carrier tracking pages with each request.

- **Manage Packaging**:
You can create and maintain information about the different types of packaging you use for preparing your parcels. In the future, shipmonk will allow you to access packaging informatin from our carrier partners.

## Getting Started

To use the TShip SDK, you will need to create an instance of the `TShipSDK` class by calling the `TShipSDK.createInstance(secretKey: String)` method which takes your Secret Key which can be found in the Api Keys section of the settings tab on the [Terminal dashboard](https://app.terminal.africa/) -> Api Keys. The `createInstance` method returns the new instance created.

This method will create a static instance of the `TShipSDK` that can be accessed through the `TShipSDK.instance` property. The `TShipSDK.instance` is optional and will be nil until it is created. 

Since the instance is static it would be best to call `createInstance` in your AppDelegate so you can retrieve the instance with `TShipSDK.instance` anywhere in your app.

## Addresses

Here you'll find information on how to create, update, fetch and validate addresses.

### Create Address

```
TShipSDK.createAddress(
    request: [String: Any], 
    runCompletionOnUIThread: Bool = true, 
    completion: @escaping(Result<Address, Error>) -> Void
)
```

##### Description

This function creates an Address on the TShip API.

##### Parameters

`request: [String: Any]`

Request body with details used to create Address. You'll build the request with the [AddressRequestBuilder](#addressrequestbuilder).

`runCompletionOnUIThread: Bool = true`

Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.

`completion: @escaping(Result<Address, Error>) -> Void`

The completion handler to call, passing along the response status and the newly created [Address](#address) if no error occurred.

### Get Address

```
TShipSDK.getAddress(
    request: [String: Any], 
    runCompletionOnUIThread: Bool = true, 
    completion: @escaping(Result<Address, Error>) -> Void
)
```

##### Description

This function fetches details of an Address on the TShip API.

##### Parameters

`addressId: String`

Unique id used to identify the address.

`runCompletionOnUIThread: Bool = true`

Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.

`completion: @escaping(Result<Address, Error>) -> Void`

The completion handler to call, passing along the response status and the [Address](#address), if no error occurred.

### Get Addresses

```
TShipSDK.getAddresses(
    request: [String: Any],
    runCompletionOnUIThread: Bool = true,
    completion: @escaping(Result<GetAddressResponseData, Error>) -> Void
)
```

##### Description

This function fetches Addresses previously created on the TShip API.

##### Parameters

`request: [String: Any]`

Should contain the query parameters for paginating through the Addresses. This should be created with the PaginatedRequestBuilder class.

`runCompletionOnUIThread: Bool = true`

Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.

`completion: @escaping(Result<Address, Error>) -> Void`

The completion handler to call, passing the response status alongside the [GetAddressResponseData](#getaddressresponsedata) which contains the paginated [Address](#address), if no error occurred.

### Update Address

```
TShipSDK.updateAddress(
    addressId: String,
    request: [String: Any], 
    runCompletionOnUIThread: Bool = true, 
    completion: @escaping(Result<Address, Error>) -> Void
)
```

##### Description

This function updates an Address previously created on the TShip API.

##### Parameters

`addressId: String`

Unique id used to identify the address.

`request: [String: Any]`

Request body with details used to create Address. You'll build the request with the [AddressRequestBuilder](#addressrequestbuilder). Please note that the address zip code which you can add to builder using the `.withZipCode(_ zipCode: String)` function is required to update an address.

`runCompletionOnUIThread: Bool = true`

Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.

`completion: @escaping(Result<Address, Error>) -> Void`

The completion handler to call, passing along the response status and the newly created [Address](#address) if no error occurred.

## Miscellanous

Here you'll find information about miscellanous remote operations you can make that support other operations.

### Get Valid Cities

```
getValidCities(
    request: [String: Any], 
    runCompletionOnUIThread: Bool = true, 
    completion: @escaping(Result<[City], Error>) -> Void)
```

##### Description

This function fetches all the cities within a state valid on the TShip API.

##### Parameters

`request: [String: Any]`

Request body with country and code for states to get. You'll build the request with the [CityOrStateRequestBuilder](#cityorstaterequestbuilder).

`runCompletionOnUIThread: Bool = true`

Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.

`completion: @escaping(Result<[City], Error>) -> Void`

The completion handler to call, passing along the response status and the array of all valid [City](#city)s if no error occurred.

### Get Valid Countries

```
getValidCountries(
    runCompletionOnUIThread: Bool = true, 
    completion: @escaping(Result<[Country], Error>) -> Void)
```

##### Description

This function all the countries valid on the TShip API.

##### Parameters

`runCompletionOnUIThread: Bool = true`

Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.

`completion: @escaping(Result<[Country], Error>) -> Void`

The completion handler to call, passing along the response status and the array of all valid [Country](#country)s if no error occurred.

### Get Valid States

```
getValidStates(
    request: [String: Any], 
    runCompletionOnUIThread: Bool = true, 
    completion: @escaping(Result<[State], Error>) -> Void)
```

##### Description

This function all the countries valid on the TShip API.

##### Parameters

`request: [String: Any]`

Request body with country code for states to get. You'll build the request with the [CityOrStateRequestBuilder](#cityorstaterequestbuilder).

`runCompletionOnUIThread: Bool = true`

Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.

`completion: @escaping(Result<[Country], Error>) -> Void`

The completion handler to call, passing along the response status and the array of all valid [State](#state)s if no error occurred.

## Packaging

Here you'll find information on how to create, update and fetch Packaging.

### Create Packaging

```
createPackaging(
    request: PackagingRequest, 
    runCompletionOnUIThread: Bool = true, 
    completion: @escaping(Result<Packaging, Error>) -> Void)
```

##### Description

This function creates a Packaging on the TShip API.

##### Parameters

`request: PackagingRequest`

Request body with details used to create a Packaging. All the parameters that are available to add to the [PackagingRequest](#packagingrequest) class are required to create a Packaging

`runCompletionOnUIThread: Bool = true`

Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.

`completion: @escaping(Result<Packaging, Error>) -> Void`

The completion handler to call, passing along the response status and the newly created [Packaging](#packaging) if no error occurred.

### Get Packaging

```
getPackaging(
    packagingId: String, 
    runCompletionOnUIThread: Bool = true, 
    completion: @escaping(Result<Packaging, Error>) -> Void)
```

##### Description

This function fetches details of a Packaging previously created on the TShip API.

##### Parameters

`packagingId: String`

Unique id used to identify the packaging

`runCompletionOnUIThread: Bool = true`

Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.

`completion: @escaping(Result<Packaging, Error>) -> Void`

The completion handler to call, passing along the response status and the [Packaging](#packaging) if no error occurred.

### Get Multiple Packaging

```
getMultiplePackaging(
    request: [String: Any], 
    runCompletionOnUIThread: Bool = true, 
    completion: @escaping(Result<Packaging, Error>) -> Void)
```

##### Description

This function fetches the list of Packaging previously created on the TShip API.

##### Parameters

`request: [String: Any]`

Should contain the query parameters for paginating through the Packaging. This should be created with the PaginatedRequestBuilder class.

`runCompletionOnUIThread: Bool = true`

Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.

`completion: @escaping(Result<Packaging, Error>) -> Void`

The completion handler to call, passing the response status alongside the [GetMultiplePackagingResponseData](#getmultiplepackagingresponsedata) which contains the paginated Packaging, if no error occurred.

### Update Packaging

```
updatePackaging(
    packagingId: String,
    request: PackagingRequest, 
    runCompletionOnUIThread: Bool = true, 
    completion: @escaping(Result<Packaging, Error>) -> Void)
```

##### Description

This function fetches the list of Packaging previously created on the TShip API.

##### Parameters

`packagingId: String`

Unique id used to identify the packaing.

`request: PackagingRequest`

Request body with details used to update a Packaging.

`runCompletionOnUIThread: Bool = true`

Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.

`completion: @escaping(Result<Packaging, Error>) -> Void`

The completion handler to call, passing along the response status and the updated [Packaging](#packaging), if no error occurred.

## Parcels

Here you'll find information on how to create, update and fetch Parcels.

### Create Parcels

```
createParcel<T: Codable>(
    metadataType: T.Type = EmptyMetadata.self,
    request: ParcelRequest<T>, 
    runCompletionOnUIThread: Bool = true, 
    completion: @escaping(Result<Parcel<T>, Error>) -> Void)
```

##### Description

This function creates a Parcel on the TShip API.

##### Parameters

`metadataType: T.Type = EmptyMetadata.self`

The metatype of the metadata model struct/class attached to the Parcel. You can omit this value if you don't want to attach metadata to the Parcel. The default type of the metadata is EmptyMetadata.self, [EmptyMetadata](#emptymetadata) being an empty struct.

`request: PackagingRequest`

Request body with details used to create a Parcel. All the parameters that are available to add to the [ParcelRequest](#parcelrequest) class are required to create a Parcel.

`runCompletionOnUIThread: Bool = true`

Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.

`completion: @escaping(Result<Parcel<T>, Error>) -> Void`

The completion handler to call, passing along the response status and the newly created [Parcel](#parcel) if no error occurred.

### Get Parcel

```
getParcel(
    metadataType: T.Type = EmptyMetadata.self,
    packagingId: String, 
    runCompletionOnUIThread: Bool = true, 
    completion: @escaping(Result<Parcel<T>, Error>) -> Void)
```

##### Description

This function fetches details of a Parcel previously created on the TShip API.

##### Parameters

`metadataType: T.Type = EmptyMetadata.self`

The metatype of the metadata model struct/class attached to the Parcel. You can omit this value if you don't want to attach metadata to the Parcel. The default type of the metadata is EmptyMetadata.self, [EmptyMetadata](#emptymetadata) being an empty struct.

`parcelId: String`

Unique id used to identify the parcel

`runCompletionOnUIThread: Bool = true`

Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.

`completion: @escaping(Result<Parcel<T>, Error>) -> Void`

The completion handler to call, passing along the response status and the [Parcel](#parcel) if no error occurred.

### Get Parcels

```
getParcels(
    metadataType: T.Type = EmptyMetadata.self,
    request: [String: Any], 
    runCompletionOnUIThread: Bool = true, 
    completion: @escaping(Result<GetParcelsResponseData<T>, Error>) -> Void)
```

##### Description

This function fetches Parcels previously created on the TShip API.

##### Parameters

`metadataType: T.Type = EmptyMetadata.self`

The metatype of the metadata model struct/class attached to the Parcel. You can omit this value if you don't want to attach metadata to the Parcel. The default type of the metadata is EmptyMetadata.self, [EmptyMetadata](#emptymetadata) being an empty struct.

`request: [String: Any]`

Should contain the query parameters for paginating through the Parcels. This should be created with the [PaginatedRequestBuilder](#paginatedrequestbuilder) class.

`runCompletionOnUIThread: Bool = true`

Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.

`completion: @escaping(Result<GetParcelsResponseData<T>, Error>) -> Void`

The completion handler to call, passing along the response status alongside the [GetParcelsResponseData](#getparcelsresponsedata) which contains the paginated Parcels, if no error occurred.

### Update Parcel

```
updateParcel(
    metadataType: T.Type = EmptyMetadata.self,
    request: ParcelRequest<T>, 
    runCompletionOnUIThread: Bool = true, 
    completion: @escaping(Result<Parcel<T>, Error>) -> Void)
```

##### Description

This function fetches Parcels previously created on the TShip API.

##### Parameters

`metadataType: T.Type = EmptyMetadata.self`

The metatype of the metadata model struct/class attached to the Parcel. You can omit this value if you don't want to attach metadata to the Parcel. The default type of the metadata is EmptyMetadata.self, [EmptyMetadata](#emptymetadata) being an empty struct.

`request: ParcelRequest<T>`

Request body with all the Parcel details to update the Parcel. This can be initialized from an existing Parcel using [the variant of the ParcelRequest initializer that takes in a Parcel](#initialising-parcelrequest-with-parcel).

`runCompletionOnUIThread: Bool = true`

Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.

`completion: @escaping(Result<Parcel<T>, Error>) -> Void`

The completion handler to call, passing along the response status and the updated [Parcel](#parcel) if no error occurred.

## Rates

Here you'll find information on how to interact with the Rates endpoint throught the SDK.

### Get Rates for Shipment

```
getRatesForShipment<T: Codable>(
    request: GetRateForShipmentRequest, 
    runCompletionOnUIThread: Bool = true, 
    completion: @escaping(Result<[Rate], Error>) -> Void)
```

##### Description

This function gets the rates for a shipment using the TShip API.

##### Parameters

`request: GetRateForShipmentRequest`

[GetRateForShipmentRequest](#getrateforshipmentrequest) containing the parameters needed to get shipment rate. If the shipment Id is added to the request you need only add the parcel Id otherwise the address ids for the pickup and delivery ids as well as the parcel id are required to get rates for a shipment.

`runCompletionOnUIThread: Bool = true`

Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.

`completion: @escaping(Result<[Rate], Error>) -> Void`

The completion handler to call, passing along the response status alongside the [Rates](#rates) for the shipment, if no error occurred.

## Shipments

Here you'll find information on how to create, update, fetch, arrange, track and cancel Shipments.

### Create Shipment

```
createShipment<ParcelM: Codable>(
    parcelMetadataType: ParcelM.Type = EmptyMetadata.self, 
    request: ShipmentRequest, 
    runCompletionOnUIThread: Bool = true, 
    completion: @escaping(Result<ShipmentWithPackagingData<ParcelM>, Error>) -> Void)
```

##### Description

This function creates a Shipment on the TShip API.

##### Parameters

`parcelMetadataType: ParcelM.Type = EmptyMetadata.self`

The metatype of the metadata model struct/class attached to the Parcel. You can omit this value if you don't want to attach metadata to the Parcel or you don't need it. The default type of the metadata is EmptyMetadata.self, [EmptyMetadata](#emptymetadata) being an empty struct.

`request: ShipmentRequest`

Request body with details used to create a Shipment. This takes in an instance of the [ShipmentRequest](#shipmentrequest) class.

`runCompletionOnUIThread: Bool = true`

Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.

`completion: @escaping(Result<ShipmentWithPackagingData<ParcelM>, Error>) -> Void`

The completion handler to call, passing along the response status and the newly created [Shipment](#shipment) if no error occurred.

### Get Shipment

```
getShipment<ParcelM: Codable>(
    parcelMetadataType: ParcelM.Type = EmptyMetadata.self,
    shipmentId: String,
    runCompletionOnUIThread: Bool = true,
    completion: @escaping(Result<ShipmentWithPackagingData<ParcelM>, Error>) -> Void)
```

##### Description

This function fetches details of a Shipment previously created on the TShip API.

##### Parameters

`metadataType: T.Type = EmptyMetadata.self`

The metatype of the metadata model struct/class attached to the Parcel. You can omit this value if you don't want to attach metadata to the Parcel or you don't need it. The default type of the metadata is EmptyMetadata.self, [EmptyMetadata](#emptymetadata) being an empty struct.

`shipmentId: String`

Unique id used to identify the shipment

`runCompletionOnUIThread: Bool = true`

Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.

`completion: @escaping(Result<ShipmentWithPackagingData<ParcelM>, Error>) -> Void`

The completion handler to call, passing along the response status and the [Shipment](#shipment) if no error occurred.

### Get Populated Shipments

```
getShipments(
    request: PaginatedRequestBuilder,
    runCompletionOnUIThread: Bool = true,
    completion: @escaping(Result<GetShipmentsResponseData<ParcelM>, Error>) -> Void)
```

##### Description

This function fetches Shipments previously created on the TShip API with the Shipment.

##### Parameters

`request: PaginatedRequestBuilder`

Contains the query parameters for paginating through the Shipments. This should be created with the PaginatedRequestBuilder class.

`runCompletionOnUIThread: Bool = true`

Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.

`completion: @escaping(Result<GetShipmentsResponseData<ParcelM>, Error>) -> Void`

The completion handler to call, passing along the response status and an instance of  [GetShipmentsResponseData](#getshipmentsresponsedata) if no error occurred.

### Get Populated Shipments

```
getPopulatedShipments<ParcelM: Codable>(
    parcelMetadataType: ParcelM.Type = EmptyMetadata.self,
    request: PaginatedRequestBuilder,
    runCompletionOnUIThread: Bool = true,
    completion: @escaping(Result<GetShipmentsResponseData<ParcelM>, Error>) -> Void)
```

##### Description

This function fetches Shipments previously created on the TShip API with the Shipment populated with details for addresses, carriers and parcel.

##### Parameters

`parcelMetadataType: ParcelM.Type = EmptyMetadata.self`

The metatype of the metadata model struct/class attached to the Parcel. You can omit this value if you don't want to attach metadata to the Parcel or you don't need it. The default type of the metadata is EmptyMetadata.self, [EmptyMetadata](#emptymetadata) being an empty struct.

`request: PaginatedRequestBuilder`

Contains the query parameters for paginating through the Shipments. This should be created with the PaginatedRequestBuilder class.

`runCompletionOnUIThread: Bool = true`

Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.

`completion: @escaping(Result<GetShipmentsResponseData<ParcelM>, Error>) -> Void`

The completion handler to call, passing along the response status and an instance of  [GetShipmentsResponseData](#getshipmentsresponsedata) if no error occurred.

### Track Shipment

```
trackShipment(
    shipmentId: String, 
    runCompletionOnUIThread: Bool = true, 
    completion: @escaping(Result<ShipmentTrackingInfo, Error>) -> Void)
```

##### Description

This function fetches Shipments previously created on the TShip API with the Shipment populated with details for addresses, carriers and parcel.

##### Parameters

`shipmentId: String`

The id of the Shipment to track.

`runCompletionOnUIThread: Bool = true`

Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.

`completion: @escaping(Result<ShipmentTrackingInfo, Error>) -> Void`

The completion handler to call, passing the response status alongside an instance of [ShipmentTrackingInfo](#shipmenttrackinginfo) which contains all the information needed to track the shipment, if no error occurred.

### Arrange Shipment

```
arrangeShipment(
    request: ArrangeShipmentRequest, 
    runCompletionOnUIThread: Bool = true, 
    completion: @escaping(Result<ShipmentUnpopulated, Error>) -> Void)
```

##### Description

This function arranges pickup and delivery of a Shipment.

##### Parameters

`request: ArrangeShipmentRequest`

An instance of ArrangeShipmentRequest that contains all the information required to arrange a shipment.

`runCompletionOnUIThread: Bool = true`

Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.

`completion: @escaping(Result<ShipmentUnpopulated, Error>) -> Void`

The completion handler to call, passing the response status alongside an instance of [ShipmentUnpopulated](#shipmentunpopulated) which contains information about the newly arranged shipment, if no error occurred.

### Cancel Shipment

```
cancelShipment(
    shipmentId: String, 
    runCompletionOnUIThread: Bool = true, 
    completion: @escaping(Result<ShipmentUnpopulated, Error>) -> Void)
```

##### Description

This function cancels a Shipment previously created on the TShip API.

##### Parameters

`shipmentId: String`

The id of the Shipment to track.

`runCompletionOnUIThread: Bool = true`

Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.

`completion: @escaping(Result<ShipmentTrackingInfo, Error>) -> Void`

The completion handler to call, passing the response status alongside an instance of [ShipmentUnpopulated](#shipmentunpopulated) which contains information about the cancelled shipment, if no error occurred.

## Users

Here you'll find information on how to create, update, fetch, arrange, track and cancel Shipments.

### Get User's Profile

```
getUserProfile(
    userId: String, 
    runCompletionOnUIThread: Bool = true, 
    completion: @escaping(Result<User, Error>) -> Void)
```

##### Description

This function fetches details of a User's account.

##### Parameters

`userId: String`

The unique string used to identify the user on the TShip API.

`runCompletionOnUIThread: Bool = true`

Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.

`completion: @escaping(Result<ShipmentWithPackagingData<ParcelM>, Error>) -> Void`

The completion handler to call, passing along the response status and the [user's profile](#user) if no error occurred.

### Get User's Wallet Details

```
getUserWallet(
    userId: String, 
    runCompletionOnUIThread: Bool = true, 
    completion: @escaping(Result<User, Error>) -> Void)
```

##### Description

This function fetches details about a user's wallet.

##### Parameters

`userId: String`

The unique string used to identify the user on the TShip API.

`runCompletionOnUIThread: Bool = true`

Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.

`completion: @escaping(Result<ShipmentWithPackagingData<ParcelM>, Error>) -> Void`

The completion handler to call, passing along the response status and the [user's wallet details](#wallet) if no error occurred.

### Get User's Carriers

```
getUserCarriers(
    request: GetCarriersRequest, 
    runCompletionOnUIThread: Bool = true, 
    completion: @escaping(Result<GetCarriersResponse, Error>) -> Void)
```

##### Description

This function fetches list of all carriers available for a user.

##### Parameters

`request: GetCarriersRequest`

Contians the query parameters required to paginated the carriers. This uses the [GetCarriersRequest](#getcarriersreqeust) class.

`runCompletionOnUIThread: Bool = true`

Boolean indicating whether the completion handler should be run on the UI or background thread. The default value is true.

`completion: @escaping(Result<ShipmentWithPackagingData<ParcelM>, Error>) -> Void`

The completion handler to call, passing along the response status and the user's [Carrier](#carrier)s if no error occurred.


## Request Builders

### AddressRequestBuilder

This class helps create the request body needed to create or update an address.

#### Initialising the Builder

```
init(
    city: String, 
    country: String, 
    state: String
)
```

##### Description

This is the AddressRequestBuilder initializer. It takes in the required fields needed to get a rate.

##### Parameters

`city: String`

Name of the city the address is located in.

`country: String`

Name of the country the address is located in.

`state: String`

Name of the state the address is located in.

#### Building the Request

```
build() -> [String: Any]
```

##### Description

This function returns the built create address request.

##### Returns

Returns a dictionary containing the parameters provided to the builder.

#### Adding Details about the User at the Address

```
withDetailsForUserAtAddress(
    firstName: String? = nil, 
    lastName: String? = nil, 
    email: String? = nil,
    phone: String? = nil
)
```

##### Description

This function adds details for the user at the address to the request.

##### Parameters

`firstName: String`

First Name of the person at the location. It can be ignored if need be.

`lastName: String`

Last Name of the person at the location. It can be ignored if need be.

`email: String`

Email of the person at the location. It can be ignored if need be.

`phone: String`

Phone number of the person at the location. It can be ignored if need be.

#### Adding the Address Lines

```
withAddressLines(
    line1: String, 
    line2: String? = nil
)
```

##### Description

This function adds the address lines to the request.

##### Parameters

`line1: String`

Line1 of the Address.

`line2: String? = nil`

Line2 of the Address. This value is optional so you can just ignore it.

#### Adding the Zip Code

```
withZipCode(
    zipCode: String
)
```

##### Description

This function adds the Address's zip code to the request.

##### Parameters

`zipCode: String`

Zip code of the region the address is located in.

#### Setting if it is a Residential Address

```
isResidential(
    isResidential: Bool
)
```

##### Description

This function sets whether the address is a residential address or not. This defaults to true if not set.

##### Parameters

`isResidential: Bool`

Indicates whether the address is a residential address.

#### Adding Metadata

```
withMetaData(
    metadata: [String: Any]
)
```

##### Description

This function adds metadata to the address.

##### Parameters

`metadata: [String: Any]`

Metadata you want to attach to the Addresss.

### ArrangeShipmentRequest

This class is used to make a request to arrange pickup and delivery for a Shipment.

#### Initialising the Request

```
init(
    rateId: String
)
```

##### Description

Default initializer taking in the details required to arrange a Shipment.

##### Parameters

`rateId: String`

The unique id used to identify the rate to use.

#### Initialising the Request with Shipmnent id

```
init(
    rateId: String,
    shipmentId: String
)
```

##### Description

Initializer taking in the rate id and the shipment id of the Shipment to be arranged.

##### Parameters

`rateId: String`

The unique id used to identify the rate to use.

`shipmentId: String`

The unique id used to identify the shipment to arrange. If one is not set a new shipment will be created.

#### Setting the Rate id

```
withRateId(
    rateId: String
)
```

##### Description

This function updates the rate id.

##### Parameters

`rateId: String`

The unique id used to identify the rate to use.

##### Returns

The instance of ArrangeShipmentRequest.

#### Setting the Shipment id

```
withShipmentId(
    shipmentId: String
)
```

##### Description

This function updates the shipment id.

##### Parameters

`shipmentId: String`

The unique id used to identify the shipment to arrange. If one is not set a new shipment will be created.

##### Returns

The instance of ArrangeShipmentRequest.

### CityOrStateRequestBuilder

This class helps create the request body needed to fetch States in a Country or Cities in a State.

#### Initialising the Builder

```
init(
    countryCode: String, 
    stateCode: String? = nil
)
```

##### Description

Default initializer taking in the required parameters for quering the city and state requests.

##### Parameters

`countryCode: String`

The country code of the country whose states or cities you want to fetch

`stateCode: String? = nil`

The state code of the state whose cities you want to fetch. Can  be omitted if you want to fetch list of states.

#### Building the Request

```
build() -> [String: Any]
```

##### Description

This function returns the built request for a paginated API call.

##### Returns

Returns a dictionary containing the parameters provided to the builder.

#### Setting the Country Code

```
withCountryCode(
    countryCode: String
)
```

##### Description

This function adds the country code to use in request.

##### Parameters

`countryCode: String`

The country code of the country whose states or cities you want to fetch

#### Setting the State Code

```
withStateCode(
    stateCode: String
)
```

##### Description

This function adds the state code to use in request.

##### Parameters

`stateCode: String`

The state code of the state whose cities you want to fetch. Can  be omitted if you want to fetch list of states.

### GetCarriersRequest: PaginatedRequestBuilder

This class houses the parameters required for a carriers paginated request.

#### Initialising GetCarriersRequest

```
init(
    perPage: Int = 15, 
    page: Int = 1, 
    active: Bool? = nil, 
    type: CarrierServiceType? = nil
)
```

##### Description

Default initializer that optionally takes in the parameters for getting carriers. This class inherits from the [PaginatedRequestBuilder](#paginatedrequestbuilder) class so it contains it's capabilities.

##### Parameters

`perPage: Int = 15`

The number of items to return in the response per request. The default number is 15.

`page: Int = 1`

The page number of the paginated request. This starts from 1. The default value is 1.

`active: Bool? = nil`

If true, only active carriers will be returned. If set to false, only disabled carriers will be returned. If nil, all carriers will be returned. It is nil by default.

`type: CarrierServiceType? = nil`

Set if you want carriers that offer a specific [service type](#carrierservicetype). If nil all carriers are returned. It is nil by default.

#### Getting active Carriers

```
isActive(
    active: Bool?
) -> GetCarriersRequest
```

##### Description

This function updates the active parameter in the request, determining whether to only return active carriers.

##### Parameters

`active: Bool?`

If true, only active carriers will be returned. If set to false, only disabled carriers will be returned. If nil, all carriers will be returned.

##### Returns

The instance of GetCarriersRequest.

#### Getting Carriers that offer specific Service types

```
withType(
    type: CarrierServiceType?
) -> GetCarriersRequest
```

##### Description

This function updates the active parameter in the request, determining whether to only return active carriers.

##### Parameters

`type: CarrierServiceType?`

Set if you want carriers that offer a specific [service type](#carrierservicetype). If nil all carriers are returned.

##### Returns

The instance of GetCarriersRequest.

### GetRateForShipmentRequest

This class is used to make a request to get rates for a shipment with provided details.

#### Properties

`pickupAddressId: String?`

The unique id used to identify the previously stored address to pickup the parcel from.

`deliveryAddressId: String?`

The unique id used to identify the previously stored address to deliver the parcel to.

`parcelId: String`

The unique id used to identify the parcel.

`currency: String`

The currency the rates should be returned in.

`shipmentId: String?`

The unique id used to identify the shipment.

#### Initialising Request with Shipment Id

```
init(
    shipmentId: String,
    parcelId: String,
    currency: Currency = .NGN
)
```

##### Description

Default initializer taking in the details required to get shipment rates using a shipment id.

##### Parameters

`shipmentId: String`

The unique id used to identify the shipment whose rates you want to fetch.

`parcelId: String`

The unique id used to identify the parcel.

`currency: Currency = .NGN`

The currency the rates should be returned in. The default value for this is NGN.

#### Initialising Request without a Shipment Id

```
init(
    pickupAddressId: String,
    deliveryAddressId: String,
    parcelId: String,
    currency: Currency = .NGN
)
```

##### Description

Default initializer taking in the details required to get shipment rates without using a shipment id.

##### Parameters

`pickupAddressId: String`

The unique id used to identify the previously stored address to pickup the parcel.

`deliveryAddressId: String`

The unique id used to identify the previously stored address to deliver the parcel to.

`parcelId: String`

The unique id used to identify the parcel.

`currency: Currency = .NGN`

The currency the rates should be returned in. The default value for this is NGN.

### PackagingRequest

This class helps create the request body needed to create and update a packaging. All parameters are required to create a Packaging.

#### Setting the Packaging name

```
withName(
    name: String
)
```

##### Description

This function adds the name of the packaging to the request.

##### Parameters

`name: String`

The name users will use to identify the packaging.

##### Returns

The instance of PackagingRequest.

#### Setting the Packaging type

```
withType(
    type: PackagingType
)
```

##### Description

This function adds the type of the packaging to the request.

##### Parameters

`type: PackagingType`

The type of the packaging. This is gotten from an enum containing all Packaging Types supported by the TShip API.

##### Returns

The instance of PackagingRequest.

#### Setting the Packaging Size

```
withSizeDimensions(
    height: Double? = nil, 
    width: Double? = nil, 
    length: Double? = nil, 
    sizeUnit: SizeUnit = .cm
)
```

##### Description

This function adds the dimensions of the packaging to the request.

##### Parameters

`height: Double? = nil`

The height of the packaging. The default value is nil. If the value is set to nil it is ignored.

`width: Double? = nil`

The width of the packaging. The default value is nil. If the value is set to nil it is ignored.

`length: Double? = nil`

The length of the packaging. The default value is nil. If the value is set to nil it is ignored.

`sizeUnit: SizeUnit = .cm`

The unit used to measure the size dimensions of the packaging. The default value for this is cm which is also the only suppported size unit for now.

##### Returns

The instance of PackagingRequest.

#### Setting the Packaging Weight

```
withWeight(
    weight: Double, 
    weightUnit: WeightUnit = .kg
)
```

##### Description

This function adds the weight of the packaging to the request.

##### Parameters

`weight: Double`

The weight of the packaging.

`weightUnit: WeightUnit = .kg`

The weight unit used for the size dimensions of the packaging. The default value for this is cm which is also the only suppported weight unit for now.

##### Returns

The instance of PackagingRequest.

### PaginatedRequestBuilder

This class helps create the parameters required for a base paginated request.

#### Initialising the Builder

```
init(
    perPage: Int = 15, 
    page: Int = 1
)
```

##### Description

Default initializer that optionally takes in the parameters for a paginated request.

##### Parameters

`perPage: Int = 15`

The number of items to return in the response per request. The default number is 15

`page: Int = 1`

The page number of the paginated request. This starts from 1. The default value is 1.

#### Building the Request

```
build() -> [String: Any]
```

##### Description

This function returns the built request for a paginated API call.

##### Returns

Returns a dictionary containing the parameters provided to the builder.

#### Setting the Page Number

```
withPage(
    page: Int
)
```

##### Description

This function updates the page number of the request.

##### Parameters

`page: Int`

The page number of the paginated request. This starts from 1

#### Setting Number of Items Per Page

```
withPerPage(
    perPage: Int
)
```

##### Description

This function updates the number of items to return per paginated request.

##### Parameters

`perPage: Int`

The number of items to return in the response per request.

### ParcelRequest<T: Codable>

This class is used to make Create and Update requests for Parcels. It requires you specify the type of class of the metadata to attach to the Parcel. The metadata should ideally be a struct representing your metadata model which conforms to Swift's Codable protocol. If you don't want to pass in any metadata, you can set the struct [EmptyMetadata](#emptymetadata) as the metadata type and go ahead and ignore the metadata which would be set to `nil` by default.

#### Properties

`description: String`

A short description with details about the Parcel and it's content.

`packagingId: String`

The unique Id used to identify the Packaging used to keep the Items in the Parcel.

`weightUnit: String`

The unit used to measure the weight of the packaging. The unit 'kg' is the only weight unit supported at this time. This takes in the enum [WeightUnit](#weightunit)

`currency: String`

The [Currency](#currency) the value of the items are stored in. 

`metadata: T? = nil`

Additional metadata you want to attach to the Parcel.

`items: [ParcelItem]`

The [items](#parcelitem) that are in the Parcel. This can be read but not writen to directly. Use the [`withItem`](#adding-an-item-to-the-parcel) and [`removeItemAt`](#removing-an-item) methods respectively to add or remove items.

#### Initialising ParcelRequest

```
init(
    description: String, 
    packagingId: String, 
    currency: Currency, 
    weightUnit: WeightUnit = .kg
)
```

##### Description

Default initializer taking in the details required to create a Parcel.

##### Parameters

`description: String`

A short description with details about the Parcel and it's content.

`packagingId: String`

The unique Id used to identify the Packaging used to keep the Items in the Parcel.

`currency: Currency`

The [Currency](#currency) the value of the items are stored in.

`weightUnit: WeightUnit`

The unit used to measure the weight of the packaging. The default value, 'kg', is the only weight unit supported at this time. This takes in the enum [WeightUnit](#weightunit).

#### Initialising ParcelRequest with Parcel

```
init(
    from: Parcel<T>
)
```

##### Description

Initializer taking in a Parcel whose details you want to copy in order to update or clone it.

##### Parameters

`from: Parcel<T>`

The Parcel you are trying to update or Clone.

#### Adding an Item to the Parcel

```
withItem(
    name: String, 
    description: String, 
    quantity: Int, 
    value: Double, 
    weight: Double
) -> ParcelRequest
```

##### Description

This function adds an Item to the Parcel alongside it's details.

##### Parameters

`name: String`

The name used to identify the Item.

`description: String`

A short description of the item.

`quantity: Int`

The quantity of the item in the parcel.

`value: Double`

The total monetary value of the item. Note that this is the cost per item multiplied by the quantity.

`weight: Double`

The weight of the item. Note that this is the weight per item multiplied by the quantity.

##### Returns

Returns the Instance of the ParcelRequest.

#### Removing an Item

```
removeItemAt(
    index: Int
)
```

##### Description

This function removes an Item from the Parcel.

##### Parameters

`index: Int`

The index of the item to be removed in the items array.

##### Returns

Returns the Instance of the ParcelRequest.

#### Attaching Metadata to the Parcel

```
withMetadata(
    metadata: T
)
```

##### Description

This function adds metadata to attach to the parcel object.

##### Parameters

`metadata: T`

The metadata to attach to the parcel. T is the Metadata data/class type specified earlier when initializing or declaring the ParcelRequest class.

##### Returns

Returns the Instance of the ParcelRequest.

#### Updating the description

```
with(
    description: String, 
    packagingId: String, 
    currency: Currency, 
    weightUnit: WeightUnit
)
```

##### Description

This function updates the Parcel's details. If any of the parameters is set to nil the parameter is not updated. The default values are set to nil, so you can ignore parameters you don't want to update.

##### Parameters

`description: String? = nil`

A short description with details about the Parcel and it's content.

`packagingId: String? = nil`

The unique Id used to identify the Packaging used to keep the Items in the Parcel.

`currency: Currency? = nil`

The [Currency](#currency) the value of the items are stored in.

`weightUnit: WeightUnit? = nil`

The unit used to measure the weight of the packaging. The unit 'kg' is the only weight unit supported at this time. This takes in the enum [WeightUnit](#weightunit)

##### Returns

Returns the Instance of the ParcelRequest.

### ShipmentRequest

This class is used to make Create and Update requests for Shipments

#### Properties

`pickupAddressId: String`

The unique id used to identify the pickup address.

`deliveryAddressId: String`

The unique id used to identify the delivery address.

`returnAddressId: String`

The unique id used to identify the return address.

`parcelId: String`

The unique id used to identify the parcel. 

`shipmentPurpose: ShipmentPurpose`

The purpose for shipping the parcel. This uses the enum [ShipmentPurpose](#shipmentpurpose).

#### Initialising ShipmentRequest

```
init(
    pickupAddressId: String,
    deliveryAddressId: String,
    parcelId: String,
    returnAddressId: String? = nil,
    shipmentPurpose: ShipmentPurpose = .personal
)
```

##### Description

Default initializer taking in the details required to create a Shipment.

##### Parameters

`pickupAddressId: String`

The unique id used to identify the pickup address.

`deliveryAddressId: String`

The unique id used to identify the delivery address.

`parcelId: String`

The unique id used to identify the parcel.

`returnAddressId: String? = nil`

The unique id used to identify the return address. If this is not set the addressFromId(the pickup address) is set as the return address.

`shipmentPurpose: ShipmentPurpose = .personal`

The purpose for shipping the parcel. This takes in the [ShipmentPurpose](#shipmentpurpose). The default value is personal.


## Models

### Address

#### Description

Address data model containing all information needed about an Address to arrange a shipping.

#### Properties

`addressId: String`

Unique id used to identify the address.

`city: String`

Name of the city the address is located in.

`country: String`

Name of the country the address is located in.

`firstName: String`

First Name of the person at the location.

`lastName: String`

Last Name of the person at the location.

`email: String`

Email of the person at the location.

`line1: String`

Line1 of the Address.

`line2: String`

Line2 of the Address.

`phoneNumber: String`

Phone number of the person at the location.

`state: String`

Name of the state the address is located in.

`zipCode: String`

Zip code of the region the address is located in.

`isResidential: Bool`

Indicates whether the address is a residential address.

`coordinates: Coordinates`

Geographical Coordinates of the addresss.

### Carrier

#### Description

Data model containing information about a Carrier.

#### Properties

`name: String`

The Carrier's name.

`logo: String`

A Url to the carrier's logo.

`slug: String`

A unique slug used to identify the carrier.

`carrierId: String`

A unique string used to identify the carrier.

`domestic: Bool`

Indicates whether the carrier offers domestic shipments.

`regional: Bool`

Indicates whether the carrier offers regional shipments.

`international: Bool`

Indicates whether the carrier offers international shipments.

`requiresInvoice: Bool`

Indicates whether the carrier requires that the commercial invoice is attached to the parcel to be shipped.

`requiresWaybill: Bool`

Indicates whether the carrier requires that the waybill is attached to the parcel to be shipped

`availableCountries: [String]`

List of countries(ISO2) that the carrier is available in.

### City

#### Description

City data model containing details about a City.

#### Properties

`name: String`

The name of the city.

`stateCode: String`

The iso code of the state the city is in.

`countryCode: String`

The iso code of the country the city is in.

`latitude: String`

The state's latitude.

`longitude: String`

The state's longitude.

### Coordinates

#### Description

Geographical Coordinates of a location, usually an address.

#### Properties

`lat: Double`

Latitude of the location.

`lng: Double`

Longitude of the location.

### Country

#### Description

Country data model containing in formation about a country.

#### Properties

`isoCode: String`

The country's iso code.

`name: String`

The name of the country.

`phoneCode: String`

The country's phone number code.

`flag: String`

An emoji of the country's Flag.

`currency: String`

An emoji of the country's Flag.

`latitude: String`

The country's latitude.

`longitude: String`

The country's longitude.

`timezones: [Timezone]`

The details about the [Timezone](#timezone)s that are in the country.

### EmptyMetadata

#### Description

Data Model representing empty metadata. This model will be set by default as the generic type for metadata attached to address and parcel if no metadata type is provided.

### GetAddressResponseData

#### Description

Represents the response data for paginated addresses, featuring the page data.

#### Properties

`pagination: TShipPageData`

Details about the page of data being returned.

`addresses: [Address]`

The list of paginated Addresses.

### GetMultiplePackagingResponseData

#### Description

Represents the structure paginated Packaging are returned, featuring the page data.

#### Properties

`pagination: TShipPageData`

Details about the page of data being returned.

`packaging: [Packaging]`

The list of paginated Packaging.

### GetParcelsResponseData

#### Description

Represents the structure paginated Packaging are returned, featuring the page data.

#### Properties

`pagination: TShipPageData`

Details about the page of data being returned.

`parcels: [Parcel<T>]`

The list of paginated Packaging.

### GetPopulatedShipmentsResponseData

#### Description

Represents the response data for paginated addresses, featuring the page data.

#### Properties

`pagination: TShipPageData`

Details about the page of data being returned.

`shipments: [ShipmentUnpopulated]`

The list of paginated [ShipmentPopulatedWithoutPackagingData](#shipmentpopulatedwithoutpackagingdata).

### GetShipmentsResponseData

#### Description

Represents the response data for paginated addresses, featuring the page data.

#### Properties

`pagination: TShipPageData`

Details about the page of data being returned.

`shipments: [ShipmentUnpopulated]`

The list of paginated [ShipmentUnpopulated](#shipmentunpopulated).

### Packaging

#### Description

Packaging data model containing information about packaging used to ship items.

#### Properties

`height: Double`

The country's iso code.

`width: Double`

The width of the packaging.

`length: Double`

The length of the packaging.

`sizeUnit: String`

The unit used to measure the size dimensions of the packaging. Only 'cm' is supported at this time.

`weight: Double`

The weight of the packaging.

`weightUnit: String`

The unit used to measure the weight of the packaging. Only 'kg' is supported at this time.

`type: String`

The type of the packaging.

`packagingId: String`

The unique id used to identify the packaging.

`name: String`

The name users will use to identify the packaging.

`createdAt: String`

The date and time the Packaging was created.

`updatedAt: String`

The date and time the Packaging was updated.

### Parcel<T: Codable>

#### Description

Base Data model containing information about the parcel to be shipped. The generic type is the type of the metadata class/struct model. The default is usually set to [EmptyMetadata](#emptymetadata).

#### Properties

`description: String`

A short description with details about the Parcel and it's content.

`currency: String`

The currency the value of the item is stored in.

`weightUnit: String`

The unit used to measure the weight of the packaging. Only 'kg' is supported at this time.

`metadata: T?`

Metadata to be attached to the Parcel.

`items: [ParcelItem]`

The list of [items](#parcelitem) that are in the Parcel.

### ParcelItem

#### Description

Data model containing the details about an Item.

#### Properties

`description: String`

A short description of the item.

`name: String`

The name used to identify the Item.

`currency: String`

The currency the value of the item is stored in.

`quantity: Int`

The quantity of the item in the parcel.

`value: Double`

The total monetary value of the item. Note that this is the cost per item multiplied by the quantity.

`weight: Double`

The weight of the item. Note that this is the weight per item multiplied by the quantity.

### ParcelWithoutPackagingData<T: Codable>: Parcel<T>

#### Description

Data model containing information about the parcel to be shipped alongside the packaging id. This inherits from the base Parcel model, containing all the details there. This class was made seperately because sometimes the Parcel comes with Packaging details as opposed to just the packaging id.

#### Properties

`packagingId: String`

The unique Id used to identify the Packaging used to keep the Items in the Parcel.

### ParcelWithPackagingData<T: Codable>: Parcel<T>

#### Description

Data model containing information about the parcel to be shipped alongside the [Packaging](#packaging) details. This inherits from the [base Parcel model](#parcel), containing all the details there. This class was made seperately because sometimes the Parcel comes with packaging id as opposed to just the packaging details.

#### Properties

`packaging: Packaging`

Details about the Packaging used to keep the Items in the Parcel.

### State

#### Description

State data model containing details about a State.

#### Properties

`name: String`

The name of the state.

`isoCode: String`

The iso code of the state.

`countryCode: String`

The country code of the country the state is in.

`latitude: String`

The state's latitude.

`longitude: String`

The state's longitude.

### Timezone

#### Description

Timezone data model containing timezone information for a region.

#### Properties

`zoneName: String`

The technical name of the timezone.

`gmtOffset: Int`

The timezone's gmt offset.

`gmtOffsetName: String`

The timezone's gmt offset.

`abbreviation: String`

The timezone's abbreviation.

`tzName: String`

The less technical name of the timezone.

### Rate

#### Description

Rate data model containing details about a rate.

#### Properties

`amount: Double`

The cost of shipping with this Rate.

`carrierLogo: String`

A Url to the carrier's logo.

`carrierName: String`

The carrier's name.

`carrierRateDescription: String`

A short description from the carrier about the Rate.

`carrierSlug: String`

The unique string used to identify the carrier.

`currency: String`

The currency the rate's amount is in.

`deliveryAddressId: String`

The unique id used to identify the previously stored address to deliver the parcel to.

`deliveryDate: String`

The datetime the delivery is expected to have been made.

`deliveryEta: Int`

The estimated amount of time it would take to deliver the parcel in minutes.

`deliveryTime: String`

The estimated amount of time it would take to deliver the parcel in human readable text.

`rateId: String`

The unique Id used to identify the rate.

`pickupDate: String?`

The datetime the delivery is expected to have been picked up.

`pickupEta: Int`

The estimated amount of time it would take to pick up the parcel in minutes.

`pickupTime: String`

The estimated amount of time it would take to pick up the parcel in human readable text.

`pickupAddressId: String`

The unique id used to identify the previously stored address to pick up the parcel from.

`parcelId: String`

The unique Id used to identify the parcel that contains the Items to be shipped.

### Shipment

#### Description

Data model containing information about a Shipment.

#### Properties

`shipmentId: String`

The unique string used to identify the Shipment.

`pickupDate: String?`

The datetime the parcel will be picked up.

`shipmentPurpose: ShipmentPurpose`

The purpose of the shipment. This is represented with the enum [ShipmentPurpose](#shipmentpurpose).

`status: ShipmentStatus`

The status of the shipment. This is represented with the enum [ShipmentStatus](#shipmentstatus).

`events: [ShipmentEvent]`

List of Events that have occurred on the shipment. These are represented with the model [ShipmentEvent](#shipmentevent)

### ShipmentEvent

#### Description

Data model containing information about an event that occurred during the shipping process.

#### Properties

`createdAt: String`

The datetime the Event occurred.

`description: String`

A short description of the Event.

`location: String`

Human readable version of the location the Event happened.

`status: String`

The status being reported by the Event.

### ShipmentExtras

#### Description

Extra information that can be used to track the Shipment with the Carrier.

#### Properties

`carrierTrackingUrl: String`

Url to view the shipment tracking information on the Carrier's website.

`bookingReference: String?`

Booking reference id used to identify the shipment on the Carrier's website.

`shippingLabelURL: String?`

URL liinking to the shipping label.

`trackingUrl: String`

Url to view the shipment tracking information on Terminal's website.

`carrierTrackingNumber: String`

Number used to track the shipment on the carrier's website.

`commercialInvoiceUrl: String`

URL to the commercial invoice generated for the shipment items by TShip.

### ShipmentPopulated: Shipment

#### Description

Data model containing information about a Shipment with the Addresses and Carriers populated. This inherits from the base Shipment model, containing all the details there.

#### Properties

`deliveryAddress: Address`

Contains details about the delivery address.

`pickupAddress: Address?`

Contains details about the pickup address.

`returnAddress: Address?`

Contains details about the return address.

`carrier: Carrier?`

Details about the carrier used to arrange the Shipment.

### ShipmentPopulatedWithoutPackagingData<ParcelMetadata: Codable>: ShipmentPopulated

#### Description

Data model containing information about a Shipment with the Addresses and Carriers populated. This inherits from [the populated Shipment model](#shipmentpopulated), containing all the details there.

#### Properties

`parcel: ParcelWithoutPackagingData<ParcelMetadata>`

Contains details about the parcel excuding the Packaging details but containing the packaging id.

### ShipmentPopulatedWithPackagingData<ParcelMetadata: Codable>: ShipmentPopulated

#### Description

Data model containing information about a Shipment with the Addresses and Carriers populated. This inherits from the base Shipment model, containing all the details there.

#### Properties

`parcel: ParcelWithPackagingData<ParcelMetadata>`

Contains details about the parcel including the Packaging details.

### ShipmentTrackingInfo

#### Description

Data model all the information needed to track the Shipment.

#### Properties

`deliveryAddress: Address`

Contains details about the delivery address.

`pickupAddress: Address`

Contains details about the pickup address.

`carrier: Carrier?`

Details about the carrier used to arrange the Shipment.

`shipmentId: String`

The unique string used to identify the Shipment

`pickupDate: String?`

The datetime the parcel will be picked up.

`deliveryDate: String?`

The datetime the parcel will be delivered.

`deliveryArranged: String?`

The datetime the parcel delivery was arranged.

`status: ShipmentStatus`

The status of the shipment.

`events: [ShipmentEvent]`

Array of [ShipmentEvents](#shipmentevent) that have occurred on the shipment.

`trackingStatus: ShipmentEvent?`

Details about the last [ShipmentEvent](#shipmentevent) that happened on the shipment.

### ShipmentPopulatedWithPackagingData<ParcelMetadata: Codable>: ShipmentPopulated

#### Description

Data model containing information about a Shipment with the Addresses and Carriers populated. This inherits from the base Shipment model, containing all the details there.

#### Properties

`parcel: ParcelWithPackagingData<ParcelMetadata>`

Contains details about the parcel including the Packaging details.

### ShipmentUnpopulated: Shipment

#### Description

Data model containing information about a Shipment without the Addresses and Carriers populated but rather their ids. This inherits from the [base Shipment model](#shipment), containing all the details there.

#### Properties

`deliveryAddressId: String`

The unique id used to identify the previously stored address to deliver the parcel to.

`pickupAddressId: String`

The unique id used to identify the previously stored address to pick up the parcel from.

`returnAddressId: String`

The unique id used to identify the previously stored address to return the parcel to.

`parcelId: String`

The unique Id used to identify the parcel that contains the Items to be shipped.

`carrierId: String`

Details about the carrier used to arrange the Shipment.

### TShipPageData

#### Description

Contains details about a given page returned in a paginated response.

#### Properties

`total: Int`

The total number items that can be returned from the Endpoint.

`perPage: Int`

The number of items set to be returned per paginated request.

`currentPage: Int`

The page number of data being returned.

`pageCount: Int`

The number of pages of data that can be returned.

`prevPage: Int?`

The page number of the previous page. If there is no previous page this value is null.

`nextPage: Int?`

The page number of the next page. If there is no next page this value is null.

`hasPrevPage: Bool`

Indicates whether there is a previous page.

`hasNextPage: Int?`

Indicates whether there is a next page.

### User

#### Description

Data model representing information about a User.

#### Properties

`companyName: String`

The name of the user's company.

`country: String`

The country the user's company is based in.

`email: String`

The user's email address.

`firstName: String`

The user's firstname.

`lastName: String`

The user's lastname.

`metadata: UserMetadata`

Extra data about the user relating to terminal africa. Represented with the [UserMetadata struct](#usermetadata).

`phoneNumber: String`

The user's phone number.

`walletId: String`

The user's wallet id.

`userId: String`

The unique string used to identify the user.

`createdAt: String`

The time the user's profile was created.

`businessCategory: String`

The category the user's category falls into.

`state: String`

The state the user's company is based in.

### UserMetadata

#### Description

Data model representing extra data about the user relating to terminal africa.

#### Properties

`totalShipment: Int`

Total amount of shipments performed by the user.

`totalShipmentAmount: Int`

Total amount of money spent on shipment.

### Wallet

#### Description

Data model containing information about a user's wallet.

#### Properties

`companyName: String`

The name of the user's company.

`amount: Double`

The amount of money in the user's wallet.

`currency: Currency`

The currency the user's wallet is being returned in.

`userId: String`

The unique string used to identify the user on the TShip API.

`active: Bool`

Indicates whether the user's wallet is active or not.

`createdAt: String`

The datetime the user's wallet was created.


## Enums

### CarrierServiceType

#### Description

Represents the different service types carriers can offer.

#### Cases

`domestic`

Represents domestic shipping.

`regional`

Represents regional shipping.

`international`

Represents international shipping.

### Currency

#### Description

An enum representing the currency types supported by the TShip API.

#### Cases

`AED`

Represents United Arab Emirates Dirham.

`AUD`

Represents Australian Dollar.

`CAD`

Represents Canadian Dollar.

`CNY`

Represents Chinese Yuan.

`EUR`

Represents Euro.

`GBP`

Represents Pound sterling.

`GHS`

Represents Ghanaian Cedi.

`HKD`

Represents Hong Kong Dollar.

`KES`

Represents Kenyan Shilling.

`NGN`

Represents Nigerian Naira.

`TZS`

Represents Tanzanian Shilling.

`UGX`

Represents Ugandan Shilling.

`USD`

Represents United States Dollar.

`ZAR`

Represents South African Rand.

### PackagingType

#### Description

An enum representing the valid Packaging types on TShip.

#### Cases

`box`

Represents the box Packaging type.

`envelope`

Represents the envelope Packaging type.

`softPackaging`

Represents the soft Packaging type.

### ShipmentPurpose

#### Description

An enum representing all the valid shipment purposes you can set when creating a shipment.

#### Cases

`personal`

Used if you are shipping for personal reasons.

`commercial`

Used if you are shipping for commercial/business reasons.

`sample`

Used if you are shipping a sample product to a customer.

`returnAfterRepair`

Used if you are shipping a product back to customer after repair.

`returnForRepair`

Used if you are shipping a product for repair.

### ShipmentStatus

#### Description

An enum representing all the valid shipment purposes you can set when creating a shipment.

#### Cases

`cancelled`

Represents when the shipment has been cancelled.

`confirmed`

Represents when the shipment has been confirmed by the carrier.

`delivered`

Represents when the shipment has been delivered to the delivery address.

`draft`

Represents when the shipment has not been arranged.

`inTransit`

Represents when the parcel is on it's way to it's destination.

`pending`

Represents when a shipment is yet to be confirmed by the carrier.

### SizeUnit

#### Description

An enum representing the valid size units used on TShip.

#### Cases

`cm`

Represents the box Packaging type.

### WeightUnit

#### Description

An enum representing the valid size units used on TShip.

#### Cases

`kg`

Represents kilogram weight unit.
