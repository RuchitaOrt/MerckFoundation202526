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
  capacity
}
enum MediaType {
  stories,
  videoLibrary,
  testimonial,
  photoGallery,
  activity,
  digitalLibrary,
  testimonialArticle,
  photoAlbum,episodes,
 
}
// const homelayoutOrder = {
//   "Slider": 1,
//   "Content": 2,
//   "Marquee": 3,
//   "SocialLinks": 4,
//   "Impact": 5,

//   "Video": 6,
//   "NewsLettersAndArticles": 7,
//   "Episodes": 8,
//   "MerckFoundationInMedia": 9,
//   "PhotoGallery": 10,
//   "Testimonials": 11,

//   // Tabs always last
//   "CallForApplication": 100,
//   "MerckMoreThanAmbasdar": 101,
//   "DigitalLibrary": 102,
// };
const tabTypes = [
  "CallForApplication",
  "MerckMoreThanAmbasdar",
  "DigitalLibrary",
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
  episodesviewall,
  nocontent,
  MenuManagement
}

extension HomeLayoutTypeExtension on String {
  HomeLayoutType toHomeLayoutType() {
    switch (this) {
      case "Slider":
        return HomeLayoutType.slider;

      case "Impact":
        return HomeLayoutType.impact;

      case "PhotoGallery":
        return HomeLayoutType.photoGallery;

      case "Episodes":
        return HomeLayoutType.episodes;

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
         case "Menu Management":
        return HomeLayoutType.MenuManagement;

      default:
        return HomeLayoutType.  nocontent
;
    }
  }
}