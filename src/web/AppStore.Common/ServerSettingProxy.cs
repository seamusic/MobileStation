using Lennon.Utility;

namespace AppStore.Common
{
    public class ServerSettingProxy : SettingManager<ServerSetting>
    {
        private static object _lockObj = new object();

        public static SettingManager<ServerSetting> Instance
        {
            get
            {
                if (ManagerProxy == null)
                {
                    lock (_lockObj)
                    {
                        ManagerProxy = new ServerSettingProxy();
                    }
                }

                return ManagerProxy;
            }
        }

        public ServerSettingProxy()
        {
            ConfigName = "web.config";
        }
    }
}