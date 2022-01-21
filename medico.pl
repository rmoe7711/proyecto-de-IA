 %------Librerias------%
 :- use_module(library(pce)).
 :- use_module(library(http/http_server)).
 :- pce_image_directory('./imagenes').
 :- use_module(library(pce_style_item)).
 :- dynamic color/2.

resource(principal, image, image('principal.jpg')).
 resource(portada, image, image('portada.jpg')).
 %------tratamientos para las enfermedades------%
  resource(covid19, image, image('trat_coronavirus.jpg')).
   resource(diabetes, image, image('trat_diabetes.jpg')).
 resource(bronquitis, image, image('trat_bronquitis.jpg')).
 resource(paperas, image, image('trat_paperas.jpg')).
 resource(varicela, image, image('trat_varicela.jpg')).
 resource(sarampion, image, image('trat_sarampion.jpg')).
 resource(anemia, image, image('trat_anemia.jpg')).
 resource(resfriado, image, image('trat_resfriado.jpg')).
 resource(influenza, image, image('trat_influenza.jpg')).
  resource(gastritis, image, image('trat_gastritis.jpg')).
   resource(lo_siento_diagnostico_desconocido, image, image('desconocido.jpg')).
 %-------imagenes de los sintomas----------%
 resource(fiebre2, image, image('fiebre.jpg')).
 resource(apetito2, image, image('apetito.jpg')).
 resource(oido2, image, image('oido.jpg')).
 resource(hablar2, image, image('hablar.jpg')).
 resource(masticar2, image, image('masticar.jpg')).
 resource(cabeza2, image, image('cabeza.jpg')).
 resource(cansancio2, image, image('cansancio.jpg')).
 resource(tos2, image, image('tos.jpg')).
 resource(moqueo2, image, image('mocos.jpg')).
 resource(blancos2, image, image('blancos.jpg')).
 resource(palidez2, image, image('palidez.jpg')).
 resource(pecho2, image, image('pecho.jpg')).
 resource(frio2, image, image('frio.jpg')).
 resource(mareo2, image, image('mareo.jpg')).
 resource(garganta2, image, image('garganta.jpg')).
 resource(escalofrios2, image, image('escalofrios.jpg')).
 resource(tragar2, image, image('tragar.jpg')).
 resource(muscular2, image, image('muscular.jpg')).
 resource(diarrea2, image, image('diarrea.jpg')).
resource(acidez2, image, image('acidez.jpg')).
 resource(flatulencias2, image, image('flatulencias.jpg')).
 resource(dolor2, image, image('dolor.jpg')).
 resource(hinchazon2, image, image('hinchazon.jpg')).
 resource(granos2, image, image('granos.jpg')).
resource(faltaaire, image, image('faltaaire.jpg')).
resource(tosseca, image, image('tosseca.jpg')).
 resource(corporalleve, image, image('corporalleve.jpg')).
 resource(fiebreleve, image, image('fiebreleve.jpg')).
 resource(lagrimeo, image, image('lagrimeo.jpg')).
  resource(tosmoco, image, image('tosmoco.jpg')).
resource(dolorleve, image, image('dolorleve.jpg')).
  resource(massed, image, image('massed.jpg')).
 resource(borrosa, image, image('borrosa.jpg')).
  resource(ulceras, image, image('ulceras.jpg')).
resource(pesobajo, image, image('pesobajo.jpg')).
 resource(hormigueo, image, image('hormigueo.jpg')).
 
 

%------Funciones para mostrar las imagenes en la interfaz------%
 
 mostrar_imagen(Pantalla, Imagen) :- new(Figura, figure),
                                     new(Bitmap, bitmap(resource(Imagen),@on)),
                                     send(Bitmap, name, 1),
                                     send(Figura, display, Bitmap),
                                     send(Figura, status, 1),
                                     send(Pantalla, display,Figura,point(100,80)).
  mostrar_imagen_tratamiento(Pantalla, Imagen) :-new(Figura, figure),
                                     new(Bitmap, bitmap(resource(Imagen),@on)),
                                     send(Bitmap, name, 1),
                                     send(Figura, display, Bitmap),
                                     send(Figura, status, 1),
                                     send(Pantalla, display,Figura,point(20,100)).
 nueva_imagen(Ventana, Imagen) :-new(Figura, figure),
                                new(Bitmap, bitmap(resource(Imagen),@on)),
                                send(Bitmap, name, 1),
                                send(Figura, display, Bitmap),
                                send(Figura, status, 1),
                                send(Ventana, display,Figura,point(0,0)).
  imagen_pregunta(Ventana, Imagen) :-new(Figura, figure),
                                new(Bitmap, bitmap(resource(Imagen),@on)),
                                send(Bitmap, name, 1),
                                send(Figura, display, Bitmap),
                                send(Figura, status, 1),
                                send(Ventana, display,Figura,point(500,60)).

