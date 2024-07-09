using MediatR;
using MobileStore.Api.Model;
using MobileStore.Api.Model.Customer;
using MobileStore.Services.Interfaces;

namespace MobileStore.CommandsAndQueries.Customers
{
    public class GetCustomerQueryHandler : IRequestHandler<GetCustomerQuery, ApiResponse<CustomerModel>>
    {
        private readonly ICustomersService customersService;

        public GetCustomerQueryHandler(ICustomersService customersService)
        {
            this.customersService = customersService;
        }
        public async Task<ApiResponse<CustomerModel>> Handle(GetCustomerQuery request, CancellationToken cancellationToken)
        {
            return new ApiResponse<CustomerModel>(await customersService.GetCustomerAsync(request.UserId, cancellationToken));
        }
    }
}
