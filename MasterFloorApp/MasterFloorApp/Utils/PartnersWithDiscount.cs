using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MasterFloorApp.Utils
{
    public class PartnersWithDiscount : Model.Partners
    {
        public int Discount { get; set; }
        public PartnersWithDiscount(Model.Partners partner)
        {
            this.Id = partner.Id;
            this.PartnerTypeId = partner.PartnerTypeId;
            this.Name = partner.Name;
            this.DirectorId = partner.DirectorId;
            this.Email = partner.Email;
            this.Phone = partner.Phone;
            this.PostCodeId = partner.PostCodeId;
            this.RegionId = partner.RegionId;
            this.CityId = partner.CityId;
            this.StreetId = partner.StreetId;
            this.HouseNumber = partner.HouseNumber;
            this.INN = partner.INN;
            this.Rating = partner.Rating;
            this.PartnerTypes = partner.PartnerTypes;
            this.Directors = partner.Directors;
            this.PostCodes = partner.PostCodes;
            this.Regions = partner.Regions;
            this.Cities = partner.Cities;
            this.Streets = partner.Streets;
            bool IsThereProducts = Model.MasterFloorDBEntities.GetContext().PartnerProducts
                .Any(i => i.PartnerNameId == partner.Id);
            var CountitySum = IsThereProducts ? Model.MasterFloorDBEntities.GetContext()
                .PartnerProducts.Where(i => i.PartnerNameId == partner.Id)
                .Sum(i => i.Countity) : 0;
            this.Discount = CountitySum < 10000 ? 0 
                : CountitySum >= 10000 && CountitySum < 50000 ? 5 
                : CountitySum >= 50000 && CountitySum < 300000 ? 10 
                : CountitySum >= 300000 ? 15 : 0;
        }
    }
}
