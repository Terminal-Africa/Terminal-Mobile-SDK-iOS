# TShipSDK :ship: :nigeria:

## Table of Contents
1. [Overview](#overview)
2. [Why TShip?](#why-tship)
3. [Features](#features)
4. [Getting Started](#getting-started)
5. [Addresses](#addresses)
6. [Request Builders](#request-builders)
7. [Models](#models)

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

Request body with details used to create Address. You'll build the request with the [CreateAddressRequestBuilder](#createaddressrequestbuilder).

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
    completion: @escaping(Result<Address, Error>) -> Void
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

The completion handler to call, passing along the response status and the [Address](#address), if no error occurred.

## Request Builders

### AddressRequestBuilder

This class helps create the request body needed to create or update an address.

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

```
build() -> [String: Any]
```

##### Description

This function returns the built create address request.

##### Returns

Returns a dictionary containing the parameters provided to the builder.

```
withDetailsForUserAtAddress(
    firstName: String, 
    lastName: String, 
    email: String,
    phone: String
)
```

##### Description

This function adds details for the user at the address to the request.

##### Parameters

`firstName: String`

First Name of the person at the location.

`lastName: String`

Last Name of the person at the location.

`email: String`

Email of the person at the location.

`phone: String`

Phone number of the person at the location.

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

### PaginatedRequestBuilder

This class helps create the parameters required for a base paginated request.

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

```
build() -> [String: Any]
```

##### Description

This function returns the built request for a paginated API call.

##### Returns

Returns a dictionary containing the parameters provided to the builder.

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

### Coordinates

#### Description

Geographical Coordinates of a location, usually an address.

#### Properties

`lat: Double`

Latitude of the location.

`lng: Double`

Longitude of the location.

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
