disp ('                                      Carga desequilibrada em DELTA ')
disp ('                       obs: valores devem ser inseridos na forma retangular. ')
disp('-')
disp ('Insiras as tensões do gerador pedidas:')
disp('Van:')
Van = input('');
disp('Vbn:')
Vbn = input('');
disp('Vcn:')
Vcn = input('');

disp ('Insira as impedâncias pedidas:')
disp('Za:')
Za = input('');
disp('Zb:')
Zb = input('');
disp('Zc:')
Zc = input('');
disp('Zn:')
Zn = input('');

Vgerador = [Van; Vbn; Vcn] ; 

Ya = 1/Za ; Yb = 1/Zb; Yc = 1/Zc ;
Yabc = Ya + Yb + Yc;

Zcarga = [ Za+Zn Zn Zn ; Zn Zb+Zn Zn ; Zn Zn Zc+Zn];
Ycarga = inv(Zcarga); 
If = Ycarga*Vgerador ; %#ok<*MINV>

Iab = If(1,1) ; 
Ibc = If(2,1) ; 
Ica = If(3,1) ; 

Ifinv = [If(3,1); If(2,1);If(1,1)] ; 
Il = If - Ifinv  ; 

Ia = Il(1,1) ; 
Ib = Il(2,1) ; 
Ic = Il(3,1) ; 
 

disp('Tensões de fase no GERADOR.') 

abs(Van) ;  rad2deg(angle(Van));
abs(Vbn) ;  rad2deg(angle(Vbn));
abs(Vcn) ;  rad2deg(angle(Vcn));

TENSOES = ['VAN1';'VBN2';'VCN3'] ; V = [ abs(Van);abs(Vbn) ;abs(Vcn) ] ;
FASES = [ rad2deg(angle(Van)); rad2deg(angle(Vbn));rad2deg(angle(Vcn)) ] ; 

table(TENSOES, V , FASES) 

disp('Correntes de FASE E LINHA')

abs(Iab) ;  rad2deg(angle(Iab));
abs(Ibc) ;  rad2deg(angle(Ibc));
abs(Ica) ;  rad2deg(angle(Ica));
abs(Ia) ;  rad2deg(angle(Ia));
abs(Ib) ;  rad2deg(angle(Ib));
abs(Ic) ;  rad2deg(angle(Ic));

CORRENTESFASE = ['IAB';'IBC';'ICA'];
CORRENTESLINHA =['IA';'IB';'IC'] ;

A = [ abs(Iab); abs(Ibc); abs(Ica)];
ALINHA = [abs(Ia);abs(Ib);abs(Ic) ] ;

FASESCORRENTES = [rad2deg(angle(Iab)); rad2deg(angle(Ibc)) ;  rad2deg(angle(Ica))];
FASECORRLINHA = [rad2deg(angle(Ia));rad2deg(angle(Ib));rad2deg(angle(Ic))] ; 

table(CORRENTESFASE,A,FASESCORRENTES)
table(CORRENTESLINHA,ALINHA,FASECORRLINHA)