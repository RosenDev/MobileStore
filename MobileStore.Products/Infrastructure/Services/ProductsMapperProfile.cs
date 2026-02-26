using AutoMapper;
using MobileStore.Api.Model.Product;
using MobileStore.Api.Model.ProductCategory;
using MobileStore.Products.Domain;

namespace MobileStore.Services
{
    internal sealed class ProductsMapperProfile : Profile
    {
        public ProductsMapperProfile()
        {
            CreateMap<ProductCategory, ProductCategoryModel>();
            CreateMap<ProductsProductCategory, ProductCategoryModel>()
                .ForMember(x => x.Name, opts => opts.MapFrom(x => x.ProductCategory.Name))
                .ForMember(x => x.Id, opts => opts.MapFrom(x => x.ProductCategoryId));

            CreateMap<Product, ProductModel>()
                .ForMember(x => x.Categories, opts => opts.MapFrom(x => x.ProductCategories))
                .ForMember(x => x.InStock, opts => opts.MapFrom(x => x.Quantity > 0));
        }
    }
}
