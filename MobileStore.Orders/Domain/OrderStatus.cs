namespace MobileStore.Orders.Domain;

internal enum OrderStatus
{
    Created = 1,
    Cancelled,
    Paid,
    SentForDelivery,
    Delivered
}
