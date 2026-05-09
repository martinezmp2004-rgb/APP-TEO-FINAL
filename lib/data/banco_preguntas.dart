import '../models/pregunta.dart';

const List<Map<String, dynamic>> temas = [
  {'nombre': 'Introducción a la Teología Natural', 'id': 1},
  {'nombre': 'Conocimiento de Dios y método filosófico', 'id': 2},
  {'nombre': 'La Analogía del Ente', 'id': 3},
  {'nombre': 'Agnosticismo filosófico', 'id': 4},
  {'nombre': 'Ateísmo contemporáneo', 'id': 5},
  {'nombre': 'Teísmo filosófico', 'id': 6},
  {'nombre': 'Teísmo y ciencia', 'id': 7},
];

class _ConceptoTema {
  final String nombre;
  final String definicion;
  final String ejemplo;
  final String error;
  final String clave;

  const _ConceptoTema({
    required this.nombre,
    required this.definicion,
    required this.ejemplo,
    required this.error,
    required this.clave,
  });
}

List<String> _opciones(
  List<_ConceptoTema> conceptos,
  int index,
  String Function(_ConceptoTema c) selector,
) {
  return [
    selector(conceptos[index]),
    selector(conceptos[(index + 1) % conceptos.length]),
    selector(conceptos[(index + 2) % conceptos.length]),
    selector(conceptos[(index + 3) % conceptos.length]),
  ];
}

List<Pregunta> _preguntasDesdeConceptos(String temaNombre, List<_ConceptoTema> conceptos) {
  final preguntas = <Pregunta>[];

  for (int i = 0; i < conceptos.length; i++) {
    final c = conceptos[i];

    preguntas.add(
      Pregunta(
        enunciado: 'En $temaNombre, ¿qué definición corresponde mejor a "${c.nombre}"?',
        opciones: _opciones(conceptos, i, (x) => x.definicion),
        correcta: 0,
        explicacion: c.clave,
      ),
    );

    preguntas.add(
      Pregunta(
        enunciado: '¿Qué ejemplo ilustra mejor la idea de "${c.nombre}"?',
        opciones: _opciones(conceptos, i, (x) => x.ejemplo),
        correcta: 0,
        explicacion: c.clave,
      ),
    );

    preguntas.add(
      Pregunta(
        enunciado: '¿Qué afirmación contradice directamente "${c.nombre}"?',
        opciones: _opciones(conceptos, i, (x) => x.error),
        correcta: 0,
        explicacion: c.clave,
      ),
    );

    preguntas.add(
      Pregunta(
        enunciado: 'Selecciona una idea clave asociada a "${c.nombre}".',
        opciones: _opciones(conceptos, i, (x) => x.clave),
        correcta: 0,
        explicacion: c.definicion,
      ),
    );
  }

  return preguntas;
}

