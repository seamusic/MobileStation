using System.Web;
using System.Web.Optimization;

namespace AppStore.Manage
{
    public class BundleConfig
    {
        // 有关 Bundling 的详细信息，请访问 http://go.microsoft.com/fwlink/?LinkId=254725
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryui").Include(
                        "~/Scripts/jquery-ui-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.unobtrusive*",
                        "~/Scripts/jquery.validate*"));

            // 使用要用于开发和学习的 Modernizr 的开发版本。然后，当你做好
            // 生产准备时，请使用 http://modernizr.com 上的生成工具来仅选择所需的测试。
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new StyleBundle("~/Content/css").Include("~/Content/site.css"));

            bundles.Add(new StyleBundle("~/Content/themes/base/css").Include(
                        "~/Content/themes/base/jquery.ui.core.css",
                        "~/Content/themes/base/jquery.ui.resizable.css",
                        "~/Content/themes/base/jquery.ui.selectable.css",
                        "~/Content/themes/base/jquery.ui.accordion.css",
                        "~/Content/themes/base/jquery.ui.autocomplete.css",
                        "~/Content/themes/base/jquery.ui.button.css",
                        "~/Content/themes/base/jquery.ui.dialog.css",
                        "~/Content/themes/base/jquery.ui.slider.css",
                        "~/Content/themes/base/jquery.ui.tabs.css",
                        "~/Content/themes/base/jquery.ui.datepicker.css",
                        "~/Content/themes/base/jquery.ui.progressbar.css",
                        "~/Content/themes/base/jquery.ui.theme.css"));

            #region style
            bundles.Add(new StyleBundle("~/Content/css/mandatory").Include(
                "~/Content/Plugins/font-awesome/css/font-awesome.css",
                "~/Content/Plugins/bootstrap/css/bootstrap.css",
                "~/Content/Plugins/uniform/css/uniform.default.css"));

            bundles.Add(new StyleBundle("~/Content/css/metronic").Include(
                "~/Content/themes/metronic/style-metronic.css",
                "~/Content/themes/metronic/style.css",
                "~/Content/themes/metronic/style-responsive.css",
                "~/Content/themes/metronic/plugins.css"));
            #endregion

            bundles.Add(new ScriptBundle("~/bundles/mandatory").Include(
                        "~/Content/Plugins/jquery-1.10.2.js",
                        "~/Content/Plugins/jquery-migrate-1.2.1.js",
                        "~/Content/Plugins/bootstrap/js/bootstrap.js",
                        "~/Content/Plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.js",
                        "~/Content/Plugins/jquery-slimscroll/jquery.slimscroll.js",
                        "~/Content/Plugins/jquery.blockui.js",
                        "~/Content/Plugins/jquery.cookie.js",
                        "~/Content/Plugins/uniform/jquery.uniform.js"));

            bundles.Add(new ScriptBundle("~/bundles/upload").Include(
                        "~/Content/Plugins/jquery-file-upload/js/vendor/jquery.ui.widget.js",
                        "~/Content/Plugins/jquery-file-upload/js/vendor/tmpl.js",
                        "~/Content/Plugins/jquery-file-upload/js/vendor/load-image.js",
                        "~/Content/Plugins/jquery-file-upload/js/vendor/canvas-to-blob.js",
                        "~/Content/Plugins/jquery-file-upload/js/jquery.iframe-transport.js",
                        "~/Content/Plugins/jquery-file-upload/js/jquery.fileupload.js",
                        "~/Content/Plugins/jquery-file-upload/js/jquery.fileupload-process.js",
                        "~/Content/Plugins/jquery-file-upload/js/jquery.fileupload-image.js",
                        "~/Content/Plugins/jquery-file-upload/js/jquery.fileupload-audio.js",
                        "~/Content/Plugins/jquery-file-upload/js/jquery.fileupload-video.js",
                        "~/Content/Plugins/jquery-file-upload/js/jquery.fileupload-validate.js",
                        "~/Content/Plugins/jquery-file-upload/js/jquery.fileupload-ui.js"));
        }
    }
}