namespace Lennon.Utility
{
    public class Singleton<T> where T : new()
    {
        private static T _instance;

        /// <summary>
        /// 程序运行时，创建一个静态只读的进程辅助对象
        /// </summary>
        private static readonly object _object = new object();

        /// <summary>
        /// 构造方法私有，外键不能通过New类实例化此类
        /// </summary>
        private Singleton()
        {
        }

        public static T Instance
        {
            get
            {
                if (_instance == null)
                {
                    //在同一时刻加了锁的那部分程序只有一个线程可以进入，
                    lock (_object)
                    {
                        _instance = new T();
                    }
                }
                return _instance;
            }
        }
    }
}
