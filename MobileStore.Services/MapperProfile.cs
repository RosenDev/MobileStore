using AutoMapper;
using MobileStore.Api.Model;
using MobileStore.Api.Model.Customer;
using MobileStore.Api.Model.Product;
using MobileStore.Api.Model.ProductCategory;
using MobileStore.Entities;

namespace MobileStore.Services
{
    public class MapperProfile : Profile
    {
        public MapperProfile()
        {
            CreateMap<ProductCategory, ProductCategoryModel>();
            CreateMap<ProductsProductCategory, ProductCategoryModel>()
                .ForMember(x => x.Name, opts => opts.MapFrom(x => x.ProductCategory.Name))
                .ForMember(x => x.Id, opts => opts.MapFrom(x => x.ProductCategoryId));

            CreateMap<Product, ProductModel>()
                .ForMember(x => x.Categories, opts => opts.MapFrom(x => x.ProductCategories))
                .ForMember(x => x.InStock, opts => opts.MapFrom(x => x.Quantity > 0));

            CreateMap<ProductsOrder, ProductInOrderModel>()
                .ForMember(x => x.Id, opts => opts.MapFrom(x => x.ProductId))
                .ForMember(x => x.Price, opts => opts.MapFrom(x => x.Product.Price))
                .ForMember(x => x.Name, opts => opts.MapFrom(x => x.Product.Name));


            CreateMap<Order, OrderModel>()
                .ForMember(x => x.Status, opt => opt.MapFrom(x => x.Status))
                .ForMember(x => x.Products, opts => opts.MapFrom(x => x.ProductsOrders))
                .ForMember(x => x.CustomerName, opts => opts.MapFrom(x => $"{x.Customer.FirstName} {x.Customer.LastName}"))
                .ForMember(x => x.EcontOfficeCode, opts => opts.MapFrom(x => x.Customer.EcontOfficeCode))
                .ForMember(x => x.CustomerPhone, opts => opts.MapFrom(x => x.Customer.PhoneNumber))
                .ForMember(x => x.CustomerAddress, opts => opts.MapFrom(x => $"{x.Customer.Address1Line}\r\n{x.Customer.Address2Line}\r\n\r\n{x.Customer.City}\r\n\r\n{x.Customer.PostCode}"));

            CreateMap<Customer, CustomerModel>()
                .ForMember(x => x.PhoneNumber, opts => opts.MapFrom(x => x.PhoneNumber));

            CreateMap<CreateCustomerModel, Customer>()
                .ForMember(x => x.Orders, opts => opts.Ignore())
                .ForMember(x => x.Id, opts => opts.Ignore());

            CreateMap<UpdateCustomerModel, Customer>()
                .ForMember(x => x.Orders, opts => opts.Ignore());
        }
    }
}
