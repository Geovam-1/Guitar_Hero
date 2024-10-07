:- module(jogo, [jogo/2]).
:- use_module(library(time)).
:- use_module('Util.pl').
:- use_module('InterfaceTexto/Texto.pl').

guitar_base([
    "",
    "|   |   |   |   |   |\n",
    "|   |   |   |   |   |\n",
    "|   |   |   |   |   |\n",
    "|   |   |   |   |   |\n",
    "|   |   |   |   |   |\n",
    "|   |   |   |   |   |\n",
    "|---|---|---|---|---|\n",
    "| A | S | J | K | L |\n"
]).

processaTupla((A,S,J,K,L), R) :-
    (A = 0 -> N1 = ' '; N1 = 'A'),
    (S = 0 -> N2 = ' '; N2 = 'S'),
    (J = 0 -> N3 = ' '; N3 = 'J'),
    (K = 0 -> N4 = ' '; N4 = 'K'),
    (L = 0 -> N5 = ' '; N5 = 'L'),
    atomics_to_string(['| ', N1, ' | ', N2, ' | ', N3, ' | ', N4, ' | ', N5, ' |', '\n'], R).

processaEntrada(Intervalo, Entrada) :-
    get_time(Inicio),
    processaEntrada(Intervalo, Inicio, [], Entrada).

processaEntrada(Intervalo, Inicio, Acc, Entrada) :-
    get_time(Atual),
    TempoDecorrido is Atual - Inicio,
    TempoRestante is Intervalo - TempoDecorrido,
    
    (TempoRestante > 0.0 ->
        (catch(call_with_time_limit(TempoRestante, get_single_char(Char)),
               time_limit_exceeded, Char = 0)
        -> (Char \= 0 ->
                C is Char - 32,
                char_code(CharCode, C),
                append(Acc, [CharCode], NewAcc),
                processaEntrada(Intervalo, Inicio, NewAcc, Entrada)
            ;  Entrada = Acc)
        ;  Entrada = Acc)
    ;  Entrada = Acc).

entradaLista(Entrada, String) :-
    (Entrada = [] -> String = " "
    ; atom_codes(String, Entrada)).

formataEntrada(Entrada, Formatada) :-
    string_length(Entrada, Len),
    ( Len = 0 ; Len > 5 ; Entrada = " " ) ->
        Formatada = "|   |   |   |   |   |\n"
    ;
    string_chars(Entrada, Chars),
    
    Inicial = [' ', ' ', ' ', ' ', ' '],

    substituiChar(Chars, Inicial, Final),
    
    formataLista(Final, Formatada).

substituiChar([], Lista, Lista).
substituiChar([H|T], Lista, Final) :-
    ( H = 'A' -> nth0(0, Lista, _, Lista1), nth0(0, ListaFinal, 'A', Lista1)
    ; H = 'S' -> nth0(1, Lista, _, Lista2), nth0(1, ListaFinal, 'S', Lista2)
    ; H = 'J' -> nth0(2, Lista, _, Lista3), nth0(2, ListaFinal, 'J', Lista3)
    ; H = 'K' -> nth0(3, Lista, _, Lista4), nth0(3, ListaFinal, 'K', Lista4)
    ; H = 'L' -> nth0(4, Lista, _, Lista5), nth0(4, ListaFinal, 'L', Lista5)
    ; ListaFinal = Lista
    ),
    substituiChar(T, ListaFinal, Final).

formataLista([A, S, J, K, L], Formatada) :-
    format(string(Formatada), "| ~w | ~w | ~w | ~w | ~w |\n", [A, S, J, K, L]).

loopJogo([], _, NickName, P, _):- 
    strFimDeJogo(NickName, P, Str), 
    write(Str),
    sleep(3).
loopJogo([H|T], Estado, NickName, Pontuacao, Sequencia):- 
    processaTupla(H, NovaLinha),
    removeLinha7(Estado, 1, R),
    adicionaLinha(NovaLinha, R, R2),
    guitarraString(R2, NickName, Pontuacao, Sequencia, 0, R3),
    colorirImprimirLinhas(R3),
    processaEntrada(0.24, CharCodes),
    entradaLista(CharCodes, Entrada),
    formataEntrada(Entrada, EntradaFormatada),
    nth0(5, Estado, LinhaAtual),
    (verificarEntrada(EntradaFormatada, LinhaAtual) -> pontuacao(LinhaAtual, Pontuacao, Sequencia, P),
    sequencia(LinhaAtual, Sequencia, S); P = Pontuacao , S = 0),  
    limparTerminal,
    loopJogo(T, R2, NickName, P, S).

pontuacao(Entrada, PontuacaoAtual, SequenciaAtual, NovaPontuacao) :- 
    (Entrada \= "|   |   |   |   |   |\n" -> 
        (SequenciaAtual mod 10 =:= 0, SequenciaAtual > 0 -> 
            NovaPontuacao is PontuacaoAtual + 50,
            writeln("Bônus! +50"); 
            NovaPontuacao is PontuacaoAtual + 10)
    ; 
        NovaPontuacao = PontuacaoAtual
    ).

sequencia(Entrada, SequenciaAtual, NovaSequencia) :- 
    (Entrada \= "|   |   |   |   |   |\n" ->  
        NovaSequencia is SequenciaAtual + 1 
    ;  
        NovaSequencia = SequenciaAtual
    ).

verificarEntrada(Entrada, EntradaEsperada) :- Entrada = EntradaEsperada.

guitarraString([], _, _, _, _, "").
guitarraString([H|T], NickName, Pontuacao, Sequencia, Pos, Guitarra):-
    P is Pos + 1,
    guitarraString(T, NickName, Pontuacao, Sequencia, P, ProximaLinha),
    (P = 1 -> (Sequencia mod 10 =:= 0, Sequencia > 0 ->
        format(string(Formatada), "Jogador: ~w Pontuação: ~w Sequência: ~w Bonus! 50+\n", [NickName, Pontuacao, Sequencia]);
        format(string(Formatada), "Jogador: ~w Pontuação: ~w Sequência: ~w\n", [NickName, Pontuacao, Sequencia])),
        string_concat(Formatada, H, Temp),
        string_concat(Temp, ProximaLinha, Guitarra) 
    ; 
        string_concat(H, ProximaLinha, Guitarra)
    ).

adicionaLinha(NovaLinha, Lista, [NovaLinha|Lista]). 

removeLinha7([_|T], Altura, T):- Altura = 7, !.
removeLinha7([H|T], Altura, R):- A is Altura + 1, removeLinha7(T, A, R2), R = [H|R2]. 

jogo(Notas, NickName):-
    guitar_base(Guitarra),
    loopJogo(Notas, Guitarra, NickName, 0, 0).