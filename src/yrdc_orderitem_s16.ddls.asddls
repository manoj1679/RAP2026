@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Projection View of Order Item View'

@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true

@Search.searchable: true

define view entity YRDC_ORDERITEM_S16
  as select from YRDR_OrderItem_S16

{
  key Uuid,

      ParentUuid,
      ItemId,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      ProductId,

      Uom,

      @Semantics.quantity.unitOfMeasure: 'Uom'
      ReqQuantity,

      CurrencyCode,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      Amount,

      @ObjectModel.text.element: [ 'ItemStatusText' ]
      Status,

      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      @Semantics.text
      _ItemStatusTxt.StatusText as ItemStatusText,

      /* Associations */
      _Order,
      _ItemStatusTxt
}
