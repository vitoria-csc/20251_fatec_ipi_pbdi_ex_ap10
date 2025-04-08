-- Gerar inteiros no intervalo de -50 a 50.

-- LOOP
DO $$
DECLARE
		i INT;
		numero INT;
		contador INT := 0;
BEGIN
	FOR i IN 1..6 LOOP
		numero := valor_aleatorio_entre(-50,50);
		RAISE NOTICE ' %',numero;
		IF numero > 0 THEN
			contador := contador + 1;
		END IF;	
	END LOOP;
	  IF contador > 2 THEN
        RAISE NOTICE '% Números positivos', contador;
    ELSIF contador = 1 THEN
        RAISE NOTICE '1 Número positivo';
    ELSE
        RAISE NOTICE 'Nenhum positivo';
    END IF;
END;
$$

-- WHILE
DO $$
DECLARE
		i INT := 0;
		numero INT;
		contador INT := 0;
BEGIN
	WHILE i < 6 loop
		numero := valor_aleatorio_entre(-50,50);
		RAISE NOTICE '%',numero;
		IF numero > 0 THEN
			contador := contador + 1;
		END IF;
		i := i + 1;
	END LOOP;
	IF contador > 2 THEN
		RAISE NOTICE '% Números positivos', contador;
	ELSIF contador = 1 THEN
		RAISE NOTICE '1 Número positivo';
	ELSE
		RAISE NOTICE 'Nenhum positivo';
 END IF;
END;
$$;

--FOREACH
DO $$
DECLARE
	numeros INTEGER[] := ARRAY[
        valor_aleatorio_entre(-50, 50),
        valor_aleatorio_entre(-50, 50),
        valor_aleatorio_entre(-50, 50),
        valor_aleatorio_entre(-50, 50),
        valor_aleatorio_entre(-50, 50),
		valor_aleatorio_entre(-50, 50)];
	numero INT;
	contador INT := 0;
	i INT := 1;
BEGIN
	FOREACH numero IN ARRAY numeros LOOP
		RAISE NOTICE '%',numero;
	IF numero > 0 THEN
		contador := contador + 1;
	END IF;
	i := i + 1;
	END LOOP;
	IF contador > 2 THEN
	 	RAISE NOTICE '% Números positivos', contador;
     ELSIF contador = 1 THEN
	 	RAISE NOTICE '1 Número positivo';
	 ELSE
	 	RAISE NOTICE 'Nenhum positivo';
	 END IF;
END;
$$

-- Gerar inteiros no intervalo de 20 a 50.

-- LOOP
DO $$
DECLARE
    x INT := valor_aleatorio_entre(20, 50);
    y INT := valor_aleatorio_entre(20, 50);
    soma INT := 0;
    menor INT;
    maior INT;
    i INT;
BEGIN
    menor := LEAST(x, y) + 1;		-- Determina limites(menores)
    maior := GREATEST(x, y) - 1;	-- Determina limites(maiores)

    i := menor;
    LOOP
        EXIT WHEN i > maior;
        IF i % 2 != 0 THEN
            soma := soma + i;
        END IF;
        i := i + 1;
    END LOOP;

    RAISE NOTICE 'X: %, Y: %, Soma dos ímpares: %', x, y, soma;
END;
$$

-- WHILE
DO $$
DECLARE
    x INT := valor_aleatorio_entre(20, 50);
    y INT := valor_aleatorio_entre(20, 50);
    soma INT := 0;
    i INT;
    menor INT;
    maior INT;
BEGIN
    menor := LEAST(x, y) + 1;
    maior := GREATEST(x, y) - 1;

    i := menor;
    WHILE i <= maior LOOP
        IF i % 2 != 0 THEN
            soma := soma + i;
        END IF;
        i := i + 1;
    END LOOP;

    RAISE NOTICE 'X: %, Y: %, Soma dos ímpares: %', x, y, soma;
END;
$$

