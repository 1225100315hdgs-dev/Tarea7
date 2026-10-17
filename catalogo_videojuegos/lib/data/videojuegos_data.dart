import '../models/videojuego.dart';

// Categorias que aparecen como chips en la pantalla principal.
const List<String> categorias = [
  'Todos',
  'Aventura',
  'Carreras',
  'Simulación',
  'Plataformas',
  'Multijugador'
  'Acción',
  
];

// Datos de ejemplo (mock data). Las calificaciones son inventadas,
// solo sirven para alimentar la app.
const List<Videojuego> videojuegos = [
  Videojuego(
    id: 'zelda',
    genero: 'Acción y aventura',
    jugadores: '1 jugador',
    color: 0xFF2E7D32,
    caracteristicas: [
      'Mundo abierto que se explora con total libertad',
      'Más de cien santuarios con acertijos',
      'Se puede cocinar con los ingredientes que encuentras',
      'Las armas se desgastan y se rompen',
    ],
    nombre: 'The Legend of Zelda: Breath of the Wild',
    categoria: 'Aventura',
    descripcionCorta: 'Explora un enorme mundo abierto con Link.',
    descripcionLarga:
        'Link despierta después de cien años y tiene que recorrer el reino '
        'de Hyrule para derrotar a Ganon. El juego te deja explorar casi '
        'todo el mapa a tu ritmo: escalar montañas, cocinar, resolver '
        'santuarios y pelear con enemigos de muchas formas.',
    imagen: 'assets/images/zelda.png',
    desarrollador: 'Nintendo',
    anio: 2017,
    plataformas: 'Nintendo Switch',
    calificacion: 4.9,
    datoCurioso:
        'Después de la primera zona puedes ir casi a cualquier lugar del '
        'mapa.',
  ),
  Videojuego(
    id: 'mariokart',
    genero: 'Carreras',
    jugadores: '1 a 4 jugadores en una consola, o en línea',
    color: 0xFFD32F2F,
    caracteristicas: [
      'Muchas pistas, clásicas y nuevas',
      'Objetos para atacar a tus rivales',
      'Modo batalla con globos',
      'Pantalla dividida para jugar con amigos',
    ],
    nombre: 'Mario Kart 8 Deluxe',
    categoria: 'Carreras',
    descripcionCorta: 'Carreras con objetos, trampas y mucha diversión.',
    descripcionLarga:
        'Juego de carreras con personajes de Mario donde puedes usar '
        'objetos para frenar a tus rivales. Tiene muchas pistas y se puede '
        'jugar con amigos en la misma consola o por internet.',
    imagen: 'assets/images/mariokart.png',
    desarrollador: 'Nintendo',
    anio: 2017,
    plataformas: 'Nintendo Switch',
    calificacion: 4.8,
    datoCurioso:
        'Es una versión mejorada de Mario Kart 8, que salió antes en Wii U.',
  ),
  Videojuego(
    id: 'stardew',
    genero: 'Simulación y rol',
    jugadores: 'Un jugador o cooperativo',
    color: 0xFF8D6E63,
    caracteristicas: [
      'Cultivos que cambian con las estaciones',
      'Pesca, minería y cuidado de animales',
      'Puedes casarte con personajes del pueblo',
      'Festivales durante el año',
    ],
    nombre: 'Stardew Valley',
    categoria: 'Simulación',
    descripcionCorta: 'Hereda una granja y empieza una vida tranquila.',
    descripcionLarga:
        'Recibes la granja de tu abuelo y poco a poco la haces crecer: '
        'siembras cultivos, cuidas animales, pescas, exploras minas y haces '
        'amistad con la gente del pueblo.',
    imagen: 'assets/images/stardew.png',
    desarrollador: 'ConcernedApe',
    anio: 2016,
    plataformas: 'PC, consolas y móviles',
    calificacion: 4.9,
    datoCurioso: 'Lo creó una sola persona: Eric Barone.',
  ),
  Videojuego(
    id: 'hollow',
    genero: 'Metroidvania de acción',
    jugadores: '1 jugador',
    color: 0xFF37474F,
    caracteristicas: [
      'Mapa conectado que se explora poco a poco',
      'Jefes difíciles',
      'Amuletos que cambian tu forma de pelear',
      'Dibujado a mano',
    ],
    nombre: 'Hollow Knight',
    categoria: 'Plataformas',
    descripcionCorta: 'Aventura de combate en un reino de insectos.',
    descripcionLarga:
        'Controlas a un pequeño caballero que baja a Hallownest, un reino '
        'subterráneo lleno de cuevas, jefes y secretos. Mezcla saltos, '
        'combates difíciles y un mapa que se va descubriendo poco a poco.',
    imagen: 'assets/images/hollow.png',
    desarrollador: 'Team Cherry',
    anio: 2017,
    plataformas: 'PC y consolas',
    calificacion: 4.8,
    datoCurioso: 'El mapa no viene dibujado, hay que explorar para llenarlo.',
  ),
  Videojuego(
    id: 'fortnite',
    genero: 'Battle royale y construcción',
    jugadores: 'Solo o en equipo',
    color: 0xFF6A1B9A,
    caracteristicas: [
      'Hasta 100 jugadores por partida',
      'Construcción de muros y rampas',
      'Gratis para jugar',
      'Eventos y temporadas nuevas',
    ],
    nombre: 'Fortnite',
    categoria: 'Multijugador',
    descripcionCorta: 'Battle royale gratuito con construcción de estructuras.',
    descripcionLarga:
        'En el modo Battle Royale caes en una isla junto con otros '
        'jugadores, buscas armas y recursos y tratas de ser el último en pie. '
        'Además puedes construir muros y rampas para defenderte.',
    imagen: 'assets/images/fortnite.png',
    desarrollador: 'Epic Games',
    anio: 2017,
    plataformas: 'PC y consolas',
    calificacion: 4.3,
    datoCurioso: 'En una partida pueden juntarse hasta 100 jugadores.',
  ),
  Videojuego(
    id: 'minecraft',
    genero: 'Sandbox y supervivencia',
    jugadores: 'Un jugador o multijugador',
    color: 0xFF1565C0,
    caracteristicas: [
      'Modo supervivencia y modo creativo',
      'Mundos generados al azar',
      'Fabricación de herramientas y objetos',
      'Se puede personalizar con mods y texturas',
    ],
    nombre: 'Minecraft',
    categoria: 'Aventura',
    descripcionCorta: 'Construye y sobrevive en un mundo hecho de bloques.',
    descripcionLarga:
        'Un mundo infinito hecho de bloques donde puedes minar, fabricar '
        'herramientas, construir casas y explorar cuevas. Se puede jugar '
        'en modo supervivencia o en modo creativo, solo o con amigos.',
    imagen: 'assets/images/minecraft.png',
    desarrollador: 'Mojang Studios',
    anio: 2011,
    plataformas: 'PC, consolas y móviles',
    calificacion: 4.9,
    datoCurioso: 'Es considerado el videojuego más vendido de la historia.',
  ),
  Videojuego(
    id: 'overwatch',
    genero: 'Shooter en equipo',
    jugadores: '1 a 6 jugadores por equipo',
    color: 0xFF0288D1,
    caracteristicas: [
      'Personajes con habilidades únicas',
      'Objetivos de equipo y mapas variados',
      'Competitivo y cooperativo',
      'Actualizaciones frecuentes con nuevos héroes y mapas',
    ],
    nombre: 'Overwatch',
    categoria: 'Multijugador',
    descripcionCorta: 'Shooter en primera persona con héroes únicos.',
    descripcionLarga:
        'Juego de disparos en primera persona donde los jugadores se '
        'dividen en equipos y eligen héroes con habilidades únicas. '
        'El objetivo es completar misiones y derrotar al equipo contrario.',
    imagen: 'assets/images/overwatch.png',
    desarrollador: 'Blizzard Entertainment',
    anio: 2016,
    plataformas: 'PC y consolas',
    calificacion: 4.7,
    datoCurioso:
        'Cada héroe tiene un rol específico, como tanque, daño o apoyo.',
  ),
  Videojuego(
    id: 'cyberpunk',
    genero: 'RPG de acción y mundo abierto',
    jugadores: '1 jugador',
    color: 0xFF9C27B0,
    caracteristicas: [
      'Mundo abierto futurista con misiones principales y secundarias',
      'Personalización de personaje y habilidades',
      'Combate con armas de fuego y cuerpo a cuerpo',
      'Narrativa profunda con decisiones que afectan la historia',
    ],
    nombre: 'Cyberpunk 2077',
    categoria: 'Aventura',
    descripcionCorta: 'Explora Night City en un RPG de acción futurista.',
    descripcionLarga:
        'Ambientado en un mundo abierto futurista, el jugador controla a '
        'V, un mercenario que busca un implante único que otorga la inmortalidad. '
        'El juego combina combate, exploración y narrativa profunda.',
    imagen: 'assets/images/cyberpunk.png',
    desarrollador: 'CD Projekt Red',
    anio: 2020,
    plataformas: 'PC, consolas y Stadia',
    calificacion: 4.2,
    datoCurioso:
        'El juego tuvo un lanzamiento problemático debido a numerosos bugs.',
  ),
  Videojuego(
    id: 'thewitcher',
    genero: 'RPG de acción y fantasía',
    jugadores: '1 jugador',
    color: 0xFF4CAF50, 
    caracteristicas: [
      'Mundo abierto con misiones principales y secundarias',
      'Sistema de combate con espadas y magia',
      'Decisiones que afectan la historia y el mundo',
      'Inspirado en la saga de libros de Andrzej Sapkowski',
    ],
    nombre: 'The Witcher 3: Wild Hunt',
    categoria: 'Aventura',
    descripcionCorta: 'Embárcate en una épica aventura como cazador de monstruos.',
    descripcionLarga:
        'El jugador controla a Geralt de Rivia, un cazador de monstruos, '
        'en un mundo abierto lleno de criaturas, intrigas políticas y '
        'decisiones morales. El juego combina exploración, combate y narrativa.',
    imagen: 'assets/images/thewitcher.png',
    desarrollador: 'CD Projekt Red',
    anio: 2015,
    plataformas: 'PC, consolas y Nintendo Switch',
    calificacion: 4.9,
    datoCurioso:
        'El juego ganó múltiples premios a Juego del Año en 2015.',
  ),
  Videojuego(
    id: 'eldenring',
    genero: 'RPG de acción y mundo abierto',
    jugadores: '1 jugador',
    color: 0xFF795548,
    caracteristicas: [
      'Mundo abierto con exploración libre',
      'Combate desafiante con jefes poderosos',
      'Personalización de personaje y habilidades',
      'Narrativa profunda y misteriosa',
    ],
    nombre: 'Elden Ring',
    categoria: 'Aventura',
    descripcionCorta: 'Explora un vasto mundo lleno de desafíos y secretos.',
    descripcionLarga:
        'Desarrollado por FromSoftware, Elden Ring ofrece un mundo abierto '
        'rico en historia y desafíos. Los jugadores pueden explorar libremente, '
        'enfrentarse a enemigos formidables y descubrir secretos ocultos.',
    imagen: 'assets/images/eldenring.png',
    desarrollador: 'FromSoftware',
    anio: 2022,
    plataformas: 'PC y  consolas',
    calificacion: 4.8,
    datoCurioso:
        'El juego fue creado en colaboración con el autor George R.R. Martin.',

  )


];
