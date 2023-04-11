using System.ComponentModel.DataAnnotations;
namespace TechJobs6Persistent.ViewModels
{


    public class AddEmployerViewModel
    {
        private string? location;

        [Required(ErrorMessage = "Name is required")]
        public string? Name { get; set; }

        [Required(ErrorMessage = "Location is required")]
        public string? Location { get => location; set => location = value; }
    }

}

//see ReadMe.md for explenation of code section AddEmployerViewModel.cs
