class Movie {
  String name;
  String genres;
  String description;
  String releaseDate;
  String rating;
  String writer;
  String imageAsset;
  List<String> imageUrls;

  Movie({
    required this.name,
    required this.genres,
    required this.description,
    required this.releaseDate,
    required this.rating,
    required this.writer,
    required this.imageAsset,
    required this.imageUrls,
  });
}

var movieList = [
  Movie(
    name: 'Jujutsu Kaisen 0: The Movie',
    genres: 'Animation, Action, Fantasy',
    description:
        'Yuta Okkotsu, seorang siswa sekolah menengah yang memperoleh kendali dari Roh Terkutuk yang sangat kuat dan didaftarkan di Sekolah Menengah Jujutsu Prefektur Tokyo oleh Penyihir Jujutsu untuk membantunya mengendalikan kekuatannya dan mengawasinya.',
    releaseDate: '24 December 2021',
    rating: '9.3/10',
    writer: 'Gege Akutami',
    imageAsset: 'images/mov/jjk.jpg',
    imageUrls: [
      'https://img.okezone.com/content/2022/03/21/206/2565478/jujutsu-kaisen-0-salip-uncharted-dan-susul-the-batman-di-box-office-amerika-033XpVER9f.jpg',
      'https://cdn.oneesports.gg/cdn-data/2022/02/JujutsuKaisen0_SatoruGojo-1024x576.webp',
      'https://br.atsit.in/id/wp-content/uploads/2021/12/apakah-film-jujutsu-kaisen-0-memiliki-tanggal-rilis-internasional.jpg',
      'https://static1.cbrimages.com/wordpress/wp-content/uploads/2022/01/Jujutsu-Kaisen-0-Promo-Still.jpg',
      'https://assets.promediateknologi.com/crop/0x0:0x0/x/photo/2022/02/11/1204298216.jpg',
    ],
  ),
  Movie(
    name: 'Fantastic Beasts: The Secrets of Dumbledore',
    genres: 'Adventure, Family, Fantasy',
    description:
        'Profesor Albus Dumbledore mengetahui penyihir Gelap yang kuat Gellert Grindelwald bergerak untuk menguasai dunia sihir. Karena tidak dapat menghentikannya sendirian, dia mempercayakan Magizoologist Newt Scamander untuk memimpin tim yang terdiri dari para penyihir dan seorang pembuat roti Muggle yang pemberani bergabung sebuah dalam misi berbahaya',
    releaseDate: '13 April 2022',
    rating: '8.8/10',
    writer: 'J.K. Rowling',
    imageAsset: 'images/mov/fantasticbeast.jpg',
    imageUrls: [
      'https://entertainmentfunonline.co.in/wp-content/uploads/2022/03/Fantastic-Beasts-The-Secrets-of-Dumbledore-Entertainment-Fun-Online.jpg',
      'https://consequence.net/wp-content/uploads/2021/12/fantastic-beasts-secrets-of-dumbledore-first-trailer-jude-law-mads-mikkelsen-eddie-redmayne-watch.jpg?quality=80&w=1031&h=580&crop=1&resize=1031%2C580&strip',
      'https://indiewire.com/wp-content/uploads/2021/12/Screen-Shot-2021-12-10-at-12.09.21-PM.png',
      'https://thumb.viva.co.id/media/frontend/thumbs3/2021/12/14/61b8696f61aa1-fantastic-beasts-the-secrets-of-dumbledore_665_374.jpg',
    ],
  ),
  Movie(
    name: 'Uncharted',
    genres: 'Action, Adventure',
    description:
        'Nathan Drake yang pintar jalanan direkrut oleh pemburu harta karun berpengalaman Victor "Sully" Sullivan untuk memulihkan kekayaan yang dikumpulkan oleh Ferdinand Magellan, dan hilang 500 tahun yang lalu oleh House of Moncada.',
    releaseDate: '18 Februari 2022',
    rating: '6.6/10',
    writer: 'Rafe Judkins',
    imageAsset: 'images/mov/uncharted.jpg',
    imageUrls: [
      'https://static.republika.co.id/uploads/images/inpicture_slide/070035600-1645503992-620cae74d9caa-unchartedjpg.jpg',
      'https://cdn0-production-images-kly.akamaized.net/MIEV6uKnOhvGJQpgffnZy9zJApU=/640x360/smart/filters:quality(75):strip_icc():format(jpeg)/kly-media-production/medias/3936400/original/042579700_1645018253-Uncharted.jpg',
      'https://cdn.antaranews.com/cache/800x533/2021/04/02/Uncharted.jpg',
      'https://cdn.popbela.com/content-images/post/20220216/uncharted-1-b462c75c0f36e378013de7e9c9fbed65_750x500.jpg',
    ],
  ),
  Movie(
    name: 'The Batman',
    genres: 'Action, Crime, Drama',
    description:
        'Ketika Riddler, seorang pembunuh berantai sadis, mulai membunuh tokoh-tokoh politik penting di Gotham, Batman terpaksa menyelidiki korupsi tersembunyi di kota itu dan mempertanyakan keterlibatan keluarganya.',
    releaseDate: '18 Februari 2022',
    rating: '8.3/10',
    writer: 'Matt Reeves',
    imageAsset: 'images/mov/thebatman.jpg',
    imageUrls: [
      'https://img.okezone.com/content/2022/04/11/206/2576977/the-batman-jadi-film-terlaris-di-2022-tPXlmU0S9d.jpg',
      'https://timlo.net/wp-content/uploads/2022/02/the-batman-21.jpg',
      'https://asset.kompas.com/crops/eLWuQb8zEKmpYPtZTUcy12DgQok=/56x0:643x391/750x500/data/photo/2020/09/30/5f7422e2b049d.jpg',
      'https://ichef.bbci.co.uk/news/640/cpsprodpb/10A8C/production/_123563286_583a270d-c6f7-4aed-a098-af71ee111f4b.jpg',
      'https://kutukata.id/wp-content/uploads/2022/03/The-Batman.jpg',
    ],
  ),
  Movie(
    name: 'Scream 5',
    genres: 'Horror, Mystery, Thriller',
    description:
        'Dua puluh lima tahun setelah serangkaian pembunuhan brutal mengejutkan kota Woodsboro yang tenang, seorang pembunuh baru telah mengenakan topeng Ghostface dan mulai menargetkan sekelompok remaja untuk menghidupkan kembali rahasia dari masa lalu kota yang mematikan.',
    releaseDate: '12 Januari 2022',
    rating: '6.4/10',
    writer: 'James Vanderbilt',
    imageAsset: 'images/mov/scream5.jpg',
    imageUrls: [
      'https://media.suara.com/pictures/970x544/2022/03/09/95519-cuplikan-film-scream-5-imdb.jpg',
      'https://merahputih.com/media/33/44/07/334407107951cdca663215130a8daa7d.jpeg',
      'https://i0.wp.com/bloody-disgusting.com/wp-content/uploads/2021/10/jenna-ortega-scream.png?fit=1500%2C844&ssl=1',
    ],
  ),
  Movie(
    name: 'Hotel Transylvania: Transformania',
    genres: 'Animation, Adventure, Comedy',
    description:
        'Setelah satu percobaan, Johnny berubah menjadi monster dan semua orang menjadi manusia. Sekarang harus dilihat apakah mereka akan mampu membalikkan percobaan ini.',
    releaseDate: '14 Januari 2022',
    rating: '6.0/10',
    writer: 'Amos Vernon',
    imageAsset: 'images/mov/hotel.jpg',
    imageUrls: [
      'https://imgsrv2.voi.id/t0Cw4aMulNrlk2hbAmf2oITb2cGlxgKJJCrEB7WGOBA/auto/1200/675/sm/1/bG9jYWw6Ly8vcHVibGlzaGVycy82MDc5My8yMDIxMDYyMTE3MDQtbWFpbi5jcm9wcGVkXzE2MjQyNjk4ODIuanBn.jpg',
      'https://variety.com/wp-content/uploads/2018/07/hotel-transylvania-3-summer-vacation.jpg',
      'https://3.bp.blogspot.com/-Sw5k1Fq4kuM/UiCaGhipQ3I/AAAAAAAAAn0/HvmghHypL2M/s1600/hotel_t_keys4.jpg',
      'https://cineverse.id/wp-content/uploads/2022/01/Review-4-HT4-4.jpg',
    ],
  ),
];
