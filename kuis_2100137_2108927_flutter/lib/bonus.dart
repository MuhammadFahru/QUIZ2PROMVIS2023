import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  String pilihanFilterSatu = "Active Turn Over";
  String pilihanFilterSatuOut = "";
  String pilihanFilterDua = "1D";
  String pilihanFilterDuaOut = "";

  ListData data = ListData();

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> listSatu = [];
    List<DropdownMenuItem<String>> listDua = [];

    var item1 = const DropdownMenuItem<String>(
      value: "Active Turn Over",
      child: Text("Active Turn Over"),
    );

    var item2 = const DropdownMenuItem<String>(
      value: "Active Volume",
      child: Text("Active Volume"),
    );

    var item3 = const DropdownMenuItem<String>(
      value: "1D",
      child: Text("1D"),
    );

    var item4 = const DropdownMenuItem<String>(
      value: "1W",
      child: Text("1W"),
    );

    listSatu.add(item1);
    listSatu.add(item2);
    listDua.add(item3);
    listDua.add(item4);

    return MaterialApp(
        title: 'Hello App',
        home: Scaffold(
            appBar: AppBar(
                leading: const FlutterLogo(),
                backgroundColor: Colors.blueGrey,
                title: const Text('Quiz Flutter'),
                actions: const <Widget>[
                  ButtonNamaKelompok(),
                  ButtonPerjanjian()
                ]),
            body: Center(
              child: Column(children: [
                Row(
                  children: [
                    Expanded(
                      child: DropdownButton(
                        items: listSatu,
                        value: pilihanFilterSatu,
                        onChanged: (String? newValue) {
                          setState(() {
                            if (newValue != null) {
                              if (newValue == "Active Turn Over") {
                                data.items = ListData.itemsTurnOver;
                              } else {
                                data.items = ListData.itemsVolume;
                              }
                              pilihanFilterSatu = newValue;
                            }
                          });
                        },
                        isExpanded: true,
                      ),
                    ),
                    DropdownButton(
                      items: listDua,
                      value: pilihanFilterDua,
                      onChanged: (String? newValue) {
                        setState(() {
                          if (newValue != null) {
                            pilihanFilterDua = newValue;
                          }
                        });
                      },
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: data.items.length,
                      itemBuilder: (context, index) {
                        return Card(
                            child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
        flex: 7,
        child: Container(
                                        child: Column(
                                      children: [
                                        Text(
                                          data.items[index].kode,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Text("Volume"),
                                        const Text("Turn Over"),
                                      ],
                                    ))),
                                    Container(
                                        child: Column(
                                      children: [
                                        Text(data.items[index].nama),
                                        Text(data.items[index].vol),
                                        Text(data.items[index].turnOver),
                                      ],
                                    )),
                                    Container(
                                        child: Column(
                                      children: [
                                        Text(data.items[index].harga,
                                            textAlign: TextAlign.right,
                                            style: data.items[index]
                                                        .statusSaham ==
                                                    1
                                                ? const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.green)
                                                : const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.red)),
                                        Text(
                                          data.items[index].freq,
                                          textAlign: TextAlign.right,
                                        ),
                                      ],
                                    )),
                                    Container(
                                        padding: const EdgeInsets.all(10.0),
                                        color:
                                            data.items[index].statusSaham == 1
                                                ? Colors.green
                                                : Colors.red,
                                        child: Column(
                                          children: [
                                            Text(data.items[index].naikTurun,
                                                style: const TextStyle(
                                                    color: Colors.white)),
                                            Text(data.items[index].pctNaikTurun,
                                                style: const TextStyle(
                                                    color: Colors.white)),
                                          ],
                                        )),
                                  ],
                                )));
                      }),
                ),
              ]),
            )));
  }
}

