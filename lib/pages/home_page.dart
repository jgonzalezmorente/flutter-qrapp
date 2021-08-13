
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:qr_app/providers/scan_list_provider.dart';
import 'package:qr_app/providers/ui_provider.dart';

import 'package:qr_app/pages/direcciones_page.dart';
import 'package:qr_app/pages/mapas_page.dart';

//import 'package:qr_app/pages/mapas_page.dart';
import 'package:qr_app/widgets/custom_navigatorbar.dart';
import 'package:qr_app/widgets/scan_button.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text('Historial'),
        actions: [
          IconButton(
            icon: Icon( Icons.delete_forever ),
            onPressed: () {
              Provider.of<ScanListProvider>( context, listen: false ).borrarTodos();              
            })
        ],
      ),
      body: _HomePageBody(),
     bottomNavigationBar: CustomNaviagtorBar(),
     floatingActionButton: ScanButton(),
     floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
   );
  }
}


class _HomePageBody extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    // Obtener el selected menu opt
    final uiProvider = Provider.of<UiProvider>( context );

    // Cambiar para mostrar la página respectiva
    int currentIndex = uiProvider.selectedMenuOpt;

    // Usar el ScanListProvider
    final scanListProvider = Provider.of<ScanListProvider>( context, listen: false );

    switch( currentIndex ) {      

      case 0:
        scanListProvider.cargarScansPorTipo( 'geo' );
        return MapasPage();

      case 1:
        scanListProvider.cargarScansPorTipo( 'http' );
        return DireccionesPage();

      default:
        scanListProvider.cargarScansPorTipo( 'geo' );    
        return MapasPage();
    }

  }
}