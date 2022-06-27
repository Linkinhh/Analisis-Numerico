function biseccion
%Valores de Entrada: 
%a b tolerancia=tol Iteraciones=N0 La funcion fx
syms x;
a= input('El valor de a es: ');
b= input('El valor de b es: ');
tol=input('El valor de la tolerancia es: ');
N0=input('El numero de iteraciones sera: ');
fx=input('La funcion es: ');

%inline() construye un objeto de funcion en linea a
%partir de la expresion
f=inline(fx);

%%grafica inicial
fplot(fx,'k-','LineWidth',2);%Grafica la función de color negro y grosor 2
title('Grafico de la secante'); hold on; grid on; %Título de la función.
axis([-10 10 -10  10])
line([-10 10],[0 0],'Color','k','LineStyle','--'); %Marca el eje X.
line([0 0],[-10 10],'Color','k','LineStyle','--'); %Marca el eje Y.
xlabel('Eje X') ;
ylabel('Eje Y') ;
pause
ac=1;%%

%paso1
i=1;
FA=f(a);
%paso2
while(i<=N0)
%paso3
    p=a+(b-a)/2;
    FP=f(p);
    
%Grafica en el tiempo    
    ac=ac*0.5;
    plot(b,f(b),'ro-');
    plot(a,f(a),'ro-');
    fplot(fx,'k-','LineWidth',2);%Grafica la función de color negro y grosor 2
    title('Método de la bisección'); hold on; grid on; %Título de la función.
    axis([a-ac b+ac f(a)-ac  f(b)+ac])
    line([-10 10],[0 0],'Color','k','LineStyle','--'); %Marca el eje X.
    line([0 0],[-10 10],'Color','k','LineStyle','--'); %Marca el eje Y.
    xlabel('Eje X') ;
    ylabel('Eje Y') ;
    pause
    
%paso4
    if((FP==0)|((b-a)/2<tol))
        disp('La solucion de f(x)=0 es:')
        disp(p)
        pause
    end
%paso5
    i=i+1;
%paso6    
    if(FA*FP>0)
        a=p;
        FA=FP;
    else
        b=p;
    end
end
%paso7
disp('El metodo falló')