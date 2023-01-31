// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

// MARK: - Welcome
public struct OpenOrderResponse: Codable, Hashable {
    public var resultCountRemovedByPostFilter: Int
    public var pageNumber: Int
    public var entriesPerPage: Int
    public var totalEntries: Int
    public var totalPages: Int
    public var data: [Order]

    enum CodingKeys: String, CodingKey {
        case resultCountRemovedByPostFilter = "ResultCountRemovedByPostFilter"
        case pageNumber = "PageNumber"
        case entriesPerPage = "EntriesPerPage"
        case totalEntries = "TotalEntries"
        case totalPages = "TotalPages"
        case data = "Data"
    }

    public init(resultCountRemovedByPostFilter: Int, pageNumber: Int, entriesPerPage: Int, totalEntries: Int, totalPages: Int, data: [Order]) {
        self.resultCountRemovedByPostFilter = resultCountRemovedByPostFilter
        self.pageNumber = pageNumber
        self.entriesPerPage = entriesPerPage
        self.totalEntries = totalEntries
        self.totalPages = totalPages
        self.data = data
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - Datum
public struct Order: Codable, Hashable {
    
    public var numOrderID: Int
    public var generalInfo: GeneralInfo
    public var shippingInfo: ShippingInfo
    public var customerInfo: CustomerInfo
    public var totalsInfo: TotalsInfo
    public var taxInfo: TaxInfo
    public var folderName: [String]
    public var isPostFilteredOut: Bool
    public var canFulfil: Bool
    public var fulfillment: Fulfillment
    public var items: [Item]
    public var hasItems: Bool
    public var totalItemsSum: Int
    public var orderID: String

    enum CodingKeys: String, CodingKey {
        case numOrderID = "NumOrderId"
        case generalInfo = "GeneralInfo"
        case shippingInfo = "ShippingInfo"
        case customerInfo = "CustomerInfo"
        case totalsInfo = "TotalsInfo"
        case taxInfo = "TaxInfo"
        case folderName = "FolderName"
        case isPostFilteredOut = "IsPostFilteredOut"
        case canFulfil = "CanFulfil"
        case fulfillment = "Fulfillment"
        case items = "Items"
        case hasItems = "HasItems"
        case totalItemsSum = "TotalItemsSum"
        case orderID = "OrderId"
    }

    public init(numOrderID: Int, generalInfo: GeneralInfo, shippingInfo: ShippingInfo, customerInfo: CustomerInfo, totalsInfo: TotalsInfo, taxInfo: TaxInfo, folderName: [String], isPostFilteredOut: Bool, canFulfil: Bool, fulfillment: Fulfillment, items: [Item], hasItems: Bool, totalItemsSum: Int, orderID: String) {
        self.numOrderID = numOrderID
        self.generalInfo = generalInfo
        self.shippingInfo = shippingInfo
        self.customerInfo = customerInfo
        self.totalsInfo = totalsInfo
        self.taxInfo = taxInfo
        self.folderName = folderName
        self.isPostFilteredOut = isPostFilteredOut
        self.canFulfil = canFulfil
        self.fulfillment = fulfillment
        self.items = items
        self.hasItems = hasItems
        self.totalItemsSum = totalItemsSum
        self.orderID = orderID
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - CustomerInfo
public struct CustomerInfo: Codable, Hashable {
    public var channelBuyerName: JSONNull?
    public var address: Address
    public var billingAddress: JSONNull?

    enum CodingKeys: String, CodingKey {
        case channelBuyerName = "ChannelBuyerName"
        case address = "Address"
        case billingAddress = "BillingAddress"
    }

    public init(channelBuyerName: JSONNull?, address: Address, billingAddress: JSONNull?) {
        self.channelBuyerName = channelBuyerName
        self.address = address
        self.billingAddress = billingAddress
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - Address
public struct Address: Codable, Hashable {
    public var emailAddress: String
    public var address1: JSONNull?
    public var address2: JSONNull?
    public var address3: JSONNull?
    public var town: String
    public var region: JSONNull?
    public var postCode: String
    public var country: Country
    public var continent: JSONNull?
    public var fullName: String
    public var company: String
    public var phoneNumber: JSONNull?
    public var countryID: String

    enum CodingKeys: String, CodingKey {
        case emailAddress = "EmailAddress"
        case address1 = "Address1"
        case address2 = "Address2"
        case address3 = "Address3"
        case town = "Town"
        case region = "Region"
        case postCode = "PostCode"
        case country = "Country"
        case continent = "Continent"
        case fullName = "FullName"
        case company = "Company"
        case phoneNumber = "PhoneNumber"
        case countryID = "CountryId"
    }

    public init(emailAddress: String, address1: JSONNull?, address2: JSONNull?, address3: JSONNull?, town: String, region: JSONNull?, postCode: String, country: Country, continent: JSONNull?, fullName: String, company: String, phoneNumber: JSONNull?, countryID: String) {
        self.emailAddress = emailAddress
        self.address1 = address1
        self.address2 = address2
        self.address3 = address3
        self.town = town
        self.region = region
        self.postCode = postCode
        self.country = country
        self.continent = continent
        self.fullName = fullName
        self.company = company
        self.phoneNumber = phoneNumber
        self.countryID = countryID
    }
}

public enum Country: String, Codable, Hashable {
    case unknown = "UNKNOWN"
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - Fulfillment
public struct Fulfillment: Codable, Hashable {
    public var fulfillmentState: FulfillmentState
    public var purchaseOrderState: JSONNull?

    enum CodingKeys: String, CodingKey {
        case fulfillmentState = "FulfillmentState"
        case purchaseOrderState = "PurchaseOrderState"
    }

    public init(fulfillmentState: FulfillmentState, purchaseOrderState: JSONNull?) {
        self.fulfillmentState = fulfillmentState
        self.purchaseOrderState = purchaseOrderState
    }
}

public enum FulfillmentState: String, Codable, Hashable {
    case insufficientStock = "Insufficient_Stock"
    case sufficientStock = "Sufficient_Stock"
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - GeneralInfo
public struct GeneralInfo: Codable, Hashable {
    public var status: Int
    public var labelPrinted: Bool
    public var labelError: String
    public var invoicePrinted: Bool
    public var pickListPrinted: Bool
    public var isRuleRun: Bool
    public var notes: Int
    public var partShipped: Bool
    public var marker: Int
    public var isParked: Bool
    public var identifiers: JSONNull?
    public var referenceNum: String
    public var secondaryReference: JSONNull?
    public var externalReferenceNum: JSONNull?
    public var receivedDate: String
    public var source: Source
    public var subSource: String
    public var siteCode: JSONNull?
    public var holdOrCancel: Bool
    public var despatchByDate: String
    public var scheduledDelivery: JSONNull?
    public var hasScheduledDelivery: Bool
    public var location: String
    public var numItems: Int
    public var pickwaveIDS: JSONNull?
    public var stockAllocationType: JSONNull?

    enum CodingKeys: String, CodingKey {
        case status = "Status"
        case labelPrinted = "LabelPrinted"
        case labelError = "LabelError"
        case invoicePrinted = "InvoicePrinted"
        case pickListPrinted = "PickListPrinted"
        case isRuleRun = "IsRuleRun"
        case notes = "Notes"
        case partShipped = "PartShipped"
        case marker = "Marker"
        case isParked = "IsParked"
        case identifiers = "Identifiers"
        case referenceNum = "ReferenceNum"
        case secondaryReference = "SecondaryReference"
        case externalReferenceNum = "ExternalReferenceNum"
        case receivedDate = "ReceivedDate"
        case source = "Source"
        case subSource = "SubSource"
        case siteCode = "SiteCode"
        case holdOrCancel = "HoldOrCancel"
        case despatchByDate = "DespatchByDate"
        case scheduledDelivery = "ScheduledDelivery"
        case hasScheduledDelivery = "HasScheduledDelivery"
        case location = "Location"
        case numItems = "NumItems"
        case pickwaveIDS = "PickwaveIds"
        case stockAllocationType = "StockAllocationType"
    }

    public init(status: Int, labelPrinted: Bool, labelError: String, invoicePrinted: Bool, pickListPrinted: Bool, isRuleRun: Bool, notes: Int, partShipped: Bool, marker: Int, isParked: Bool, identifiers: JSONNull?, referenceNum: String, secondaryReference: JSONNull?, externalReferenceNum: JSONNull?, receivedDate: String, source: Source, subSource: String, siteCode: JSONNull?, holdOrCancel: Bool, despatchByDate: String, scheduledDelivery: JSONNull?, hasScheduledDelivery: Bool, location: String, numItems: Int, pickwaveIDS: JSONNull?, stockAllocationType: JSONNull?) {
        self.status = status
        self.labelPrinted = labelPrinted
        self.labelError = labelError
        self.invoicePrinted = invoicePrinted
        self.pickListPrinted = pickListPrinted
        self.isRuleRun = isRuleRun
        self.notes = notes
        self.partShipped = partShipped
        self.marker = marker
        self.isParked = isParked
        self.identifiers = identifiers
        self.referenceNum = referenceNum
        self.secondaryReference = secondaryReference
        self.externalReferenceNum = externalReferenceNum
        self.receivedDate = receivedDate
        self.source = source
        self.subSource = subSource
        self.siteCode = siteCode
        self.holdOrCancel = holdOrCancel
        self.despatchByDate = despatchByDate
        self.scheduledDelivery = scheduledDelivery
        self.hasScheduledDelivery = hasScheduledDelivery
        self.location = location
        self.numItems = numItems
        self.pickwaveIDS = pickwaveIDS
        self.stockAllocationType = stockAllocationType
    }
}

public enum Source: String, Codable, Hashable {
    case direct = "DIRECT"
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - Item
public struct Item: Codable, Hashable {
    public var itemID: String
    public var itemNumber: String
    public var sku: String
    public var itemSource: ItemSource?
    public var title: Title
    public var quantity: Int
    public var categoryName: JSONNull?
    public var compositeAvailablity: JSONNull?
    public var stockLevelsSpecified: Bool
    public var onOrder: Int
    public var onPurchaseOrder: JSONNull?
    public var inOrderBook: JSONNull?
    public var level: Int
    public var minimumLevel: JSONNull?
    public var availableStock: Int
    public var pricePerUnit: Int
    public var unitCost: Int
    public var despatchStockUnitCost: Int
    public var discount: Int
    public var tax: Int
    public var taxRate: Int
    public var cost: Int
    public var costIncTax: Int
    public var compositeSubItems: [Item]
    public var isService: Bool
    public var salesTax: Int
    public var taxCostInclusive: Bool
    public var partShipped: Bool
    public var weight: Int
    public var barcodeNumber: String?
    public var market: Int
    public var channelSKU: JSONNull?
    public var channelTitle: JSONNull?
    public var discountValue: Int
    public var hasImage: Bool
    public var imageID: JSONNull?
    public var additionalInfo: [String]
    public var stockLevelIndicator: Int
    public var shippingCost: Int
    public var partShippedQty: Int
    public var itemName: JSONNull?
    public var batchNumberScanRequired: Bool
    public var serialNumberScanRequired: Bool
    public var binRack: JSONNull?
    public var binRacks: JSONNull?
    public var inventoryTrackingType: Int
    public var isBatchedStockItem: Bool
    public var isWarehouseManaged: Bool
    public var isUnlinked: Bool
    public var stockItemIntID: Int
    public var boxes: JSONNull?
    public var rowID: String
    public var orderID: String
    public var stockItemID: String

    enum CodingKeys: String, CodingKey {
        case itemID = "ItemId"
        case itemNumber = "ItemNumber"
        case sku = "SKU"
        case itemSource = "ItemSource"
        case title = "Title"
        case quantity = "Quantity"
        case categoryName = "CategoryName"
        case compositeAvailablity = "CompositeAvailablity"
        case stockLevelsSpecified = "StockLevelsSpecified"
        case onOrder = "OnOrder"
        case onPurchaseOrder = "OnPurchaseOrder"
        case inOrderBook = "InOrderBook"
        case level = "Level"
        case minimumLevel = "MinimumLevel"
        case availableStock = "AvailableStock"
        case pricePerUnit = "PricePerUnit"
        case unitCost = "UnitCost"
        case despatchStockUnitCost = "DespatchStockUnitCost"
        case discount = "Discount"
        case tax = "Tax"
        case taxRate = "TaxRate"
        case cost = "Cost"
        case costIncTax = "CostIncTax"
        case compositeSubItems = "CompositeSubItems"
        case isService = "IsService"
        case salesTax = "SalesTax"
        case taxCostInclusive = "TaxCostInclusive"
        case partShipped = "PartShipped"
        case weight = "Weight"
        case barcodeNumber = "BarcodeNumber"
        case market = "Market"
        case channelSKU = "ChannelSKU"
        case channelTitle = "ChannelTitle"
        case discountValue = "DiscountValue"
        case hasImage = "HasImage"
        case imageID = "ImageId"
        case additionalInfo = "AdditionalInfo"
        case stockLevelIndicator = "StockLevelIndicator"
        case shippingCost = "ShippingCost"
        case partShippedQty = "PartShippedQty"
        case itemName = "ItemName"
        case batchNumberScanRequired = "BatchNumberScanRequired"
        case serialNumberScanRequired = "SerialNumberScanRequired"
        case binRack = "BinRack"
        case binRacks = "BinRacks"
        case inventoryTrackingType = "InventoryTrackingType"
        case isBatchedStockItem = "isBatchedStockItem"
        case isWarehouseManaged = "IsWarehouseManaged"
        case isUnlinked = "IsUnlinked"
        case stockItemIntID = "StockItemIntId"
        case boxes = "Boxes"
        case rowID = "RowId"
        case orderID = "OrderId"
        case stockItemID = "StockItemId"
    }

    public init(itemID: String, itemNumber: String, sku: String, itemSource: ItemSource?, title: Title, quantity: Int, categoryName: JSONNull?, compositeAvailablity: JSONNull?, stockLevelsSpecified: Bool, onOrder: Int, onPurchaseOrder: JSONNull?, inOrderBook: JSONNull?, level: Int, minimumLevel: JSONNull?, availableStock: Int, pricePerUnit: Int, unitCost: Int, despatchStockUnitCost: Int, discount: Int, tax: Int, taxRate: Int, cost: Int, costIncTax: Int, compositeSubItems: [Item], isService: Bool, salesTax: Int, taxCostInclusive: Bool, partShipped: Bool, weight: Int, barcodeNumber: String?, market: Int, channelSKU: JSONNull?, channelTitle: JSONNull?, discountValue: Int, hasImage: Bool, imageID: JSONNull?, additionalInfo: [String], stockLevelIndicator: Int, shippingCost: Int, partShippedQty: Int, itemName: JSONNull?, batchNumberScanRequired: Bool, serialNumberScanRequired: Bool, binRack: JSONNull?, binRacks: JSONNull?, inventoryTrackingType: Int, isBatchedStockItem: Bool, isWarehouseManaged: Bool, isUnlinked: Bool, stockItemIntID: Int, boxes: JSONNull?, rowID: String, orderID: String, stockItemID: String) {
        self.itemID = itemID
        self.itemNumber = itemNumber
        self.sku = sku
        self.itemSource = itemSource
        self.title = title
        self.quantity = quantity
        self.categoryName = categoryName
        self.compositeAvailablity = compositeAvailablity
        self.stockLevelsSpecified = stockLevelsSpecified
        self.onOrder = onOrder
        self.onPurchaseOrder = onPurchaseOrder
        self.inOrderBook = inOrderBook
        self.level = level
        self.minimumLevel = minimumLevel
        self.availableStock = availableStock
        self.pricePerUnit = pricePerUnit
        self.unitCost = unitCost
        self.despatchStockUnitCost = despatchStockUnitCost
        self.discount = discount
        self.tax = tax
        self.taxRate = taxRate
        self.cost = cost
        self.costIncTax = costIncTax
        self.compositeSubItems = compositeSubItems
        self.isService = isService
        self.salesTax = salesTax
        self.taxCostInclusive = taxCostInclusive
        self.partShipped = partShipped
        self.weight = weight
        self.barcodeNumber = barcodeNumber
        self.market = market
        self.channelSKU = channelSKU
        self.channelTitle = channelTitle
        self.discountValue = discountValue
        self.hasImage = hasImage
        self.imageID = imageID
        self.additionalInfo = additionalInfo
        self.stockLevelIndicator = stockLevelIndicator
        self.shippingCost = shippingCost
        self.partShippedQty = partShippedQty
        self.itemName = itemName
        self.batchNumberScanRequired = batchNumberScanRequired
        self.serialNumberScanRequired = serialNumberScanRequired
        self.binRack = binRack
        self.binRacks = binRacks
        self.inventoryTrackingType = inventoryTrackingType
        self.isBatchedStockItem = isBatchedStockItem
        self.isWarehouseManaged = isWarehouseManaged
        self.isUnlinked = isUnlinked
        self.stockItemIntID = stockItemIntID
        self.boxes = boxes
        self.rowID = rowID
        self.orderID = orderID
        self.stockItemID = stockItemID
    }
}

public enum ItemSource: String, Codable, Hashable {
    case walmart = "WALMART"
}

public enum Title: String, Codable, Hashable {
    case apiTest5 = "APITest5"
    case cupcakesWithBlueberryFlavor = "CUPCAKES WITH BLUEBERRY FLAVOR"
    case socks = "Socks"
    case woodenChair = "wooden chair"
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - ShippingInfo
public struct ShippingInfo: Codable, Hashable {
    public var vendor: Vendor
    public var postalServiceID: String
    public var postalServiceName: PackageType
    public var totalWeight: Int
    public var itemWeight: Int
    public var packageCategoryID: String
    public var packageCategory: JSONNull?
    public var packageTypeID: String
    public var packageType: PackageType
    public var postageCost: Int
    public var postageCostExTax: Int
    public var trackingNumber: String
    public var manualAdjust: Bool

    enum CodingKeys: String, CodingKey {
        case vendor = "Vendor"
        case postalServiceID = "PostalServiceId"
        case postalServiceName = "PostalServiceName"
        case totalWeight = "TotalWeight"
        case itemWeight = "ItemWeight"
        case packageCategoryID = "PackageCategoryId"
        case packageCategory = "PackageCategory"
        case packageTypeID = "PackageTypeId"
        case packageType = "PackageType"
        case postageCost = "PostageCost"
        case postageCostExTax = "PostageCostExTax"
        case trackingNumber = "TrackingNumber"
        case manualAdjust = "ManualAdjust"
    }

    public init(vendor: Vendor, postalServiceID: String, postalServiceName: PackageType, totalWeight: Int, itemWeight: Int, packageCategoryID: String, packageCategory: JSONNull?, packageTypeID: String, packageType: PackageType, postageCost: Int, postageCostExTax: Int, trackingNumber: String, manualAdjust: Bool) {
        self.vendor = vendor
        self.postalServiceID = postalServiceID
        self.postalServiceName = postalServiceName
        self.totalWeight = totalWeight
        self.itemWeight = itemWeight
        self.packageCategoryID = packageCategoryID
        self.packageCategory = packageCategory
        self.packageTypeID = packageTypeID
        self.packageType = packageType
        self.postageCost = postageCost
        self.postageCostExTax = postageCostExTax
        self.trackingNumber = trackingNumber
        self.manualAdjust = manualAdjust
    }
}

public enum PackageType: String, Codable, Hashable {
    case packageTypeDefault = "Default"
    case standard = "Standard"
}

public enum Vendor: String, Codable, Hashable {
    case none = "NONE"
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - TaxInfo
public struct TaxInfo: Codable, Hashable {
    public var taxNumber: JSONNull?

    enum CodingKeys: String, CodingKey {
        case taxNumber = "TaxNumber"
    }

    public init(taxNumber: JSONNull?) {
        self.taxNumber = taxNumber
    }
}

//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

// MARK: - TotalsInfo
public struct TotalsInfo: Codable, Hashable {
    public var subtotal: Int
    public var postageCost: Int
    public var postageCostExTax: Int
    public var tax: Int
    public var totalCharge: Int
    public var paymentMethod: JSONNull?
    public var paymentMethodID: String
    public var profitMargin: Int
    public var totalDiscount: Int
    public var currency: Currency
    public var countryTaxRate: Int
    public var conversionRate: Int

    enum CodingKeys: String, CodingKey {
        case subtotal = "Subtotal"
        case postageCost = "PostageCost"
        case postageCostExTax = "PostageCostExTax"
        case tax = "Tax"
        case totalCharge = "TotalCharge"
        case paymentMethod = "PaymentMethod"
        case paymentMethodID = "PaymentMethodId"
        case profitMargin = "ProfitMargin"
        case totalDiscount = "TotalDiscount"
        case currency = "Currency"
        case countryTaxRate = "CountryTaxRate"
        case conversionRate = "ConversionRate"
    }

    public init(subtotal: Int, postageCost: Int, postageCostExTax: Int, tax: Int, totalCharge: Int, paymentMethod: JSONNull?, paymentMethodID: String, profitMargin: Int, totalDiscount: Int, currency: Currency, countryTaxRate: Int, conversionRate: Int) {
        self.subtotal = subtotal
        self.postageCost = postageCost
        self.postageCostExTax = postageCostExTax
        self.tax = tax
        self.totalCharge = totalCharge
        self.paymentMethod = paymentMethod
        self.paymentMethodID = paymentMethodID
        self.profitMargin = profitMargin
        self.totalDiscount = totalDiscount
        self.currency = currency
        self.countryTaxRate = countryTaxRate
        self.conversionRate = conversionRate
    }
}

public enum Currency: String, Codable, Hashable {
    case gbp = "GBP"
}

// MARK: - Encode/decode helpers

public class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

public class JSONAny: Codable {

    public let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