%------Botones de la aplicacion------%

  botones:-borrado,
                send(@boton, free),
                send(@btntratamiento,free),
                send(@boton2,free), 
                send(@boton3,free), 
                send(@boton4,free), 
                send(@boton5,free),
                 

                mostrar_diagnostico(Enfermedad),
                
                send(@texto, selection('El Diagnostico a partir de los datos es:')),
                send(@resp1, selection(Enfermedad)),
                new(@boton, button('Repetir consulta',
                message(@prolog, botones)
                )),

                new(@btntratamiento,button('Detalles y Tratamiento',
                message(@prolog,  mostrar_tratamiento, Enfermedad)
                )),
				
				new(@boton2,button('Farmacias de Zacapa',
                message(@prolog, mapa1, Enfermedad)
                )),
                
				new(@boton3,button('Farmacias de Chiquimula',
                message(@prolog, mapa2, Enfermedad)
                )),
                
                new(@boton4,button('Farmacias de Jutiapa',
                message(@prolog, mapa3, Enfermedad)
                )),

                new(@boton5,button('Farmacias de Izabal',
                message(@prolog, mapa4, Enfermedad)
                )),
                
                

                send(@main, display,@boton,point(20,420)),
                send(@main, display,@btntratamiento,point(130,450)), 
                
                send(@main, display,@boton2,point(300,450)),
        		 send(@main, display,@boton3,point(445,420)),
        		 send(@main, display,@boton4,point(610,450)),
       			  send(@main, display,@boton5,point(750,420)).
        		
                %------Funcion para mostrar la serie de preguntas------%


   preguntar(Preg,Resp):-new(Di,dialog('Consultar Datos:')),
                        new(L2,label(texto,'Responde las siguientes preguntas')),
                        id_imagen_preg(Preg,Imagen),
                        imagen_pregunta(Di,Imagen),
                        new(La,label(prob,Preg)),
                        new(B1,button(si,and(message(Di,return,si)))),
                        new(B2,button(no,and(message(Di,return,no)))),
                        send(Di, gap, size(25,25)),
                        send(Di,append(L2)),
                        send(Di,append(La)),
                        send(Di,append(B1)),
                        send(Di,append(B2)),
                        send(Di,default_button,'si'),
                        send(Di,open_centered),get(Di,confirm,Answer),
                        free(Di),
                        Resp=Answer.

                  %------Muestra la interfaz principal de la aplicacion------%

  interfaz_principal:-new(@main,dialog('Bienvenidos al sistema',
        size(1000,1000))),

        new(@texto, label(nombre,'Inicia la consulta',font('times','roman',18))),
        new(@resp1, label(nombre,'',font('times','roman',22))),
        new(@lblExp1, label(nombre,'',font('times','roman',14))),
        new(@lblExp2, label(nombre,'',font('times','roman',14))),
        new(@salir,button('SALIR',and(message(@main,destroy),message(@main,free)))),
        new(@boton, button('Iniciar consulta',message(@prolog, botones))),
        new(@btntratamiento,button('¿Tratamiento?')),
        new(@boton2, button('Bloq')),
         new(@boton3, button('Bloq')),
          new(@boton4, button('Bloq')),
          new(@boton5, button('Bloq')),

        nueva_imagen(@main, principal),
        send(@main, display,@boton,point(130,450)),

         send(@main, display,@boton2,point(300,450)),
         send(@main, display,@boton3,point(450,450)),
         send(@main, display,@boton4,point(600,450)),
         send(@main, display,@boton5,point(750,450)),
         
        send(@main, display,@texto,point(500,30)),
        send(@main, display,@salir,point(20,450)),
       send(@main, display,@resp1,point(500,60)),
        send(@main,open_centered).

       borrado:- send(@resp1, selection('')).


       	%------Es la primer interfaz que se muestra al abrir la app------%

  crea_interfaz_inicio:- new(@interfaz,dialog('Bienvenido al sistema medico UMG de Oriente',
  size(1000,1000))),

  mostrar_imagen(@interfaz, portada),

  new(BotonComenzar,button('Iniciar programa',and(message(@prolog,interfaz_principal) ,
  and(message(@interfaz,destroy),message(@interfaz,free)) ))),
  new(BotonSalir,button('Salir del programa',and(message(@interfaz,destroy),message(@interfaz,free)))),
  send(@interfaz,append(BotonComenzar)),
  send(@interfaz,append(BotonSalir)),
  send(@interfaz,open_centered).


  :-crea_interfaz_inicio.



   %------Funciones para mostrar mapas------% 

