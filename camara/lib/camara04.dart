import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App de Cámara Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GaleriaPublicaListaScreen(),
    );
  }
}

class GaleriaPublicaListaScreen extends StatefulWidget {
  const GaleriaPublicaListaScreen({Key? key}) : super(key: key);

  @override
  State<GaleriaPublicaListaScreen> createState() => _GaleriaPublicaListaScreenState();
}

class _GaleriaPublicaListaScreenState extends State<GaleriaPublicaListaScreen> {
  List<AssetEntity> _mediaList = [];
  bool _permisoConcedido = false;

  @override
  void initState() {
    super.initState();
    _cargarFotos();
  }

  // Solicitar permisos y cargar las imágenes
  Future<void> _cargarFotos() async {
    // Solicitar permiso de lectura de galería
    final PermissionState ps = await PhotoManager.requestPermissionExtend();

    if (ps.isAuth || ps.hasAccess) {
      setState(() {
        _permisoConcedido = true;
      });

      // Obtener las rutas de los álbumes (por defecto el primero suele ser "Recent")
      List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
        type: RequestType.image, // Solo imágenes
        onlyAll: true,
      );

      if (albums.isNotEmpty) {
        // Obtener las primeras 100 fotos del álbum principal
        List<AssetEntity> photos = await albums[0].getAssetListRange(
          start: 0,
          end: 100,
        );

        setState(() {
          _mediaList = photos;
        });
      }
    } else {
      // El usuario denegó los permisos
      PhotoManager.openSetting();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galería del Dispositivo'),
      ),
      body: !_permisoConcedido
          ? const Center(
        child: Text(
          'Se requieren permisos para acceder a la galería.',
          textAlign: TextAlign.center,
        ),
      )
          : _mediaList.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 3 columnas en la cuadrícula
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: _mediaList.length,
        itemBuilder: (context, index) {
          final AssetEntity asset = _mediaList[index];
          return FutureBuilder(
            // Generar una miniatura optimizada para cada foto
            future: asset.thumbnailDataWithSize(const ThumbnailSize(200, 200)),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                return Image.memory(
                  snapshot.data!,
                  fit: BoxFit.cover,
                );
              }
              return Container(color: Colors.grey[200]);
            },
          );
        },
      ),
    );
  }
}