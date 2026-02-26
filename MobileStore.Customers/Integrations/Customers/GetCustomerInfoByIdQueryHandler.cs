using MediatR;
using MobileStore.Api.Model.Customer;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.Customers
{
    internal sealed class GetCustomerInfoByIdQueryHandler : IRequestHandler<GetCustomerInfoByIdQuery, CustomerInfoModel>
    {
        private readonly ICustomersService customersService;

        public GetCustomerInfoByIdQueryHandler(ICustomersService customersService)
        {
            this.customersService = customersService;
        }

        public Task<CustomerInfoModel> Handle(GetCustomerInfoByIdQuery request, CancellationToken cancellationToken)
        {
            return customersService.GetCustomerInfoByIdAsync(request.CustomerId, cancellationToken);
        }
    }
}
