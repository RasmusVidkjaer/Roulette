%filnavn: Roulette
function Roulette
%chadias start funktion
saldo = input("Hvormanget vil du spille for? ");


chips = saldo * 10;

disp("Du har " + chips + " chips, at spille for.")




%placering af bet
start = ("ja");
while start ~= ("nej")
    x = input("vil du bette på et tal? ","s");
    if x == "ja"
        Bnummer = ' ';
        Bnummer = input( "Vælg et tal mellem 0 og 36 ");  %Her kan der bettes på ét tal mellem 0-36
        while Bnummer ~= [0:36]
            disp("Ikke muligt prøv igen");
            Bnummer = input( "Vælg et tal mellem 0 og 36 ");
        end
        chipsnummer = input("Hvormange chips vil du bette på " + Bnummer + "? "); % (Lav en grænse på dette input, og sådan at man kan skrive "nej")
        
        while chipsnummer > chips
            disp("Du har desvære ikke chips nok")
            pause(0.5)
            disp("Du har " + chips + " chips")
            pause(0.5)
            chipsnummer = input("Hvormange chips vil du bette på " + Bnummer + "? ");
        end
        
        chips = chips - chipsnummer;
        
    end
    
    
    
    
    
    
    
    Bfarve = " "; %sætter variablen
    y = input( "Vil du bette på en farve? ", "s");
    if y == ("ja")
        while Bfarve ~= ["sort", "rød", "nej"]
            Bfarve = input("Hvilken farve ville du bette på", "s");   %her kan der bettes på Rød eller Sort
            while Bfarve ~= ["sort", "rød"]
                disp("Dette input er dsv ikke muligt prøv med sort eller rød")
                Bfarve = input("Hvilken farve ville du bette på", "s");
            end
            pause(0.5)
            chipsfarve = input("Hvormange chips vil du bette på " + Bfarve);
            while chipsfarve > chips
                disp("Du har desvære ikke chips nok")
                disp("Du har " + chips + " chips")
                chipsfarve = input("Hvormange chips vil du bette på " + Bfarve);
            end
            chips = chips - chipsfarve;
        end
    end
        
Even = [2:2:36];
Odd = [1:2:35];
Red = [1:2:9,12:2:18,19:2:27,30:2:36];
Black = [2:2:10,11:2:17,20:2:28,29:2:35];
A=[1:12];
B=[13:24];
C=[25:36];
D=[1:18];
E=[19:36];
        
        
        %Her skal vi gøre sådan at man kun kan svare med "sort" / "rød" muligvis
        
        
        %Binterval = input() 0-18 / 19-36...
        
        %Bx = input()...
        
        
        
   
    a = ["r","s","r","s","r","s","r","s","r","s","r","s","r","s","r","s","r","s","r","s","r","s","r","s","r","s","r","s","r","s","r","s","r","s","r","s"];
    
    %Berarbejdning af bet:
    R = randi(36);
    
    for i=[0:36]
        if Bnummer==i
            if Bnummer == R
                disp("Du ramte plet på dit tal!")
                chips = 36*chipsnummer;
            end
        end
    end
    
    if Bfarve == a(R)
        disp("Du ramte plet på din farve!")
        chips = 2*chipsfarve;
        
    end
    
    disp("tallet blev " + R + " og farven er " + a(R))
    disp("Du har " + chips + " chips")
    start = input("Vil du spille igen? ", "s");
    
    k = input("vil du købe flere chips? ","s")
    if k == ("ja")
        chips2 = input("Hvormange chips vil du købe?")
        chips = chips + chips2
        disp("det bliver" + ((chips2)/(10)) + "kr.")
    end
    
    
end











