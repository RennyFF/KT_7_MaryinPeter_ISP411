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
            try
            {
                if (Partner != null)
                {
                    CurrentPartner = Partner;
                    IsAdding = false;
                    HeaderText.Text = "Редактирование пользователя";
                }
                else
                {
                    CurrentPartner = new Model.Partners();
                    HeaderText.Text = "Добавление пользователя";
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
            catch (Exception)
            {
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
            try
            {
                var Context = Model.MasterFloorDBEntities.GetContext();
                string Name = NameTB.Text;
                int SelectedType = TypeCB.SelectedIndex;
                string Adress = AdressTB.Text;
                string FIO = FIOTB.Text;
                string Phone = PhoneTB.Text;
                string Email = EmailTB.Text;
                int Rating;
                StringBuilder errors = new StringBuilder();
                if (string.IsNullOrEmpty(Name)) { errors.AppendLine("Заполните наименование!"); };
                if (string.IsNullOrEmpty(Adress)) { errors.AppendLine("Заполните адрес!"); }
                else
                {
                    if (Adress.Split(',').Length != 5)
                    {
                        errors.AppendLine("Заполните адрес правильно!");
                    }
                }
                if (string.IsNullOrEmpty(FIO)) { errors.AppendLine("Заполните ФИО директора!"); }
                else
                {
                    if (FIO.Split(' ').Length != 3)
                    {
                        errors.AppendLine("Заполните ФИО правильно!");
                    }
                }
                if (string.IsNullOrEmpty(Phone)) { errors.AppendLine("Заполните номер телефона!"); };
                if (string.IsNullOrEmpty(Email)) { errors.AppendLine("Заполните почту!"); };
                if (SelectedType == 0) { errors.AppendLine("Выберите тип организации!"); };
                if (!int.TryParse(RatingTB.Text, out int result)) { errors.AppendLine("Рейтинг не целое число!"); Rating = result; }
                else
                {
                    Rating = int.Parse(RatingTB.Text);
                    if (Rating < 0)
                    {
                        errors.AppendLine("Рейтинг отрицательное число!");
                    }
                }
                if (errors.Length > 0)
                {
                    MessageBox.Show(errors.ToString(), "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
                CurrentPartner.Name = Name;
                CurrentPartner.Phone = Phone;
                CurrentPartner.Email = Email;
                CurrentPartner.Rating = Rating;
                CurrentPartner.PartnerTypeId = SelectedType;
                var SplittedFIO = FIO.Split(' ');
                string TempSName = SplittedFIO[0].Trim().ToLower();
                string TempFName = SplittedFIO[1].Trim().ToLower();
                string TempPName = SplittedFIO[2].Trim().ToLower();
                var DirectorDB = Context.Directors.Where(i => i.FirstName.ToLower() == TempFName && i.SecondName.ToLower() == TempSName && i.PatronomycName.ToLower() == TempPName).FirstOrDefault();
                if (DirectorDB == null)
                {
                    Model.Directors NewDirector = new Model.Directors() { FirstName = TempFName, SecondName = TempSName, PatronomycName = TempPName };
                    Context.Directors.Add(NewDirector);
                    Context.SaveChanges();
                    CurrentPartner.DirectorId = NewDirector.Id;
                }
                else
                {
                    CurrentPartner.DirectorId = DirectorDB.Id;
                }
                var SplittedAdress = Adress.Split(',');
                string TempPostCode = SplittedAdress[0].Trim();
                string TempRegion = SplittedAdress[1].Trim();
                string TempCity = SplittedAdress[2].Trim();
                string TempStreet = SplittedAdress[3].Trim();
                var PostcodesDB = Context.PostCodes.Where(i => i.Name.ToLower() == TempPostCode.ToLower()).FirstOrDefault();
                if (PostcodesDB == null)
                {
                    Model.PostCodes NewPostCode = new Model.PostCodes() { Name = TempPostCode };
                    Context.PostCodes.Add(NewPostCode);
                    Context.SaveChanges();
                    CurrentPartner.PostCodeId = NewPostCode.Id;
                }
                else
                {
                    CurrentPartner.PostCodeId = PostcodesDB.Id;
                }
                var RegionsDB = Context.Regions.Where(i => i.Name.Trim().ToLower() == TempRegion.ToLower()).FirstOrDefault();
                if (RegionsDB == null)
                {
                    Model.Regions NewRegion = new Model.Regions() { Name = TempRegion };
                    Context.Regions.Add(NewRegion);
                    Context.SaveChanges();
                    CurrentPartner.RegionId = NewRegion.Id;
                }
                else
                {
                    CurrentPartner.RegionId = RegionsDB.Id;
                }
                var CitiesDB = Context.Cities.Where(i => i.Name.Trim().ToLower() == TempCity.ToLower()).FirstOrDefault();
                if (CitiesDB == null)
                {
                    Model.Cities NewCities = new Model.Cities() { Name = TempCity };
                    Context.Cities.Add(NewCities);
                    Context.SaveChanges();
                    CurrentPartner.CityId = NewCities.Id;
                }
                else
                {
                    CurrentPartner.CityId = CitiesDB.Id;
                }
                var StreetsDB = Context.Streets.Where(i => i.Name.Trim().ToLower() == TempStreet.ToLower()).FirstOrDefault();
                if (StreetsDB == null)
                {
                    Model.Streets NewStreet = new Model.Streets() { Name = TempStreet };
                    Context.Streets.Add(NewStreet);
                    Context.SaveChanges();
                    CurrentPartner.StreetId = NewStreet.Id;
                }
                else
                {
                    CurrentPartner.StreetId = StreetsDB.Id;
                }
                CurrentPartner.HouseNumber = SplittedAdress[4].Trim();

                if (IsAdding)
                {
                    Context.Partners.Add(CurrentPartner);
                    Context.SaveChanges();
                    MessageBox.Show("Пользователь успешно добавлен!", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                    Utils.Navigation.CurrentFrame.Navigate(new Pages.PartnersListView());
                }
                else
                {
                    Context.SaveChanges();
                    MessageBox.Show("Пользователь успешно отредактирован!", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                    Utils.Navigation.CurrentFrame.Navigate(new Pages.PartnersListView());
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
    }
}
