import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'El Cuchillo App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Roboto', // Puedes usar una fuente que se parezca más
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showLogin = false;

  void _toggleScreen() {
    setState(() {
      _showLogin = !_showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fondo negro
      body: Stack(
        children: [
          // Imagen de fondo (opcional, ahora se ajusta en un contenedor)

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: _toggleScreen, // Cambiar entre pantallas
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: _showLogin
                          ? _buildLoginScreen()
                          : _buildWelcomeScreen(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWelcomeScreen() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 8.0),
        Image.network(
          'data:image/png;base64,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', // Icono de cuchillo o imagen que desees
          height: 200.0,
        ),
        SizedBox(height: 32.0),
        Text(
          'Bienvenido a la APP\nde El Cuchillo®',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24.0,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16.0),
        Text(
          'Todas nuestras\ncarnes son 100%\nde la mejor\ncalidad posible',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 48.0),
        ElevatedButton(
          onPressed: () {
            _toggleScreen(); // Navegar a la pantalla de inicio de sesión
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent,
            padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          child: Text(
            'Entrar a APP!',
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginScreen() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: _toggleScreen, // Regresar a la pantalla principal
          ),
        ),
        SizedBox(height: 8.0),
        Image.network(
          'data:image/png;base64,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', // Icono de cuchillo o imagen que desees
          height: 150.0,
        ),
        SizedBox(height: 32.0),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Correo Electronico',
            labelStyle: TextStyle(color: Colors.white70),
            filled: true,
            fillColor: Colors.white12,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
          ),
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 16.0),
        TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Contraseña',
            labelStyle: TextStyle(color: Colors.white70),
            filled: true,
            fillColor: Colors.white12,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
          ),
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(height: 24.0),
        TextButton(
          onPressed: () {
            // Acción para "¿No tienes cuenta? Crear una"
          },
          child: Text(
            '¿No tienes cuenta? CREAR UNA',
            style: TextStyle(color: Colors.white70),
          ),
        ),
        SizedBox(height: 32.0),
        ElevatedButton(
          onPressed: () {
            // Acción para "INICIAR SESION"
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.redAccent,
            padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          child: Text(
            'INICIAR SESION',
            style: TextStyle(fontSize: 20.0, color: Colors.white),
          ),
        ),
        SizedBox(height: 24.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'CON:',
              style: TextStyle(color: Colors.white70),
            ),
            SizedBox(width: 16.0),
            // Aquí podrías añadir botones para iniciar sesión con Facebook y Google
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                'f',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(width: 8.0),
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white12,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                'G',
                style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
