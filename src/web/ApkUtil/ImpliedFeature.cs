using System;

namespace ApkUtil
{
    public class ImpliedFeature
    {
        public ImpliedFeature(String feature, String implied)
        {
            Feature = feature;
            Implied = implied;
        }

        /// <summary>
        ///     获取或设置 设备特性名称
        /// </summary>
        public String Feature { get; set; }

        /// <summary>
        ///     获取或设置 所需特性的内容
        /// </summary>
        public String Implied { get; set; }

        public override string ToString()
        {
            return String.Format("Feature [feature={0}, implied={1}]", Feature, Implied);
        }
    }
}