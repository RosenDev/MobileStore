namespace MobileStore.Api.Model
{
    public class PagedResponse<TResult>
    {
        public PagedResponse(List<TResult> result, int page, int size, int total)
        {
            Total = total;
            Page = page;
            Size = size;
            Result = result;
            StatusCode = StatusCode.Ok;
        }

        public string? Error { get; set; }

        public StatusCode StatusCode { get; set; }

        public bool IsSuccess => StatusCode != StatusCode.InternalServerError;

        public List<TResult> Result { get; set; }

        public int Total { get; set; }

        public int Page { get; set; }

        public int Size { get; set; }
    }

    public class Paging
    {
        public int Page { get; set; }

        public int Size { get; set; }
    }
}
