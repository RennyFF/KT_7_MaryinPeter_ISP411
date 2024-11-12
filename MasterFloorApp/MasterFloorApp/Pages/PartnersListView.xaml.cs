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
    /// Логика взаимодействия для PartnersListView.xaml
    /// </summary>
    public partial class PartnersListView : Page
    {
        public PartnersListView()
        {
            InitializeComponent();
            Init();
        }

        private void Init()
        {
            var partners = Model.MasterFloorDBEntities.GetContext().Partners.ToList();
            PartnersList.ItemsSource = partners;
        }

        private void EditButton_Click(object sender, RoutedEventArgs e)
        {
            Utils.Navigation.CurrentFrame.Navigate(new Pages.EditPage((sender as Button).DataContext as Model.Partners));
        }

        private void HistoryButton_Click(object sender, RoutedEventArgs e)
        {
            Utils.Navigation.CurrentFrame.Navigate(new Pages.HistoryList((sender as Button).DataContext as Model.Partners));
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            Utils.Navigation.CurrentFrame.Navigate(new Pages.EditPage(null));
        }
    }
}
