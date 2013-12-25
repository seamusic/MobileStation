using System;
using System.Collections.Generic;
using System.Text;

namespace Lennon.Utils
{
    /// <summary>
    /// 数据库软件类型
    /// </summary>
    public enum DbProviderEnum
    {
        Access = 0,
        SqlServer = 1
    }

    /// <summary>
    /// QueryString值的检查
    /// </summary>
    public enum CheckGetEnum
    {
        Int = 0,
        Safety = 1
    }

    /// <summary>
    /// 使用标签
    /// </summary>
    public enum UsingTagEnum
    {
        None = 0,
        Ubb = 1,
        Html = 2
    }
}
