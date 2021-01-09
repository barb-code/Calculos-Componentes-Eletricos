disp (       'Linha trif�sica com m�tuas quaisquer alimentando carga em Y aterrada atrav�s de imped�ncia')
disp ('                           obs: valores devem ser inseridos na forma retangular. ')
disp('-')
disp ('Insiras as tens�es do gerador pedidas:')
disp('Van:')
Van = input('');
disp('Vbn:')
Vbn = input('');
disp('Vcn:')
Vcn = input('');
disp ('O sistema esta em ESTRELA(0) ou DELTA(1) ?')
resp = input('');
    if (resp == 0) 
        disp ('Insira as imped�ncias pedidas:')
        disp('Za:')
        Za = input('');
        disp('Zb:')
        Zb = input('');
        disp('Zc:')
        Zc = input('');
        disp('Zp:')
        Zp = input('');
        disp('Zm')
        Zm = input('');
        disp('Zn:')
        Zn = input('');
    end

    if (resp == 1) 
         disp ('Insira as imped�ncias pedidas:')
        disp('Zab:')
         Zab = input('');
        disp('Zbc:')
        Zbc = input('');
        disp('Zca:')
        Zca = input('');
        disp('Zp:')
         Zp = input('');
        disp('Zm')
        Zm = input('');
        disp('Zn:')
        Zn = input('');
        Za = (Zab*Zca)/(Zab + Zbc + Zca);
        Zb = (Zab*Zbc)/(Zab + Zbc + Zca);
        Zc = (Zbc*Zca)/(Zab + Zbc + Zca);
    end

Vgerador = [Van; Vbn; Vcn] ; 

Zrede = [ Zp Zm Zm ; Zm Zp Zm ; Zm Zm Zp];
Zcarga = [ Za+Zn Zn Zn ; Zn Zb+Zn Zn ; Zn Zn Zc+Zn];
Ztotal = Zrede + Zcarga ;
Ytotal = inv(Ztotal) ;

Il = Ytotal*Vgerador ;%#ok<*MINV>
Ia = Il(1,1) ; 
Ib = Il(2,1) ; 
Ic = Il(3,1) ; 

In = Ia + Ib + Ic ;
Vnln = In*Zn ; 

Valnl = Ia*Za + (Ia + Ib + Ic)*Zn ;
Vblnl = Ib*Zb + (Ia + Ib + Ic)*Zn ;
Vclnl = Ic*Zc + (Ia + Ib + Ic)*Zn ;

Valbl = Valnl - Vblnl ; 
Vblcl = Vblnl - Vclnl ; 
Vclal = Vclnl - Valnl ; 

if (Za == Zb == Zc)
    Valbl = 0 ; Vblcl = 0 ; Vclal = 0;
    disp('VL = VF')
end

disp('Tens�es de fase no GERADOR.') 

abs(Van) ;  rad2deg(angle(Van));
abs(Vbn) ;  rad2deg(angle(Vbn));
abs(Vcn) ;  rad2deg(angle(Vcn));

TENSOES = ['VAN1';'VBN2';'VCN3'] ; V = [ abs(Van);abs(Vbn) ;abs(Vcn) ] ;
FASES = [ rad2deg(angle(Van)); rad2deg(angle(Vbn));rad2deg(angle(Vcn)) ] ; 

table(TENSOES, V , FASES) 

disp('Tens�es de fase e linha na CARGA.') 

abs(Valnl) ;  rad2deg(angle(Valnl));
abs( Vblnl) ;  rad2deg(angle(Vblnl));
abs(Vclnl) ;  rad2deg(angle(Vclnl));
abs(Valbl) ;  rad2deg(angle(Valbl));
abs( Vblcl) ;  rad2deg(angle(Vblcl));
abs(Vclal) ;  rad2deg(angle(Vclal));

TENSOESCARGAFASE = ['VALNL1';'VBLNL2';'VCLNL3'];
TENSOESCARGALINHA = ['VALBL';'VBLCL';'VCLAL'] ; 
V1FASE = [ abs(Valnl);abs( Vblnl); abs(Vclnl)] ;
V1LINHA = [abs(Valbl); abs( Vblcl) ; abs(Vclal) ] ;
FASESCARGA = [ rad2deg(angle(Valnl));rad2deg(angle(Vblnl)); rad2deg(angle(Vclnl)) ];
FASESLINHA = [rad2deg(angle(Valbl));rad2deg(angle(Vblcl)); rad2deg(angle(Vclal))  ] ; 

table(TENSOESCARGAFASE, V1FASE , FASESCARGA ) 

table(TENSOESCARGALINHA, V1LINHA , FASESLINHA) 

disp('Corrente  e tens�o de NEUTRO')

abs(In) ;  rad2deg(angle(In));
abs(Vnln) ; rad2deg(angle(Vnln));

In1= abs(In) ; FASEINL=rad2deg(angle(In));
VNLN = abs(Vnln); FASEVNLN = rad2deg(angle(Vnln));

table(In1, FASEINL, VNLN, FASEVNLN) 

disp('Correntes sobre a carga')

abs(Ia) ;  rad2deg(angle(Ia));
abs(Ib) ;  rad2deg(angle(Ib));
abs(Ic) ;  rad2deg(angle(Ic));

CORRENTES = ['IA';'IB';'IC'] ; A = [ abs(Ia); abs(Ib); abs(Ic) ] ;

FASESCORRENTES = [rad2deg(angle(Ia)); rad2deg(angle(Ib)) ;  rad2deg(angle(Ic))] ; 


table(CORRENTES,A,FASESCORRENTES)