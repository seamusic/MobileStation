using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Web.Mvc;
using System.Web.UI.WebControls;

namespace AppStore.Common
{
    public static class ListControlExtensions
    {
        public static MvcHtmlString RadioButtonList(this HtmlHelper htmlHelper, string name, string codeCategory,
                                                    RepeatDirection repeatDirection = RepeatDirection.Horizontal)
        {
            var codes = CodeManager.GetCodes(codeCategory);
            return ListControlUtil.GenerateHtml(name, codes, repeatDirection, "radio", null);
        }

        public static MvcHtmlString RadioButtonListFor<TModel, TProperty>(this HtmlHelper<TModel> htmlHelper,
                                                                          Expression<Func<TModel, TProperty>> expression,
                                                                          string codeCategory,
                                                                          RepeatDirection repeatDirection =
                                                                              RepeatDirection.Horizontal)
        {
            var codes = CodeManager.GetCodes(codeCategory);
            ModelMetadata metadata = ModelMetadata.FromLambdaExpression<TModel, TProperty>(expression,
                                                                                           htmlHelper.ViewData);
            string name = ExpressionHelper.GetExpressionText(expression);
            string fullHtmlFieldName = htmlHelper.ViewContext.ViewData.TemplateInfo.GetFullHtmlFieldName(name);
            return ListControlUtil.GenerateHtml(fullHtmlFieldName, codes, repeatDirection, "radio", metadata.Model);
        }

        public static MvcHtmlString CheckBoxList(this HtmlHelper htmlHelper, string name, string codeCategory,
                                                 RepeatDirection repeatDirection = RepeatDirection.Horizontal)
        {
            var codes = CodeManager.GetCodes(codeCategory);
            return ListControlUtil.GenerateHtml(name, codes, repeatDirection, "checkbox", null);
        }

        public static MvcHtmlString CheckBoxListFor<TModel, TProperty>(this HtmlHelper<TModel> htmlHelper,
                                                                       Expression<Func<TModel, TProperty>> expression,
                                                                       string codeCategory,
                                                                       RepeatDirection repeatDirection =
                                                                           RepeatDirection.Horizontal)
        {
            var codes = CodeManager.GetCodes(codeCategory);
            ModelMetadata metadata = ModelMetadata.FromLambdaExpression<TModel, TProperty>(expression,
                                                                                           htmlHelper.ViewData);
            string name = ExpressionHelper.GetExpressionText(expression);
            string fullHtmlFieldName = htmlHelper.ViewContext.ViewData.TemplateInfo.GetFullHtmlFieldName(name);
            return ListControlUtil.GenerateHtml(fullHtmlFieldName, codes, repeatDirection, "checkbox", metadata.Model);
        }
    }

    public class CodeDescription
    {
        public string Code { get; set; }
        public string Description { get; set; }
        public string Category { get; set; }

        public CodeDescription(string code, string description, string category)
        {
            this.Code = code;
            this.Description = description;
            this.Category = category;
        }
    }

    public static class CodeManager
    {
        private static CodeDescription[] codes = new CodeDescription[]
            {
                new CodeDescription("1.0", "1.0", "Score"),
                new CodeDescription("2.0", "2.0", "Score"),
                new CodeDescription("3.0", "3.0", "Score"),
                new CodeDescription("4.0", "4.0", "Score"),
                new CodeDescription("5.0", "5.0", "Score"),
            };

        public static Collection<CodeDescription> GetCodes(string category)
        {
            Collection<CodeDescription> codeCollection = new Collection<CodeDescription>();
            foreach (var code in codes.Where(code => code.Category == category))
            {
                codeCollection.Add(code);
            }
            return codeCollection;
        }
    }
}
