@AbapCatalog.viewEnhancementCategory: [ #NONE ]

@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Item Interface view for read purpose'

@Metadata.ignorePropagatedAnnotations: true

define view entity YRDR_OrderItem_S16
  as select from zyrditem000
  association[1..1] to YRDR_Order_S16 as _Order on $projection.ParentUuid = _Order.Uuid
  association [0..1] to YRDI_ItemStatus_VH as _ItemStatusTxt on $projection.Status = _ItemStatusTxt.Status
{
  key uuid          as Uuid,

      parent_uuid   as ParentUuid,
      item_id       as ItemId,
      product_id    as ProductId,
      uom           as Uom,

      @Semantics.quantity.unitOfMeasure: 'Uom'
      req_quantity  as ReqQuantity,

      currency_code as CurrencyCode,

      @Semantics.amount.currencyCode: 'CurrencyCode'
      amount        as Amount,

      status        as Status,
      _Order,
       _ItemStatusTxt
}
