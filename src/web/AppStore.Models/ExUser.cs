using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace AppStore.Models
{
    public partial class User
    {
        public IList<Role> Roles { get; set; }
        public IList<Role> UserInRoles { get; set; }
        public IList<PCClient> PcClients { get; set; }
        public IList<PCClient> UserPcClients { get; set; }
    }

    public partial class Role
    {
        public IList<ActionPermission> ActionPermissions { get; set; }
        public IList<ActionPermission> RolePermissions { get; set; }
    }
}
