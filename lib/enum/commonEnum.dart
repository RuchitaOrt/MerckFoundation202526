enum AppBarType { home, inner }

enum ProgramType {
  mtm,
  strategy,
  ambassadors,
  scholarships,
  awards,
  empoweringBerna,
  songsStories,
  videos,
  cancer,
  stem,
  firstLadies,
  africa,
  educatingLinda,
  nationwide,
  capacity,
}

enum MediaType {
  stories,
  videoLibrary,
  testimonial,
  photoGallery,
  activity,
  digitalLibrary,
  digitalLibraryall,
  testimonialArticle,
  photoAlbum,
  episodes,
  ambassadorAlbum,
  all
}

enum HomeSectionType {
  content,
  videos,
  ceoMessage,
  gallery,
  testimonial,
  episodes,
}

const tabTypes = [
  HomeLayoutType.CallForApplication,
  HomeLayoutType.MerckMoreThanAmbasdar,
  HomeLayoutType.DigitalLibrary,
];

enum HomeLayoutType {
  slider,
  impact,
  photoGallery,
  episodes,
  video,
  newsLettersAndArticles,
  merckFoundationInMedia,
  testimonials,
  content,
  leadership,
  marquee,
  socialLinks,
  CallForApplication,
  DigitalLibrary,
MerckMoreThanAmbasdar,
  episodesviewall,
  nocontent,
  MenuManagement,
  OurProgramsManagement,
  award,
  season,
  MerckMoreThanAmbasdarFormer,
  PhotoCategory
}

extension HomeLayoutTypeExtension on String {
  HomeLayoutType toHomeLayoutType() {
    switch (this) {
      case "Slider":
        return HomeLayoutType.slider;

      case "Impact":
        return HomeLayoutType.impact;

      case "Episodes":
        return HomeLayoutType.episodes;
      case "PhotoGallery":
        return HomeLayoutType.photoGallery;

      case "Video":
        return HomeLayoutType.video;

      case "NewsLettersAndArticles":
        return HomeLayoutType.newsLettersAndArticles;

      case "MerckFoundationInMedia":
        return HomeLayoutType.merckFoundationInMedia;

      case "Testimonials":
        return HomeLayoutType.testimonials;

      case "Content":
        return HomeLayoutType.content;

      case "LeaderShip":
        return HomeLayoutType.leadership;

      case "Marquee":
        return HomeLayoutType.marquee;

      case "SocialLinks":
        return HomeLayoutType.socialLinks;
      
      case "CallForApplication":
        return HomeLayoutType.CallForApplication;
        case "DigitalLibrary":
        return HomeLayoutType.DigitalLibrary;
         case "MerckMoreThanAmbasdar":
        return HomeLayoutType.MerckMoreThanAmbasdar;
      case "Menu Management":
        return HomeLayoutType.MenuManagement;
      case "Our Programs Management":
        return HomeLayoutType.OurProgramsManagement;
      case "Awards":
        return HomeLayoutType.award;
      case "Season":
        return HomeLayoutType.season;
        case 'MerckMoreThanAmbasdarFormer':
        return HomeLayoutType.MerckMoreThanAmbasdarFormer;
        case 'Photo Category':
        return HomeLayoutType.PhotoCategory;

      default:
        return HomeLayoutType.nocontent;
    }
  }
}
