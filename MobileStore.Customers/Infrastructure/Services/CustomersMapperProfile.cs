using AutoMapper;
using MobileStore.Api.Model.Customer;
using MobileStore.Customers.Domain;

namespace MobileStore.Services
{
    internal sealed class CustomersMapperProfile : Profile
    {
        public CustomersMapperProfile()
        {
            CreateMap<Customer, CustomerModel>();

            CreateMap<CreateCustomerModel, Customer>()
                .ForMember(x => x.Id, opts => opts.Ignore());

            CreateMap<UpdateCustomerModel, Customer>();
        }
    }
}