const List<_ConceptoTema> _conceptosTema1 = [
  _ConceptoTema(
    nombre: 'Teología natural',
    definicion: 'Reflexión racional sobre Dios a partir del mundo y la experiencia humana.',
    ejemplo: 'Analizar contingencia y causalidad sin apelar primero a una revelación concreta.',
    error: 'Reducir la teología natural a repetir textos sin argumentación filosófica.',
    clave: 'Busca fundamentos filosóficos públicos para hablar de Dios.',
  ),
  _ConceptoTema(
    nombre: 'Uso filosófico de la razón',
    definicion: 'Empleo de argumentos y principios lógicos para evaluar afirmaciones sobre Dios.',
    ejemplo: 'Distinguir premisas y conclusión antes de aceptar una tesis teísta.',
    error: 'Aceptar una conclusión solo por costumbre sin examinar razones.',
    clave: 'La racionalidad exige justificar por qué una tesis es verdadera.',
  ),
  _ConceptoTema(
    nombre: 'Punto de partida experiencial',
    definicion: 'Comenzar desde hechos comunes de la experiencia, no desde hipótesis arbitrarias.',
    ejemplo: 'Partir de que existen seres finitos y cambiantes para plantear preguntas últimas.',
    error: 'Iniciar la reflexión negando cualquier dato de experiencia compartida.',
    clave: 'La experiencia cotidiana funciona como base del análisis metafísico.',
  ),
  _ConceptoTema(
    nombre: 'Principio de causalidad',
    definicion: 'Todo efecto exige una razón suficiente de su ser o de su cambio.',
    ejemplo: 'Preguntar por la causa de una realidad contingente en vez de detenerse en el hecho bruto.',
    error: 'Sostener que los efectos aparecen sin causa ni razón suficiente.',
    clave: 'Permite avanzar de los efectos observables hacia fundamentos más profundos.',
  ),
  _ConceptoTema(
    nombre: 'Contingencia',
    definicion: 'Característica de lo que puede existir o no existir.',
    ejemplo: 'Reconocer que los seres del mundo no tienen en sí la razón total de su existencia.',
    error: 'Afirmar que todo lo real existe con necesidad absoluta.',
    clave: 'La contingencia abre la pregunta por un fundamento necesario.',
  ),
  _ConceptoTema(
    nombre: 'Orden e inteligibilidad',
    definicion: 'El mundo presenta regularidad y estructura comprensible por la mente.',
    ejemplo: 'Constatar leyes estables que hacen posible ciencia y explicación.',
    error: 'Decir que el universo es completamente caótico e ininteligible.',
    clave: 'La inteligibilidad del cosmos invita a una lectura metafísica de su origen.',
  ),
  _ConceptoTema(
    nombre: 'Apertura a la trascendencia',
    definicion: 'La razón humana puede formular preguntas que superan lo meramente material.',
    ejemplo: 'Interrogarse por el sentido último del ser, del bien y de la verdad.',
    error: 'Negar que la mente pueda plantear cuestiones últimas con sentido.',
    clave: 'No demuestra por sí sola a Dios, pero legitima la búsqueda metafísica.',
  ),
  _ConceptoTema(
    nombre: 'Finalidad humana',
    definicion: 'La vida humana se orienta hacia bienes y fines, no solo a impulsos inmediatos.',
    ejemplo: 'Elegir un bien difícil por considerarlo más pleno y verdadero.',
    error: 'Reducir toda acción a reacciones sin propósito ni criterio.',
    clave: 'La experiencia de finalidad sugiere una estructura teleológica.',
  ),
  _ConceptoTema(
    nombre: 'Verdad como adecuación',
    definicion: 'La verdad implica conformidad entre lo pensado y la realidad.',
    ejemplo: 'Corregir una idea cuando no coincide con los hechos observados.',
    error: 'Sostener que una idea es verdadera solo porque resulta útil.',
    clave: 'Permite evaluar objetivamente argumentos filosóficos.',
  ),
  _ConceptoTema(
    nombre: 'Diálogo fe-razón',
    definicion: 'Fe y razón se distinguen, pero pueden colaborar sin confundirse.',
    ejemplo: 'La razón prepara preguntas y la fe propone una respuesta revelada.',
    error: 'Afirmar que toda fe auténtica exige rechazar la argumentación racional.',
    clave: 'La teología natural ocupa el espacio racional abierto a todos.',
  ),
];

