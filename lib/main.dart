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
          "https://github.com/CESARIIN0/imagen2/blob/main/imagen.png", // IMAGEN MI CHAVO
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
          "https://github.com/CESARIIN0/imagen2/blob/main/imagen.png" // IMAGEN MI CHAVO
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
