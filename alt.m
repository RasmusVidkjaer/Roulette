%filnavn: Roulette
function Roulette
%chadias start funktion
saldo = input("Hvormanget vil du spille for? ");
startchips = saldo * 10;
chips = startchips;
disp("Du har " + chips + " chips, at spille for.")

%placering af bet på tal
for i = 1:1000000000
    tal = input("Vil du bette på et tal? ","s");
    while tal ~= ["ja","nej"]
        disp("Svar med ja eller nej");
        tal = input("Vil du bette på et tal? ","s");
    end
    Bnummer = ' ';
    if tal == "ja" || tal == "Ja"
        Bnummer = input( "Vælg et tal mellem 0 og 36. ");  %Her kan der bettes på ét tal mellem 0-36
        while Bnummer ~= [0:36]
            disp("Ikke muligt prøv igen!");
            Bnummer = input( "Vælg et tal mellem 0 og 36. ");
        end
        chipsnummer = input("Hvormange chips vil du bette på " + Bnummer + "? "); 
        
        while chipsnummer > chips
            disp("Du har desvære ikke chips nok")
            pause(0.5)
            disp("Du har " + chips + " chips.")
            pause(0.5)
            chipsnummer = input("Hvormange chips vil du bette på " + Bnummer + "? ");
        end
        
        chips = chips - chipsnummer;
        
    end
    %placering af bet på farve
    Bfarve = " "; 
    farve = strip(input( "Vil du bette på en farve? ", "s"));
    while farve ~= ["ja","nej"]
        disp("Svar med ja eller nej");
        farve = input("Vil du bette på en farve? ","s");
    end
    if farve == ("ja") || farve == ("Ja")
        while Bfarve ~= ["sort", "Sort", "rød", "Rød", "nej", "Nej"]
            Bfarve = input("Hvilken farve ville du bette på? ", "s");   %her kan der bettes på Rød eller Sort
            while Bfarve ~= ["sort", "Sort", "rød", "Rød"]
                disp("Dette input er dsv ikke muligt prøv med sort/Sort eller rød/Rød.")
                Bfarve = input("Hvilken farve ville du bette på? ", "s");
            end
            pause(0.5)
            chipsfarve = input("Hvormange chips vil du bette på " + Bfarve+"? ");
            while chipsfarve > chips
                disp("Du har desvære ikke chips nok!")
                disp("Du har " + chips + " chips. ")
                chipsfarve = input("Hvormange chips vil du bette på " + Bfarve+"? ");
            end
            chips = chips - chipsfarve;
        end
    end
    
    %placering af bet på specialefeldt
    Bspecial = " "; %sætter variablen
    special = input( "Vil du bette på en specialefeldt? ", "s");
    while special ~= ["ja","nej"]
        disp("Svar med ja eller nej");
        special = input("Vil du bette på special? ","s");
    end
    if special == ("ja") || special == ("Nej")
        while Bspecial ~= ["Even", "Odd", "1:12", "13:24", "25:36", "1:18", "19:36", "Nej"]
            Bspecial = input("På hvilket specialefeldt vil du placer dit chip? Even, Odd, 1:12, 13:24, 25:36, 1:18, 19:36. ","s");
            while Bspecial ~= ["Even", "Odd", "1:12", "13:24", "25:36", "1:18", "19:36"]
                disp("Dette input er dsv ikke muligt prøv med Even, Odd, 1:12, 13:24, 25:36, 1:18, 19:36")
                Bspecial = input("På hvilket specialefeldt vil du placer dit chip? Even, Odd, 1:12, 13:24, 25:36, 1:18, 19:36. ","s");
            end
            pause(0.5)
            chipsspecial = input("Hvormange chips vil du bette på " + Bspecial+"? ");
            while chipsspecial > chips
                disp("Du har desvære ikke chips nok!")
                disp("Du har " + chips + " chips.")
                chipsspecial = input("Hvormange chips vil du bette på " + Bspecial+"? ");
            end
            chips = chips - chipsspecial;
        end
    end
    
    
    %Berarbejdning af bet:
    R = randi(36);
    
    %arrays
    Even = [2:2:36];
    Odd = [1:2:35];
    Red = [1:2:9,12:2:18,19:2:27,30:2:36];
    Black = [2:2:10,11:2:17,20:2:28,29:2:35];
    A=[1:12];
    B=[13:24];
    C=[25:36];
    D=[1:18];
    E=[19:36];
    
    %Vis hvor kulen landede
    if ismember(R,Even)
        if ismember(R,Red)
            disp("Kuglen landede på "+R+" som er lige og rød.")
        else
            disp("Kuglen landede på "+R+" som er lige og sort.")
        end
    else ismember(R, Odd)
        if ismember(R,Black)
            disp("Kuglen landede på "+R+" som er ulige og sort.")
        else
            disp("Kuglen landede på "+R+" som er ulige og rød.")
        end
    end
    
    %Tal behandling
    if Bnummer == R
        chipsnummer = chip*36;
    else
        chipsnummer = 0;
    end
    
    %Farve behandling
    if Bfarve == "Rød" && ismember(R,Red) || Bfarve == "rød" && ismember(R,Red)
        chipsfarve = chipsfarve*2;
    elseif Bfarve == "Sort" && ismember(R,Black) || Bfarve == "sort" && ismember(R,Black)
        chipsfarve = chipsfarve*2;
    else
        chipsfarve = 0;
    end
    
    %Special behandling
    if Bspecial == "Even" && ismember(R,Even)
        chipsspecial = chipsspecial*2;
    elseif Bspecial == "Odd" && ismember(R, Odd)
        chipsspecial = chipsspecial*2;
    elseif Bspecial == "1:12" && ismember(R,A)
        chipsspecial = chipsspecial*3;
    elseif Bspecial == "13:24" && ismember(R,B)
        chipsspecial = chipsspecial*3;
    elseif Bspecial == "25:36" && ismember(R,C)
        chipsspecial = chipsspecial*3;
    elseif Bspecial == "1:18" && ismember(R,D)
        chipsspecial = chipsspecial*2;
    elseif Bspecial == "19:36" && ismember(R,E)
        chipsspecial = chipsspecial*2;
    else
        chipsspecial = 0;
    end
    
    
   
    
    %Afrunding af program
    chips = chips + chipsnummer + chipsfarve + chipsspecial;
    if chips < startchips
        disp("Du har nu "+chips+" chips! Bedre held næste gang!")
    elseif chips >= startchips
        disp("Tillykke! Du har nu "+chips+" chips!")
    end
    
    
    %datainsamling
    data(i)=chips;
    
    
    
    %Slut?
    if chips==0
        break
    end
    start = input("vil du fortsætte? ","s");
    if start == "nej";
        break
    end
end
x=linspace(1,i,i);
plot(x,data,"-o")
xlabel('Antal spil')
ylabel('Chips')
title('Graf over dit spilleforløb')
%hentet fra https://se.mathworks.com/matlabcentral/answers/491194-how-to-change-the-x-axis-labels-of-a-plot-so-that-they-only-show-integer-values
ax = gca;
ax.XTick = unique( round(ax.XTick) );