const List<_ConceptoTema> _conceptosTema2 = [
  _ConceptoTema(
    nombre: 'Realismo crítico',
    definicion: 'Conocemos la realidad, aunque de modo mediado y perfectible.',
    ejemplo: 'Aceptar que el conocimiento puede mejorar sin negar el acceso a lo real.',
    error: 'Negar por principio que la mente alcance algo verdadero de la realidad.',
    clave: 'Evita tanto el ingenuismo como el escepticismo radical.',
  ),
  _ConceptoTema(
    nombre: 'Saber quia',
    definicion: 'Conocer que algo existe a partir de sus efectos.',
    ejemplo: 'Inferir un fundamento trascendente desde la contingencia del mundo.',
    error: 'Pretender conocer exhaustivamente la esencia divina por intuición directa.',
    clave: 'En teología natural se trabaja principalmente con conocimiento quia.',
  ),
  _ConceptoTema(
    nombre: 'Saber quid',
    definicion: 'Conocer qué es algo en su esencia propia.',
    ejemplo: 'Distinguir que del Absoluto no poseemos comprensión quiditativa total.',
    error: 'Confundir saber que existe algo con poseer su definición completa.',
    clave: 'Recordar esta diferencia protege de simplificaciones sobre Dios.',
  ),
  _ConceptoTema(
    nombre: 'Límite del concepto',
    definicion: 'Los conceptos humanos son finitos frente a una realidad infinita.',
    ejemplo: 'Usar lenguaje cuidadoso al hablar de atributos divinos.',
    error: 'Creer que una fórmula humana agota por completo lo divino.',
    clave: 'Reconocer el límite no implica caer en silencio absoluto.',
  ),
  _ConceptoTema(
    nombre: 'Lenguaje religioso significativo',
    definicion: 'Hablar de Dios tiene sentido cuando se fundamenta en analogía y experiencia.',
    ejemplo: 'Decir que Dios es bueno sin equiparar su bondad con la humana.',
    error: 'Sostener que toda frase sobre Dios es puro ruido sin contenido.',
    clave: 'La significación exige evitar literalismo y vacío semántico.',
  ),
  _ConceptoTema(
    nombre: 'Vía de afirmación',
    definicion: 'Atribuir a Dios perfecciones observadas en las criaturas.',
    ejemplo: 'Afirmar sabiduría divina desde la sabiduría limitada que vemos en humanos.',
    error: 'Atribuir a Dios defectos creados como ignorancia o injusticia.',
    clave: 'Es un primer paso que luego necesita purificación conceptual.',
  ),
  _ConceptoTema(
    nombre: 'Vía de negación',
    definicion: 'Negar en Dios los límites e imperfecciones propias de lo creado.',
    ejemplo: 'Decir que Dios no está sometido a cambio temporal.',
    error: 'Negar también toda perfección, dejando un concepto vacío.',
    clave: 'Ayuda a evitar antropomorfismos toscos.',
  ),
  _ConceptoTema(
    nombre: 'Vía de eminencia',
    definicion: 'Afirmar en Dios las perfecciones en modo supremo e infinito.',
    ejemplo: 'Sostener que la bondad divina supera sin medida la bondad creada.',
    error: 'Reducir la excelencia divina al mismo nivel de una criatura.',
    clave: 'Completa el lenguaje analógico con orientación trascendente.',
  ),
  _ConceptoTema(
    nombre: 'Conocimiento analógico de Dios',
    definicion: 'Conocer a Dios de forma verdadera pero no unívoca ni exhaustiva.',
    ejemplo: 'Usar términos comunes con diferencia proporcional entre Dios y criatura.',
    error: 'Exigir identidad total de significado o incomunicación total.',
    clave: 'La analogía permite verdad sin reducción.',
  ),
  _ConceptoTema(
    nombre: 'Humildad epistemológica',
    definicion: 'Actitud de reconocer alcance y límite del propio conocimiento.',
    ejemplo: 'Defender una tesis racional sin convertirla en absolutismo dogmático.',
    error: 'Confundir límite cognoscitivo con imposibilidad de verdad.',
    clave: 'Es clave para un debate filosófico serio y abierto.',
  ),
];

