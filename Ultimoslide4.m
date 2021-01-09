disp ('                          Carga desequilibrada em Y com centro Y isolado')
disp ('                       obs: valores devem ser inseridos na forma retangular. ')
disp('-')
disp ('Insiras as tensões do gerador pedidas:')
disp('Van:')
Van = input('');
disp('Vbn:')
Vbn = input('');
disp('Vcn:')
Vcn = input('');
disp ('O sistema esta em ESTRELA(0) ou DELTA(1) ?')
resp = input('');
if (resp == 0) 
    disp ('Insira as impedâncias pedidas:')
    disp('Za:')
    Za = input('');
    disp('Zb:')
    Zb = input('');
    disp('Zc:')
    Zc = input('');
    disp('Zn:')
    Zn = input('');
end

if (resp == 1) 
    disp ('Insira as impedâncias pedidas:')
    disp('Zab:')
    Zab = input('');
    disp('Zbc:')
    Zbc = input('');
    disp('Zca:')
    Zca = input('');
    disp('Zp:')
    Zn = input('');
    Za = (Zab*Zca)/(Zab + Zbc + Zca);
    Zb = (Zab*Zbc)/(Zab + Zbc + Zca);
    Zc = (Zbc*Zca)/(Zab + Zbc + Zca);
end


Vgerador = [Van; Vbn; Vcn] ; 

Zcarga = [ Za+Zn Zn Zn ; Zn Zb+Zn Zn ; Zn Zn Zc+Zn];
Ycarga = inv(Zcarga);

Vnnl = -((Ya*Van + Yb*Vbn + Yc*Vcn)/ (Yabc));

Ya = inv(Za) ; Yb = inv(Zb) ; Yc = inv(Zc) ;
Yabc = Ya + Yb + Yc ; 
Yt = [1-(Ya/Yabc), -(Yb/Yabc),  -(Yc/Yabc); -(Ya/Yabc), 1-(Yb/Yabc), -(Yc/Yabc);
    -(Ya/Yabc),-(Yb/Yabc), 1-( Yc/Yabc)] ;


Il = Ycarga*Yt*Vgerador ; 
Ia = Il(1,1) ; 
Ib = Il(2,1) ; 
Ic = Il(3,1) ; 
In = Ia + Ib + Ic;

disp('Tensões de fase no GERADOR.') 

abs(Van) ;  rad2deg(angle(Van));
abs(Vbn) ;  rad2deg(angle(Vbn));
abs(Vcn) ;  rad2deg(angle(Vcn));

TENSOES = ['VAN1';'VBN2';'VCN3'] ; V = [ abs(Van);abs(Vbn) ;abs(Vcn) ] ;
FASES = [ rad2deg(angle(Van)); rad2deg(angle(Vbn));rad2deg(angle(Vcn)) ] ; 

table(TENSOES, V , FASES) 


disp('Correntes  e tensão de NEUTRO')

abs(In) ;  rad2deg(angle(In));
abs(Vnnl) ; rad2deg(angle(Vnnl));

In1 = abs(In); 
FaseIn =  rad2deg(angle(In));

Vnnl = abs(Vnnl) ; 
FaseVnln = rad2deg(angle(Vnnl));

table( In1, FaseIn) 
table(Vnnl, FaseVnln)

disp('Correntes sobre as CARGAS.')

abs(Ia) ;  rad2deg(angle(Ia));
abs(Ib) ;  rad2deg(angle(Ib));
abs(Ic) ;  rad2deg(angle(Ic));

CORRENTES = ['IA';'IB';'IC'] ; A = [ abs(Ia); abs(Ib); abs(Ic) ] ;

FASESCORRENTES = [rad2deg(angle(Ia)); rad2deg(angle(Ib)) ;  rad2deg(angle(Ic))] ; 


table(CORRENTES,A,FASESCORRENTES)