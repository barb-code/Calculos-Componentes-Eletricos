disp ('Linha trifásica com mútuas quaisquer alimentando carga em Y com centro isolado ou carga em triângulo')
disp ('                           obs: valores devem ser inseridos na forma retangular. ')
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
    disp('Zp:')
    Zp = input('');
    disp('Zm')
    Zm = input('');
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
    Zp = input('');
    disp('Zm')
    Zm = input('');
    disp('Zn:')
    Zn = input('');
    Za = (Zab*Zca)/(Zab + Zbc + Zca);
    Zb = (Zab*Zbc)/(Zab + Zbc + Zca);
    Zc = (Zbc*Zca)/(Zab + Zbc + Zca);
end


Ya = inv(Za) ; Yb = inv(Zb) ; Yc = inv(Zc) ;
Yabc = Ya + Yb + Yc ; 
Yt = [1-(Ya/Yabc), -(Yb/Yabc),  -(Yc/Yabc); -(Ya/Yabc), 1-(Yb/Yabc), -(Yc/Yabc);
    -(Ya/Yabc),-(Yb/Yabc), 1-( Yc/Yabc)] ;

Vgerador = [Van; Vbn; Vcn] ; 

Zrede = [ Zp Zm Zm ; Zm Zp Zm ; Zm Zm Zp];
Zcarga = [ Za+Zn Zn Zn ; Zn Zb+Zn Zn ; Zn Zn Zc+Zn];

Imp= (Yt*Zrede)+ Zcarga;
Yimp = inv(Imp);

Il = Yimp*Yt*Vgerador ; 
Ia = Il(1,1) ; 
Ib = Il(2,1) ; 
Ic = Il(3,1) ; 

In = Ia + Ib + Ic ;
 

Vcarg = Vgerador - Zrede*Il;

Valnl = Vcarg(1,1);
Vblnl = Vcarg(2,1);
Vclnl = Vcarg(3,1);

Vnln = -(Ya*Valnl + Yb*Vblnl + Yc*Vclnl)/(Yabc);

Valbl = Valnl - Vblnl ; 
Vblcl = Vblnl - Vclnl ; 
Vclal = Vclnl - Valnl ; 

if resp == 1
    
    Valbl = Valnl;  
    Vblcl = Vblnl; 
    Vclal = Vclnl;
end    

disp('Tensões de fase no GERADOR.') 

abs(Van) ;  rad2deg(angle(Van));
abs(Vbn) ;  rad2deg(angle(Vbn));
abs(Vcn) ;  rad2deg(angle(Vcn));

TENSOES = ['VAN1';'VBN2';'VCN3'] ; V = [ abs(Van);abs(Vbn) ;abs(Vcn) ] ;
FASES = [ rad2deg(angle(Van)); rad2deg(angle(Vbn));rad2deg(angle(Vcn)) ] ; 

table(TENSOES, V , FASES) 

disp('Tensões de fase e linha na CARGA.') 

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

disp('Correntes  e tensão de NEUTRO')

abs(In) ;  rad2deg(angle(In));
abs(Vnln) ; rad2deg(angle(Vnln));

In1 = abs(In); FaseIn =  rad2deg(angle(In));
VNLN = abs(Vnln) ; FaseVnln =rad2deg(angle(Vnln));

table( In1, FaseIn) 
table(VNLN, FaseVnln)

disp('Correntes de linha na CARGA.')

abs(Ia) ;  rad2deg(angle(Ia));
abs(Ib) ;  rad2deg(angle(Ib));
abs(Ic) ;  rad2deg(angle(Ic));

CORRENTES = ['IA';'IB';'IC'] ; A = [ abs(Ia); abs(Ib); abs(Ic) ] ;

FASESCORRENTES = [rad2deg(angle(Ia)); rad2deg(angle(Ib)) ;  rad2deg(angle(Ic))] ; 


table(CORRENTES,A,FASESCORRENTES)