const List<_ConceptoTema> _conceptosTema3 = [
  _ConceptoTema(
    nombre: 'Univocidad',
    definicion: 'Un término mantiene idéntico significado en todos sus usos.',
    ejemplo: 'Usar una palabra técnica con la misma definición en dos casos matemáticos.',
    error: 'Pensar que todo término se aplica exactamente igual a Dios y a criaturas.',
    clave: 'No basta para lenguaje sobre Dios porque forzaría igualdad de nivel.',
  ),
  _ConceptoTema(
    nombre: 'Equivocidad',
    definicion: 'Un término tiene significados totalmente distintos sin conexión.',
    ejemplo: 'Usar una misma palabra en dos contextos sin relación conceptual real.',
    error: 'Afirmar que entre significados no hay ni siquiera semejanza proporcional.',
    clave: 'Si todo fuera equívoco, hablar de Dios sería imposible.',
  ),
  _ConceptoTema(
    nombre: 'Analogía de atribución',
    definicion: 'Varios usos se refieren a un analogado principal del que dependen.',
    ejemplo: 'Llamar sano al cuerpo y también al alimento por referencia a la salud principal.',
    error: 'Separar totalmente los usos de un término sin referencia común.',
    clave: 'Muestra unidad de significado sin identidad rígida.',
  ),
  _ConceptoTema(
    nombre: 'Analogía de proporcionalidad',
    definicion: 'Un término se aplica según proporciones semejantes entre realidades distintas.',
    ejemplo: 'Hablar de conocimiento humano y conocimiento divino en proporción, no en igualdad.',
    error: 'Exigir que dos sujetos conozcan del mismo modo para usar el mismo término.',
    clave: 'Permite comparar respetando diferencias ontológicas.',
  ),
  _ConceptoTema(
    nombre: 'Analogado principal',
    definicion: 'Realidad primaria respecto de la cual se entienden los usos derivados.',
    ejemplo: 'Tomar la salud del organismo como centro para otros usos del término sano.',
    error: 'Negar que exista un sentido principal en la predicación analógica.',
    clave: 'Sin analogado principal, la atribución pierde estructura.',
  ),
  _ConceptoTema(
    nombre: 'Participación del ser',
    definicion: 'Los entes finitos poseen ser de modo limitado y recibido.',
    ejemplo: 'Reconocer que una criatura existe sin ser el ser mismo por esencia.',
    error: 'Afirmar que cada ente creado posee ser ilimitado e independiente.',
    clave: 'La participación funda la diferencia entre Creador y criatura.',
  ),
  _ConceptoTema(
    nombre: 'Trascendentales',
    definicion: 'Propiedades convertibles con el ser, como unidad, verdad y bondad.',
    ejemplo: 'Entender que donde hay ser también hay cierta inteligibilidad y valor.',
    error: 'Tratar unidad, verdad y bondad como cualidades accidentales opcionales.',
    clave: 'Ayudan a leer el ser con una estructura metafísica común.',
  ),
  _ConceptoTema(
    nombre: 'Predicación analógica',
    definicion: 'Modo de predicar términos con semejanza y diferencia simultáneas.',
    ejemplo: 'Decir que Dios y la persona son buenos, sin igualar su modo de bondad.',
    error: 'Reducir toda predicación a literalismo unívoco o a pura ambigüedad.',
    clave: 'Es la base lingüística del discurso teológico clásico.',
  ),
  _ConceptoTema(
    nombre: 'No-entes de razón',
    definicion: 'Construcciones mentales que no poseen realidad extramental propia.',
    ejemplo: 'Distinguir un límite lógico pensado de un ente existente fuera de la mente.',
    error: 'Conceder existencia real a toda entidad imaginada por el intelecto.',
    clave: 'Evita confundir operaciones lógicas con ontología real.',
  ),
  _ConceptoTema(
    nombre: 'Función crítica de la analogía',
    definicion: 'La analogía evita tanto el antropomorfismo como el agnosticismo total.',
    ejemplo: 'Mantener un lenguaje verdadero sobre Dios sin convertirlo en lenguaje humano literal.',
    error: 'Suponer que la analogía elimina toda posibilidad de conocimiento verdadero.',
    clave: 'Ofrece una vía media racional para hablar de Dios.',
  ),
];

