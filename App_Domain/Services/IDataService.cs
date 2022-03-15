using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App_Domain.Services
{
   public interface IDataService<T>
    {
        Task<IEnumerable<T>> GetAll();

        Task<T> Get(int id);

        Task<T> Create(T egyed);

        Task<T> Update(int id, T egyed);

        Task<bool> Delete(int id);

    }
}