mapa1(X):-new(@tratam, dialog('Farmacias de Zacapa')),

                          send(@tratam, display,@lblExp1,point(70,51)),
                          send(@lblExp1,selection('El mapa esta abierto')),
                          send(@tratam, transient_for, @main),
                          send(@tratam, open_centered),
                          http_server([port(8080)]),
                          www_open_url('https://www.google.com.gt/maps/search/farmacias+zacapa/@14.971029,-89.535065,16z').

 mapa2(X):-new(@tratam, dialog('Farmacias de Chiquimula')),

                          send(@tratam, display,@lblExp1,point(70,51)),
                          send(@lblExp1,selection('El mapa esta abierto')),
                          send(@tratam, transient_for, @main),
                           send(@tratam, open_centered),
                           http_server([port(80)]),
                                www_open_url('https://www.google.com.gt/maps/search/farmacias+chiquimula/@14.8014487,-89.5447243,16.75z').


 mapa3(X):-new(@tratam, dialog('Farmacias de Jutiapa')),
                          send(@tratam, display,@lblExp1,point(70,51)),
                          send(@lblExp1,selection('El mapa esta abierto')),
                          send(@tratam, transient_for, @main),
                           send(@tratam, open_centered),
                           http_server([port(1521)]),         
                                www_open_url('https://www.google.com.gt/maps/search/farmacias+jutiapa/@14.3247209,-89.8836267,13.5z').

 mapa4(X):-new(@tratam, dialog('Farmacias de Izabal')),
                          send(@tratam, display,@lblExp1,point(70,51)),
                          send(@lblExp1,selection('El mapa esta abierto')),
                          send(@tratam, transient_for, @main),
                           send(@tratam, open_centered),
                           http_server([port(6667)]),         
                                www_open_url('https://www.google.com.gt/maps/search/farmacias+de+izabal/@15.5070633,-89.0380847,11z').

		%------Funcion para mostrar el tratamiento------%

  mostrar_tratamiento(X):-new(@tratam, dialog('Tratamiento')),
                          send(@tratam, append, label(nombre, 'Explicacion: ')),
                          send(@tratam, display,@lblExp1,point(70,51)),
                          send(@tratam, display,@lblExp2,point(50,80)),
                          send(@lblExp1,selection('De acuerdo a los resultados las recomendaciones son las siguientes:')),
                 		  mostrar_imagen_tratamiento(@tratam,X),

                          send(@tratam, transient_for, @main),
                           send(@tratam, open_centered).

 

  %------Base de conocimiento------%

conocimiento('covid19',
['tienes falta de aire o dificultad para respirar', 'tienes tos seca',
'tienes fiebre', 'te sientes cansado', 'tienes dolor de cabeza', 'tienes dolor de garganta', 'tienes dolor muscular']).

conocimiento('diabetes',
['tienes aumento de sed y ganas de orinar seguido', 'te sientes cansado',
'tienes una vision borrosa', 'hay ulceras que no cicatrizan', 'tienes perdida de peso sin razon', 'sientes hormigueo en las manos o pies']).

conocimiento('bronquitis',
['tienes tos con mucosidad', 'tienes dolor en el pecho',
 'te sientes cansado','tienes dolor de cabeza leve', 'tienes dolores corporales leves', 'tienes fiebre (generalmente de menos de 101 °F [38.3 °C])', 'tienes lagrimeo', 'tienes dolor de garganta']).

conocimiento('paperas',
['tienes dificultad para hablar', 'tienes perdida de apetito',
'hay dolor de oido','tienes fiebre', 'tienes dificultad para masticar','tienes dolor de cabeza']).

conocimiento('varicela',
['tienes granos en el cuerpo','tienes fiebre', 'tienes dolor de cabeza',
'te sientes cansado','tienes perdida de apetito']).

conocimiento('sarampion',
['tienes puntos blancos en la boca', 'tienes granos en el cuerpo',
'existe moqueo', 'tienes tos', 'tienes fiebre']).

conocimiento('anemia',
['estas palido', 'tienes dolor de cabeza',
 'tienes dolor en el pecho','tienes frio en manos y pies', 'has tenido mareos']).

conocimiento('resfriado',
['tienes dolor de garganta', 'tienes escalofrios',
 'tienes fiebre','tienes dificultad para tragar', 'te sientes cansado']).