const List<_ConceptoTema> _conceptosTema4 = [
  _ConceptoTema(
    nombre: 'Agnosticismo filosófico',
    definicion: 'Postura que suspende el juicio sobre la cognoscibilidad de Dios.',
    ejemplo: 'Afirmar que no se dispone de pruebas concluyentes ni para afirmar ni para negar.',
    error: 'Presentar el agnosticismo como una demostración de que Dios no existe.',
    clave: 'Se distingue del ateísmo porque no formula negación ontológica.',
  ),
  _ConceptoTema(
    nombre: 'Suspensión del juicio',
    definicion: 'Decisión intelectual de no afirmar ni negar una tesis no suficientemente probada.',
    ejemplo: 'Reconocer límites argumentativos y mantener la cuestión abierta.',
    error: 'Confundir suspensión del juicio con indiferencia absoluta por la verdad.',
    clave: 'Busca prudencia epistémica ante cuestiones últimas.',
  ),
  _ConceptoTema(
    nombre: 'Incognoscibilidad del Absoluto',
    definicion: 'Idea de que la realidad última supera nuestras categorías conceptuales.',
    ejemplo: 'Sostener que un concepto finito no encierra totalmente al Absoluto.',
    error: 'Concluir que todo lenguaje humano sobre trascendencia es siempre absurdo.',
    clave: 'El punto central es el límite, no la negación automática.',
  ),
  _ConceptoTema(
    nombre: 'Crítica a pruebas concluyentes',
    definicion: 'Objeción a que los argumentos clásicos alcancen certeza apodíctica universal.',
    ejemplo: 'Cuestionar que una vía metafísica obligue por sí sola a todo interlocutor.',
    error: 'Afirmar que ninguna argumentación racional tiene valor en absoluto.',
    clave: 'La crítica suele ser de fuerza demostrativa, no de mera lógica formal.',
  ),
  _ConceptoTema(
    nombre: 'Límite del lenguaje religioso',
    definicion: 'El lenguaje sobre Dios requiere cautela para no sobrepasar su capacidad.',
    ejemplo: 'Evitar descripciones literales de lo divino como si fuera objeto físico.',
    error: 'Eliminar toda semántica religiosa por considerar cualquier término inútil.',
    clave: 'La dificultad lingüística no equivale a imposibilidad total de sentido.',
  ),
  _ConceptoTema(
    nombre: 'Agnosticismo fuerte',
    definicion: 'Sostiene que el conocimiento de Dios es imposible en principio.',
    ejemplo: 'Defender que ninguna condición futura podría aportar verdadero conocimiento teológico.',
    error: 'Reducir el agnosticismo fuerte a una mera duda psicológica temporal.',
    clave: 'Su tesis es epistemológica universal y permanente.',
  ),
  _ConceptoTema(
    nombre: 'Agnosticismo débil',
    definicion: 'Afirma que actualmente no hay pruebas suficientes, dejando abierta la posibilidad.',
    ejemplo: 'Admitir que podrían surgir argumentos mejores en el futuro.',
    error: 'Convertir la falta actual de evidencia en imposibilidad lógica absoluta.',
    clave: 'Tiene carácter provisional y revisable.',
  ),
  _ConceptoTema(
    nombre: 'Agnosticismo metodológico',
    definicion: 'Limita el análisis a métodos empíricos sin pronunciarse ontológicamente.',
    ejemplo: 'En ciencia, describir fenómenos sin usar hipótesis teológicas como variable experimental.',
    error: 'Inferir desde el método científico una negación metafísica de Dios.',
    clave: 'Metodológico no significa necesariamente ateo.',
  ),
  _ConceptoTema(
    nombre: 'Agnosticismo existencial',
    definicion: 'Vivir sin compromiso teísta ni ateo por incertidumbre vital persistente.',
    ejemplo: 'Reconocer búsqueda de sentido sin asumir una definición teológica final.',
    error: 'Asegurar que la duda existencial prueba una tesis metafísica cerrada.',
    clave: 'Expresa una posición práctica ante la incertidumbre.',
  ),
  _ConceptoTema(
    nombre: 'Función dialógica del agnosticismo',
    definicion: 'Puede servir de mediación crítica entre afirmaciones opuestas.',
    ejemplo: 'Pedir mejores argumentos tanto al teísta como al ateo.',
    error: 'Usar el agnosticismo para bloquear toda discusión racional.',
    clave: 'Su valor está en la exigencia argumentativa y la apertura.',
  ),
];

