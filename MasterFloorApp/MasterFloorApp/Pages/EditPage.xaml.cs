using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace MasterFloorApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для EditPage.xaml
    /// </summary>
    public partial class EditPage : Page
    {
        private bool IsAdding { get; set; } = true;
        private Model.Partners CurrentPartner { get; set; }
        public EditPage(Model.Partners Partner)
        {
            InitializeComponent();
            Init(Partner);
        }

        private void Init(Model.Partners Partner)
        {
            if(Partner != null)
            {
                CurrentPartner = Partner;
                IsAdding = false;
            }
            else
            {
                CurrentPartner = new Model.Partners();
            }
            var PartnerTypes = Model.MasterFloorDBEntities.GetContext().PartnerTypes.ToList();
            PartnerTypes.Insert(0, new Model.PartnerTypes() { Name = "Выберите тип" });
            TypeCB.ItemsSource = PartnerTypes;
            TypeCB.SelectedIndex = 0;
            if (!IsAdding)
            {
                NameTB.Text = CurrentPartner.Name;
                TypeCB.SelectedIndex = CurrentPartner.PartnerTypeId;
                RatingTB.Text = CurrentPartner.Rating.ToString();
                AdressTB.Text = $"{CurrentPartner.PostCodes.Name}, {CurrentPartner.Regions.Name}, {CurrentPartner.Cities.Name}, {CurrentPartner.Streets.Name}, " +
                    $"{CurrentPartner.HouseNumber}";
                FIOTB.Text = $"{CurrentPartner.Directors.SecondName} {CurrentPartner.Directors.FirstName} {CurrentPartner.Directors.PatronomycName}";
                PhoneTB.Text = CurrentPartner.Phone;
                EmailTB.Text = CurrentPartner.Email;
            }
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            if (Utils.Navigation.CurrentFrame.CanGoBack)
            {
                Utils.Navigation.CurrentFrame.GoBack();
            }
        }

        private void SaveButton_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
