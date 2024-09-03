import 'package:flutter/material.dart';
import 'package:most_cooking/utils/renkler.dart';
import 'package:most_cooking/views/pages/loginPage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  PageController _controller = PageController();
  int _currentPage = 0;

  List<String> _descriptions = [
    "HOŞ GELDİNİZ",
    "En lezzetli tarifleri keşfetmek ve paylaşmak için doğru yerdesiniz! 'Most Cooking' uygulamamız, yemek yapmayı sevenler için harika bir platform sunuyor.",
    "Kendi tariflerinizi 'Tarif Ekle' butonuna tıklayarak kolayca paylaşabilir, mutfak yeteneklerinizi tüm dünyayla buluşturabilirsiniz.",
    "Uygulamamızda başkalarının paylaştığı yüzlerce tarife göz atabilir, yeni lezzetler deneyebilir ve yemek yapma deneyiminizi zenginleştirebilirsiniz.",
    "Beğendiğiniz tarifleri favorilerinize ekleyerek, her zaman elinizin altında olmasını sağlayabilirsiniz.",
    "Tariflere puan verip yorum yaparak, mutfak topluluğumuza katkıda bulunabilirsiniz.",
    "Keyifli Yemekler! 'Most Cooking' ile her yemek bir keşif, her tarif bir macera!"
  ];

  Color _backgroundColor = Turuncu; // Arka plan rengi

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            controller: _controller,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemCount: _descriptions.length,
            itemBuilder: (context, index) {
              return _buildPage(
                description: _descriptions[index],
              );
            },
          ),
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Container(
              height: 200, // Logo yüksekliği
              child: Center(
                child: Image.asset('images/logo.png'), // Logo burada yer alacak
              ),
            ),
          ),
          Positioned(
            bottom: 90.0,
            left: 20.0,
            right: 20.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SmoothPageIndicator(
                  controller: _controller,
                  count: _descriptions.length,
                  effect: WormEffect(
                    dotColor: Colors.white.withOpacity(0.5),
                    activeDotColor: Colors.white,
                    dotHeight: 8,
                    dotWidth: 8,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text("Atla"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage({
    required String description,
  }) {
    return Container(
      color: _backgroundColor,
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20.0),
          Text(
            description,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