const List<_ConceptoTema> _conceptosTema5 = [
  _ConceptoTema(
    nombre: 'Ateísmo teórico',
    definicion: 'Negación explícita de la existencia de Dios en el plano intelectual.',
    ejemplo: 'Sostener mediante argumentos que no existe un ser trascendente.',
    error: 'Confundir ateísmo teórico con simple falta de práctica religiosa.',
    clave: 'Es una tesis doctrinal, no solo un estilo de vida.',
  ),
  _ConceptoTema(
    nombre: 'Ateísmo práctico',
    definicion: 'Vida cotidiana organizada como si Dios no existiera, sin tesis explícita.',
    ejemplo: 'Tomar decisiones morales ignorando por completo cualquier referencia trascendente.',
    error: 'Suponer que toda persona no practicante formula negación filosófica explícita.',
    clave: 'Describe una orientación vital más que una teoría sistemática.',
  ),
  _ConceptoTema(
    nombre: 'Problema del mal',
    definicion: 'Objeción que cuestiona la coexistencia de mal intenso con un Dios bueno y omnipotente.',
    ejemplo: 'Preguntar cómo encajar sufrimiento injusto en una visión teísta del mundo.',
    error: 'Reducir el problema del mal a una emoción sin dimensión filosófica.',
    clave: 'Es una de las críticas más fuertes al teísmo clásico.',
  ),
  _ConceptoTema(
    nombre: 'Ocultamiento divino',
    definicion: 'Argumento según el cual la falta de evidencia clara dificulta la fe racional.',
    ejemplo: 'Señalar la ausencia de manifestación inequívoca para todos los sujetos sinceros.',
    error: 'Afirmar que cualquier experiencia subjetiva equivale a evidencia universal concluyente.',
    clave: 'Discute la accesibilidad pública de la evidencia teísta.',
  ),
  _ConceptoTema(
    nombre: 'Autonomía moral secular',
    definicion: 'Defensa de una ética construida sin referencia necesaria a mandatos divinos.',
    ejemplo: 'Fundamentar derechos humanos en dignidad racional compartida.',
    error: 'Identificar moral secular con ausencia total de normas éticas.',
    clave: 'Plantea que la obligación moral puede formularse en clave laica.',
  ),
  _ConceptoTema(
    nombre: 'Naturalismo explicativo',
    definicion: 'Preferencia por causas naturales para explicar fenómenos del mundo.',
    ejemplo: 'Buscar mecanismos físicos y biológicos antes de apelar a intervención sobrenatural.',
    error: 'Convertir una estrategia metodológica en prueba absoluta de inexistencia de Dios.',
    clave: 'Distinguir método naturalista y conclusión metafísica evita confusiones.',
  ),
  _ConceptoTema(
    nombre: 'Carga de la prueba',
    definicion: 'Quien afirma una existencia debe ofrecer razones proporcionadas.',
    ejemplo: 'Solicitar argumentos positivos antes de aceptar una tesis teísta.',
    error: 'Pretender que no hace falta justificar una negación categórica.',
    clave: 'La discusión exige responsabilidad argumentativa en ambos lados.',
  ),
  _ConceptoTema(
    nombre: 'Pluralidad religiosa',
    definicion: 'Existencia de múltiples religiones se usa como objeción a una verdad única evidente.',
    ejemplo: 'Argumentar que la diversidad de credos dificulta la certeza confesional inmediata.',
    error: 'Concluir que diversidad equivale lógicamente a falsedad de toda religión.',
    clave: 'La pluralidad cuestiona evidencias simples, no cierra el debate.',
  ),
  _ConceptoTema(
    nombre: 'Crítica a la religión institucional',
    definicion: 'Objeción dirigida a abusos históricos y estructuras de poder religiosas.',
    ejemplo: 'Diferenciar entre crítica ética a instituciones y tesis sobre existencia de Dios.',
    error: 'Inferir automáticamente desde fallos institucionales la inexistencia de lo divino.',
    clave: 'Conviene separar plano sociológico y plano metafísico.',
  ),
  _ConceptoTema(
    nombre: 'Humanismo no teísta',
    definicion: 'Propuesta de sentido y dignidad humana sin fundamento trascendente.',
    ejemplo: 'Defender proyectos de justicia y solidaridad desde una visión inmanente.',
    error: 'Afirmar que todo humanismo requiere necesariamente una teología previa.',
    clave: 'Busca sostener valor humano desde recursos estrictamente seculares.',
  ),
];

