using System.Windows;
using SD_DB;
using MaterialDesignThemes.Wpf;
using Application = System.Windows.Application;
using System.Windows.Input;
using System.Collections.Generic;
using System;
using System.Runtime.InteropServices.ComTypes;

namespace Main
{
 

    public partial class MainWindow : Window
    {

        static SD_DBContainer dB;
        public MainWindow()
        {
            dB = new SD_DBContainer();
            InitializeComponent();
            var DataDir = "C:\\USERS\\BAJAR\\ONEDRIVE\\SZAKDOLGOZAT\\SDSOFT\\SD_DB\\";
            AppDomain.CurrentDomain.SetData("DataDirectory", DataDir);


        }
        # region Fekete téma beállítása
        public bool IsDarkTheme { get; set; }
        private readonly PaletteHelper paletteHelper = new PaletteHelper();

        private void toggleTheme(object sender, RoutedEventArgs e)
        {
            ITheme theme = paletteHelper.GetTheme();
            if(IsDarkTheme=theme.GetBaseTheme()==BaseTheme.Dark)
            {
                IsDarkTheme = false;
                theme.SetBaseTheme(Theme.Light);
                
            }
            else
            {
                IsDarkTheme = true;
                theme.SetBaseTheme(Theme.Dark);
            }
            paletteHelper.SetTheme(theme);
        }
        #endregion
        #region Alkalmazás bezárása
        private void exitApp(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }
        #endregion
        #region Alkalmazás mozgatása
        protected override void OnMouseLeftButtonDown(MouseButtonEventArgs e)
        {
            base.OnMouseLeftButtonDown(e);
            DragMove();
        }
        #endregion



        private void btnLogin_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if(txtPassword.Password=="" || txtUsername.Text=="")
                {
                    throw new Exception("Nincs kitöltve az összes mező!");
                }
                bool van_ilyen_felhasznalo = false;
                foreach (var x in dB.Felhasznalok)
                {
                    if (txtPassword.Password == x.Jelszo && txtUsername.Text == x.Felhasznalonev)
                    {
                        van_ilyen_felhasznalo = true;
                        break;
                    }  
                }
                if (van_ilyen_felhasznalo) MessageBox.Show("Sikeresen bejelentkezett", "Bejelentkezés", MessageBoxButton.OK, MessageBoxImage.Information);
                else MessageBox.Show("Hibás felhasználónév vagy jelszó!", "Bejelentkezés", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            catch (Exception exeption)
            {
                MessageBox.Show(exeption.Message,"Hiba!",MessageBoxButton.OK,MessageBoxImage.Error);
            }

          
           
            
        }

        private void btnForgetPasswd_Click(object sender, RoutedEventArgs e)
        {

        }

        private void btnSignUp_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
