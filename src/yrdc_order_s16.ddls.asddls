@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View of Order Interface View'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@Search.searchable: true
define view entity YRDC_ORDER_S16 as select from YRDR_Order_S16

association[1..*] to YRDC_ORDERITEM_S16 as _item on $projection.Uuid = _item.ParentUuid

{
    key Uuid,
    
    @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
    OrderId,
     @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
    CustomerId,
    OrderDate,
     @ObjectModel.text.element: [ 'OrderStatusText' ]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
    Status,
    CurrencyCode,
    @Semantics.amount.currencyCode: 'CurrencyCode'
    NetAmount,
    LocalCreatedBy,
    LocalCreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    LastChangedAt,
    @Semantics.text: true
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.7
      _OrderStatusTxt.StatusText as OrderStatusText,
    /* Associations */
    @Search.defaultSearchElement: true
    _item
}
