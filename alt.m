%Filnavn alt
function alt
disp("Hej, velkommen til !")
pause(1)
chip = 0
while chip == 0
chip = input ("Hvor mangen chips har du?")
if chip >= 1
    break
else 
    disp("Ikke muligt prøv igen")
    continue
end
end

disp("På hvilket feldt vil du placer dit chip?")
pause(1)
svar = input("Vil du placer på et talfeldt? ","s")
if svar == "Ja"
    bet = input ("På hvilket feldt vil du placer dit chip? Vælg mellem 1 til 36. ")
elseif svar == "Nej"
    bet = input("På hvilket specialefeldt vil du placer dit chip? Even, Odd, Red, Black, 1:12, 13:24, 25:36, 1:18, 19:36. ","s")
else
    disp("Ikke gyldigt svar. Skriv Ja eller Nej")
end

while bet==true
    if bet>=1
    if bet<=36
        break
    else disp("Ikke muligt prøv igen")
        continue  
    end
else
    disp("Ikke muligt prøv igen")
    continue
end   
end

R = randi(36)

Even = [2:2:36]
Odd = [1:2:35]
Red = [1:2:9,12:2:18,19:2:27,30:2:36]
Black = [2:2:10,11:2:17,20:2:28,29:2:35]
A=[1:12]
B=[13:24]
C=[25:36]
D=[1:18]
E=[19:36]

if ismember(R,Even)
    if ismember(R,Red)
    disp(R+" is Even and Red")
    else
        disp(R+" is Even and Black")
    end
else ismember(R, Odd)
    if ismember(R,Black)
    disp(R+" is Odd and Black")
    else
        disp(R+" is Odd and Red")
    end
end
if svar == "Ja"
    if bet == R
        chip = chip*36
    else
        chip = 0
    end
else
    if bet == "Even" && ismember(R,Even)
        chip = chip*2
    elseif bet == "Odd" && ismember(R, Odd)
        chip = chip*2
    elseif bet == "Red" && ismember(R,Red)
        chip = chip*2
    elseif bet == "Black" && ismember(R,Black)
        chip = chip*2
    elseif bet == "1:12" && ismember(R,A)
        chip = chip*3
    elseif bet == "13:24" && ismember(R,B)
        chip = chip*3
    elseif bet == "25:36" && ismember(R,C)
        chip = chip*3
    elseif bet == "1:18" && ismember(R,D)
        chip = chip*2
    elseif bet == "19:36" && ismember(R,E)
        chip = chip*2
    else
        chip = 0
    end
end
    disp("Du har nu "+chip+" chips")