const List<_ConceptoTema> _conceptosTema6 = [
  _ConceptoTema(
    nombre: 'Teísmo filosófico',
    definicion: 'Afirmación de un Dios personal, trascendente y fundamento del ser.',
    ejemplo: 'Defender racionalmente que la realidad contingente remite a un ser necesario.',
    error: 'Reducir el teísmo a energía impersonal sin inteligencia ni voluntad.',
    clave: 'Integra metafísica, causalidad y sentido personal de lo divino.',
  ),
  _ConceptoTema(
    nombre: 'Dios personal',
    definicion: 'Dios posee inteligencia y voluntad en grado supremo, sin limitación creada.',
    ejemplo: 'Atribuir a Dios conocimiento y amor de modo eminente, no mecánico.',
    error: 'Describir a Dios como fuerza ciega incapaz de conocer o querer.',
    clave: 'La noción personal fundamenta relación, providencia y oración.',
  ),
  _ConceptoTema(
    nombre: 'Ser necesario',
    definicion: 'Realidad cuya existencia no depende de otra y no puede no existir.',
    ejemplo: 'Concluir que una cadena de contingentes requiere fundamento no contingente.',
    error: 'Aceptar una regresión infinita de dependencias sin fundamento último.',
    clave: 'El ser necesario explica por qué hay algo y no nada.',
  ),
  _ConceptoTema(
    nombre: 'Creación ex nihilo',
    definicion: 'Todo lo creado recibe el ser de Dios y no preexiste como materia autónoma.',
    ejemplo: 'Entender la creación como dependencia radical del acto creador.',
    error: 'Pensar que crear significa solo reorganizar una materia eterna independiente.',
    clave: 'Subraya dependencia ontológica continua de la criatura.',
  ),
  _ConceptoTema(
    nombre: 'Providencia',
    definicion: 'Acción de Dios que sostiene y orienta el mundo respetando su consistencia.',
    ejemplo: 'Afirmar que el orden del cosmos no queda abandonado al azar absoluto.',
    error: 'Imaginar providencia como intervención caprichosa que destruye toda causalidad creada.',
    clave: 'Providencia y causas segundas no se excluyen.',
  ),
  _ConceptoTema(
    nombre: 'Inteligibilidad teísta del mundo',
    definicion: 'El orden racional del cosmos es coherente con un origen inteligente.',
    ejemplo: 'Vincular estructura matemática de la naturaleza con una fuente racional.',
    error: 'Sostener que el teísmo exige renunciar a explicación científica.',
    clave: 'Teísmo clásico valora la investigación racional de la naturaleza.',
  ),
  _ConceptoTema(
    nombre: 'Fundamento del valor moral',
    definicion: 'El bien moral se comprende como participación en un orden objetivo del bien.',
    ejemplo: 'Defender que dignidad y deber no dependen solo de consenso cambiante.',
    error: 'Reducir bien y mal a preferencias individuales sin referencia objetiva.',
    clave: 'El teísmo propone anclaje fuerte para la normatividad.',
  ),
  _ConceptoTema(
    nombre: 'Libertad y concurso divino',
    definicion: 'La acción divina funda el ser y actuar creados sin anular libertad humana.',
    ejemplo: 'Afirmar que una decisión libre puede ser realmente humana y sostenida por Dios.',
    error: 'Suponer que toda causalidad divina convierte al sujeto en marioneta.',
    clave: 'Distinguir niveles causales evita falsos dilemas.',
  ),
  _ConceptoTema(
    nombre: 'Racionalidad de la oración',
    definicion: 'La oración se entiende como relación personal coherente con un Dios libre y providente.',
    ejemplo: 'Pedir ayuda sin reducir la oración a magia automática.',
    error: 'Interpretar toda oración como intento de forzar mecánicamente a Dios.',
    clave: 'Supone confianza, no control técnico de lo divino.',
  ),
  _ConceptoTema(
    nombre: 'Horizonte de plenitud',
    definicion: 'El teísmo orienta la existencia hacia un bien último que trasciende lo finito.',
    ejemplo: 'Leer el deseo humano de sentido pleno como apertura a un fin último.',
    error: 'Afirmar que toda aspiración de plenitud es ilusión psicológica sin valor cognitivo.',
    clave: 'Conecta antropología filosófica y metafísica teísta.',
  ),
];

