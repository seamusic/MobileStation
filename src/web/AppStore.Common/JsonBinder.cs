using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace AppStore.Common
{
    public class JsonBinder : IModelBinder
    {
        public object BindModel(ControllerContext controllerContext, ModelBindingContext bindingContext)
        {
            var json = controllerContext.HttpContext.Request.Form[bindingContext.ModelName] as string;
            var jss = new JavaScriptSerializer();
            return jss.Deserialize<List<String>>(json);
        }
    }
}
