using System.Web;
using System.Web.Mvc;

namespace Nhom8_ChuDu
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