-- FOR
DO $$
DECLARE
    x INT := valor_aleatorio_entre(20, 50);
    y INT := valor_aleatorio_entre(20, 50);
    soma INT := 0;
    menor INT;
    maior INT;
BEGIN
    menor := LEAST(x, y) + 1;
    maior := GREATEST(x, y) - 1;

    FOR i IN menor..maior LOOP
        IF i % 2 != 0 THEN
            soma := soma + i;
        END IF;
    END LOOP;

    RAISE NOTICE 'X: %, Y: %, Soma dos ímpares: %', x, y, soma;
END;
$$

-- FOREACH
DO $$
DECLARE
    x INT := valor_aleatorio_entre(20, 50);
    y INT := valor_aleatorio_entre(20, 50);
    menor INT := LEAST(x, y) + 1;
    maior INT := GREATEST(x, y) - 1;
    numeros INT[] := '{}'; 
    i INT;
    soma INT := 0;
BEGIN
    FOR i IN menor..maior LOOP
        numeros := array_append(numeros, i);
    END LOOP;

    -- impares
    FOREACH i IN ARRAY numeros LOOP
        IF i % 2 != 0 THEN
            soma := soma + i;
        END IF;
    END LOOP;

    RAISE NOTICE 'X: %, Y: %, Soma dos ímpares entre eles: %', x, y, soma;
END;
$$

-- Gerar inteiros no intervalo de 1 a 100.

-- LOOP
DO $$
DECLARE
    count INTEGER := 0;
    numero INTEGER;
BEGIN
    LOOP
        numero := FLOOR(1 + RANDOM() * 100);  -- gera número de 1 a 100
        RAISE NOTICE 'LOOP: %', numero;
        count := count + 1;
        EXIT WHEN count = 5;
    END LOOP;
END $$;

-- WHILE
DO $$
DECLARE
    count INTEGER := 0;
    numero INTEGER;
BEGIN
    WHILE count < 5 LOOP
        numero := FLOOR(1 + RANDOM() * 100);
        RAISE NOTICE 'WHILE: %', numero;
        count := count + 1;
    END LOOP;
END $$;

-- FOR
DO $$
DECLARE
    numero INTEGER;
BEGIN
    FOR i IN 1..5 LOOP
        numero := FLOOR(1 + RANDOM() * 100);
        RAISE NOTICE 'FOR: %', numero;
    END LOOP;
END $$;

-- FOREACH
DO $$
DECLARE
    numeros INTEGER[] := ARRAY[
        FLOOR(1 + RANDOM() * 100),
        FLOOR(1 + RANDOM() * 100),
        FLOOR(1 + RANDOM() * 100),
        FLOOR(1 + RANDOM() * 100),
        FLOOR(1 + RANDOM() * 100)
    ];
    numero INTEGER;
BEGIN
    FOREACH numero IN ARRAY numeros LOOP
        RAISE NOTICE 'FOREACH: %', numero;
    END LOOP;
END $$;

--1.2 Faça um programa que calcule o determinante de uma matriz quadrada de ordem 3 utilizando a regra de Sarrus.

DO
$$
DECLARE
a INT := valor_aleatorio_entre(1, 12);
b INT := valor_aleatorio_entre(1, 12);
c INT := valor_aleatorio_entre(1, 12);
d INT := valor_aleatorio_entre(1, 12);
e INT := valor_aleatorio_entre(1, 12);
f INT := valor_aleatorio_entre(1, 12);
g INT := valor_aleatorio_entre(1, 12);
h INT := valor_aleatorio_entre(1, 12);
i INT := valor_aleatorio_entre(1, 12);
determinante INT;

BEGIN
RAISE NOTICE 'Matriz:';
RAISE NOTICE '[%, %, %]', a, b, c;
RAISE NOTICE '[%, %, %]', d, e, f;
RAISE NOTICE '[%, %, %]', g, h, i;
determinante := (a*e*i) + (b*f*g) + (c*d*h) - (c*e*g) - (b*d*i) - (a*f*h);
RAISE NOTICE 'Determinante: %', determinante;
END;
$$