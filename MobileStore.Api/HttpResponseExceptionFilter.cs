using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using MobileStore.Api.Model;

namespace MobileStore.Api
{
    public class HttpResponseExceptionFilter : IActionFilter, IOrderedFilter
    {
        public int Order => int.MaxValue - 10;

        public void OnActionExecuting(ActionExecutingContext context) { }

        public void OnActionExecuted(ActionExecutedContext context)
        {
            if(context.Exception != null)
            {
                context.Result = new ObjectResult(new ApiResponse(context.Exception.Message));

                context.ExceptionHandled = true;
            }
        }
    }
}
