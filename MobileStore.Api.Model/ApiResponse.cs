using Microsoft.AspNetCore.Mvc;

namespace MobileStore.Api.Model
{
    public class ApiResponse
    {
        public static ApiResponse NoContent = new ApiResponse
        {
            StatusCode = StatusCode.NoContent
        };

        public static ApiResponse<T> Created<T>(T result) => new ApiResponse<T>(result, StatusCode.Created);

        public ApiResponse()
        {
            StatusCode = StatusCode.Ok;
        }

        public ApiResponse(string error)
        {
            Error = error;
            StatusCode = StatusCode.InternalServerError;
        }

        public StatusCode StatusCode { get; set; }

        public string? Error { get; set; }

        public bool IsSuccess => StatusCode != StatusCode.InternalServerError;

        public Task ExecuteResultAsync(ActionContext context)
        {
            return Task.FromResult(context);
        }
    }

    public class ApiResponse<TResult> : ApiResponse
    {
        public TResult Result { get; set; }

        public ApiResponse(TResult result)
            : base()
        {
            Result = result;
        }

        public ApiResponse(TResult result, StatusCode statusCode)
            : this(result)
        {
            StatusCode = statusCode;
        }
    }
}