class ButtonNamaKelompok extends StatelessWidget {
  const ButtonNamaKelompok({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.account_circle_rounded),
      onPressed: () {
        // icon account di tap
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Kelompok 8'),
            content: const Text(
                'Muhamad Nur Yasin Amadudin (mnyasin26@upi.edu) ; Muhammad Fahru Rozi (muhammadfahru@upi.edu)'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ButtonPerjanjian extends StatelessWidget {
  const ButtonPerjanjian({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.access_alarm_rounded),
      onPressed: () {
        // icon setting ditap
        const snackBar = SnackBar(
          duration: Duration(seconds: 20),
          content: Text(
              'Kami berjanji tidak akan berbuat curang dan atau membantu kelompok lain berbuat curang'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}

class ListData {
  static final List itemsTurnOver = [
    Data(
        kode: "GOTO",
        nama: "GoTo Gojek Tokopedia Tbk",
        vol: "2.3B",
        turnOver: "283.2B",
        harga: "122",
        naikTurun: "-4",
        pctNaikTurun: "-3.17%",
        freq: "1,238",
        statusSaham: 2),
    Data(
        kode: "BBRI",
        nama: "Bank Rakyat Indonesia (Perseo) Tbk",
        vol: "125M",
        turnOver: "605B",
        harga: "4820",
        naikTurun: "+80",
        pctNaikTurun: "+2.00%",
        freq: "4,238",
        statusSaham: 1),
    Data(
        kode: "TLKM",
        nama: "Telkom Indonesia (Persero) Tbk",
        vol: "77M",
        turnOver: "310B",
        harga: "4810",
        naikTurun: "+100",
        pctNaikTurun: "+5.00%",
        freq: "7,238",
        statusSaham: 1),
    Data(
        kode: "ANTM",
        nama: "Aneka Tambang Tbk",
        vol: "65.7M",
        turnOver: "121.8B",
        harga: "1830",
        naikTurun: "-20",
        pctNaikTurun: "-1.08%",
        freq: "8,238",
        statusSaham: 2),
    Data(
        kode: "BBCA",
        nama: "Bank Central Asia Tbk",
        vol: "59.6M",
        turnOver: "506B",
        harga: "8450",
        naikTurun: "-125",
        pctNaikTurun: "-1.46%",
        freq: "8,238",
        statusSaham: 2),
  ];

  static final List itemsVolume = [
    Data(
        kode: "GOTO",
        nama: "GoTo Gojek Tokopedia Tbk",
        vol: "2.3B",
        turnOver: "283.2B",
        harga: "122",
        naikTurun: "-4",
        pctNaikTurun: "-3.17%",
        freq: "1,238",
        statusSaham: 2),
    Data(
        kode: "BBRI",
        nama: "Bank Rakyat Indonesia (Perseo) Tbk",
        vol: "125M",
        turnOver: "605B",
        harga: "4820",
        naikTurun: "+80",
        pctNaikTurun: "+2.00%",
        freq: "4,238",
        statusSaham: 1),
    Data(
        kode: "TLKM",
        nama: "Telkom Indonesia (Persero) Tbk",
        vol: "77M",
        turnOver: "310B",
        harga: "4810",
        naikTurun: "+100",
        pctNaikTurun: "+5.00%",
        freq: "7,238",
        statusSaham: 1),
    Data(
        kode: "ANTM",
        nama: "Aneka Tambang Tbk",
        vol: "65.7M",
        turnOver: "121.8B",
        harga: "1830",
        naikTurun: "-20",
        pctNaikTurun: "-1.08%",
        freq: "8,238",
        statusSaham: 2),
    Data(
        kode: "BBCA",
        nama: "Bank Central Asia Tbk",
        vol: "59.6M",
        turnOver: "506B",
        harga: "8450",
        naikTurun: "-125",
        pctNaikTurun: "-1.46%",
        freq: "8,238",
        statusSaham: 2),
  ];

  List items = itemsTurnOver;
}

class Data {
  String kode = "";

  String nama = "";

  String vol = "";

  String turnOver = "";

  String harga = "";

  String naikTurun = "";

  String pctNaikTurun = "";

  String freq = "";

  int statusSaham = 0; // 0 = stagnan, 1 = naik, 2 = turun

  Data(
      {required this.kode,
      required this.nama,
      required this.vol,
      required this.turnOver,
      required this.harga,
      required this.naikTurun,
      required this.pctNaikTurun,
      required this.freq,
      required this.statusSaham});
}