const List<_ConceptoTema> _conceptosTema7 = [
  _ConceptoTema(
    nombre: 'Big Bang y comienzo cósmico',
    definicion: 'La cosmología estándar describe un universo con inicio físico del espacio-tiempo observable.',
    ejemplo: 'Usar el comienzo cósmico como dato que reabre preguntas metafísicas sobre origen.',
    error: 'Afirmar que Big Bang demuestra por sí solo una explicación total sin filosofía.',
    clave: 'La ciencia aporta datos; la metafísica pregunta por su fundamento último.',
  ),
  _ConceptoTema(
    nombre: 'Muerte térmica',
    definicion: 'Escenario de máxima entropía donde el universo agota gradientes útiles de energía.',
    ejemplo: 'Interpretar el destino térmico como indicio de temporalidad finita del orden físico.',
    error: 'Concluir que la muerte térmica prueba automáticamente ausencia de sentido.',
    clave: 'Subraya que el cosmos físico no se basta a sí mismo como fin último.',
  ),
  _ConceptoTema(
    nombre: 'Ajuste fino',
    definicion: 'Muchas constantes físicas parecen situadas en rangos estrechos compatibles con vida compleja.',
    ejemplo: 'Comparar variaciones pequeñas de constantes y su impacto en estructura del universo.',
    error: 'Tratar el ajuste fino como argumento matemáticamente cerrado sin debate.',
    clave: 'Se usa como indicio filosófico, no como demostración experimental directa.',
  ),
  _ConceptoTema(
    nombre: 'Principio antrópico débil',
    definicion: 'Observamos un universo compatible con observadores porque, de otro modo, no estaríamos aquí.',
    ejemplo: 'Recordar sesgo de observación al interpretar datos cosmológicos.',
    error: 'Convertir el principio antrópico en explicación causal suficiente de todo.',
    clave: 'Aclara condiciones de observación, pero no reemplaza la metafísica.',
  ),
  _ConceptoTema(
    nombre: 'Inteligibilidad matemática',
    definicion: 'La naturaleza responde a estructuras matemáticas sorprendentemente eficaces.',
    ejemplo: 'Reconocer que leyes formuladas en lenguaje matemático predicen fenómenos físicos.',
    error: 'Pensar que la eficacia matemática elimina toda pregunta sobre por qué hay leyes.',
    clave: 'Su éxito invita a pensar en racionalidad profunda del cosmos.',
  ),
  _ConceptoTema(
    nombre: 'Origen de las leyes naturales',
    definicion: 'Pregunta filosófica sobre por qué existen leyes estables y no puro caos.',
    ejemplo: 'Distinguir entre describir una ley y explicar su fundamento ontológico.',
    error: 'Confundir descripción científica de leyes con justificación última de su existencia.',
    clave: 'Es una frontera legítima entre ciencia y filosofía primera.',
  ),
  _ConceptoTema(
    nombre: 'Contingencia cosmológica',
    definicion: 'El universo podría haber sido distinto en constantes, condiciones y evolución.',
    ejemplo: 'Plantear que su configuración concreta requiere explicación más allá del dato bruto.',
    error: 'Afirmar que el universo actual es necesario en todos sus detalles.',
    clave: 'Contingencia y ajuste fino suelen tratarse conjuntamente.',
  ),
  _ConceptoTema(
    nombre: 'Emergencia de la conciencia',
    definicion: 'La aparición de subjetividad racional plantea interrogantes filosóficos adicionales.',
    ejemplo: 'Preguntar si la autoconsciencia se explica totalmente por descripción físico-química.',
    error: 'Negar el problema reduciendo conciencia a ilusión sin argumentación suficiente.',
    clave: 'La mente humana reabre la cuestión de sentido y fundamento.',
  ),
  _ConceptoTema(
    nombre: 'Límites del método científico',
    definicion: 'La ciencia empírica no decide por sí sola cuestiones metafísicas últimas.',
    ejemplo: 'Aceptar resultados experimentales sin exigirles responder por qué existe el ser.',
    error: 'Identificar conocimiento con lo exclusivamente medible en laboratorio.',
    clave: 'Reconocer límites metodológicos evita el cientificismo.',
  ),
  _ConceptoTema(
    nombre: 'Complementariedad ciencia-filosofía',
    definicion: 'Ciencia y filosofía responden preguntas distintas pero compatibles.',
    ejemplo: 'Integrar datos cosmológicos con análisis metafísico del fundamento.',
    error: 'Oponer necesariamente explicación científica y reflexión teísta.',
    clave: 'El diálogo interdisciplinar enriquece la comprensión del mundo.',
  ),
];

final List<Pregunta> preguntasTema1 =
    _preguntasDesdeConceptos('Introducción a la Teología Natural', _conceptosTema1);
final List<Pregunta> preguntasTema2 =
    _preguntasDesdeConceptos('Conocimiento de Dios y método filosófico', _conceptosTema2);
final List<Pregunta> preguntasTema3 = _preguntasDesdeConceptos('La Analogía del Ente', _conceptosTema3);
final List<Pregunta> preguntasTema4 =
    _preguntasDesdeConceptos('Agnosticismo filosófico', _conceptosTema4);
final List<Pregunta> preguntasTema5 = _preguntasDesdeConceptos('Ateísmo contemporáneo', _conceptosTema5);
final List<Pregunta> preguntasTema6 = _preguntasDesdeConceptos('Teísmo filosófico', _conceptosTema6);
final List<Pregunta> preguntasTema7 = _preguntasDesdeConceptos('Teísmo y ciencia', _conceptosTema7);

List<Pregunta> getPreguntasTema(int id) {
  switch (id) {
    case 1:
      return preguntasTema1;
    case 2:
      return preguntasTema2;
    case 3:
      return preguntasTema3;
    case 4:
      return preguntasTema4;
    case 5:
      return preguntasTema5;
    case 6:
      return preguntasTema6;
    case 7:
      return preguntasTema7;
    default:
      return [];
  }
}

List<Pregunta> todasLasPreguntas() => [
      ...preguntasTema1,
      ...preguntasTema2,
      ...preguntasTema3,
      ...preguntasTema4,
      ...preguntasTema5,
      ...preguntasTema6,
      ...preguntasTema7,
    ];
