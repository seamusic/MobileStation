using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AppStore.Common
{
    public enum ApplicationType
    {
        应用 = 1,
        游戏 = 2,
        装机必备 = 3,
    }

    public class ImagesJson
    {
        public string id;
        public string name;
        public string type;
        public string size;
        public string origSize;
        public string loaded;
        public string percent;
        public string status;
        public DateTime lastModifiedDate;
    }

    public enum RunAction
    {
        Install = 1,
        Remove = 2,
        FirstRunning = 3,
        SecondRunning = 4,
        ThirdRunning = 5,
        Stop = 6,
        Error = 98,
        Other = 99
    }
}
