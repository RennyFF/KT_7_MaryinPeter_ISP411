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
    /// Логика взаимодействия для HistoryList.xaml
    /// </summary>
    public partial class HistoryList : Page
    {
        public HistoryList(Model.Partners Partner)
        {
            InitializeComponent();
            HistoryListView.ItemsSource = Model.MasterFloorDBEntities.GetContext().PartnerProducts.Where(i => i.PartnerNameId == Partner.Id).ToList();

        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            if (Utils.Navigation.CurrentFrame.CanGoBack)
            {
                Utils.Navigation.CurrentFrame.GoBack();
            }
        }
    }
}
