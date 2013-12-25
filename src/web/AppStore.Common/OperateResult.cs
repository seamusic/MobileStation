using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AppStore.Common
{
    public class OperateResult
    {
        public string ID { get; set; }
        public string Code { get; set; }
        public bool Result { get; set; }
        public string Message { get; set; }
        public string Operator { get; set; }
        public DateTime OperateTime { get; set; }

        public OperateResult()
        {
            ID = "M_" + Guid.NewGuid().ToString();
            OperateTime = DateTime.Now;
        }

        public OperateResult(bool result)
        {
            ID = "M_" + Guid.NewGuid().ToString();
            OperateTime = DateTime.Now;
            Result = result;
        }

        public OperateResult(bool result,string message)
        {
            ID = "M_" + Guid.NewGuid().ToString();
            OperateTime = DateTime.Now;
            Result = result;
            Message = message;
        }
    }
}