conocimiento('influenza',
['tienes dolor muscular', 'tienes diarrea',
 'tienes escalofrios','tienes fiebre','existe moqueo']).

conocimiento('gastritis',
['tienes acidez estomacal', 'hay flatulencias',
 'tienes dolor estomacal','tienes hinchazon estomacal']).

		%------Pregunta los diferentes sintomas que puedes tener------%

id_imagen_preg('tienes falta de aire o dificultad para respirar','faltaaire').
id_imagen_preg('tienes tos seca','tosseca').
id_imagen_preg('tienes fiebre','fiebre2').
id_imagen_preg('te sientes cansado','cansancio2').
id_imagen_preg('tienes dolor de cabeza','cabeza2').
id_imagen_preg('tienes dolor de garganta','garganta2').
id_imagen_preg('tienes dolor muscular','muscular2').

id_imagen_preg('tienes aumento de sed y ganas de orinar seguido','massed').
id_imagen_preg('tienes una vision borrosa','borrosa').
id_imagen_preg('hay ulceras que no cicatrizan','ulceras').
id_imagen_preg('tienes perdida de peso sin razon','pesobajo').
id_imagen_preg('sientes hormigueo en las manos o pies','hormigueo').

id_imagen_preg('tienes tos con mucosidad','tosmoco').
id_imagen_preg('tienes dolor en el pecho','pecho2').
id_imagen_preg('tienes dolor de cabeza leve','dolorleve').
id_imagen_preg('tienes dolores corporales leves','corporalleve').
id_imagen_preg('tienes fiebre (generalmente de menos de 101 °F [38.3 °C])','fiebreleve').
id_imagen_preg('tienes lagrimeo','lagrimeo').

id_imagen_preg('tienes dificultad para hablar','hablar2').
id_imagen_preg('tienes perdida de apetito','apetito2').
id_imagen_preg('hay dolor de oido','oido2').
id_imagen_preg('tienes dificultad para masticar','masticar2').

id_imagen_preg('tienes granos en el cuerpo','granos2').

id_imagen_preg('tienes puntos blancos en la boca','blancos2').
id_imagen_preg('existe moqueo','moqueo2').
id_imagen_preg('tienes tos','tos2').

id_imagen_preg('estas palido','palidez2').
id_imagen_preg('tienes frio en manos y pies','frio2').
id_imagen_preg('has tenido mareos','mareo2').

id_imagen_preg('tienes escalofrios','escalofrios2').
id_imagen_preg('tienes dificultad para tragar','tragar2').

id_imagen_preg('tienes diarrea','diarrea2').

id_imagen_preg('tienes acidez estomacal','acidez2').
id_imagen_preg('hay flatulencias','flatulencias2').
id_imagen_preg('tienes dolor estomacal','dolor2').
id_imagen_preg('tienes hinchazon estomacal','hinchazon2').



 /* MOTOR DE INFERENCIA: Esta parte del sistema experto se encarga de
 inferir cual es el diagnostico a partir de las preguntas realizadas
 */
:- dynamic conocido/1.

  mostrar_diagnostico(X):-haz_diagnostico(X),clean_scratchpad.
  mostrar_diagnostico(lo_siento_diagnostico_desconocido):-clean_scratchpad .

  haz_diagnostico(Diagnosis):-
                            obten_hipotesis_y_sintomas(Diagnosis, ListaDeSintomas),
                            prueba_presencia_de(Diagnosis, ListaDeSintomas).


obten_hipotesis_y_sintomas(Diagnosis, ListaDeSintomas):-
                            conocimiento(Diagnosis, ListaDeSintomas).


prueba_presencia_de(Diagnosis, []).
prueba_presencia_de(Diagnosis, [Head | Tail]):- prueba_verdad_de(Diagnosis, Head),
                                              prueba_presencia_de(Diagnosis, Tail).


prueba_verdad_de(Diagnosis, Sintoma):- conocido(Sintoma).
prueba_verdad_de(Diagnosis, Sintoma):- not(conocido(is_false(Sintoma))),
pregunta_sobre(Diagnosis, Sintoma, Reply), Reply = 'si'.


pregunta_sobre(Diagnosis, Sintoma, Reply):- preguntar(Sintoma,Respuesta),
                          process(Diagnosis, Sintoma, Respuesta, Reply).


process(Diagnosis, Sintoma, si, si):- asserta(conocido(Sintoma)).
process(Diagnosis, Sintoma, no, no):- asserta(conocido(is_false(Sintoma))).


clean_scratchpad:- retract(conocido(X)), fail.
clean_scratchpad.


conocido(_):- fail.

not(X):- X,!,fail.
not(_).

 