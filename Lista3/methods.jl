module methods

    export mbisekcji, mstycznych, msiecznych

    function sign(a)
        if a == 0.0
            return 0
        end
        if a < 0.0
            return -1
        end
        return 1
    end

    function mbisekcji(f, a::Float64, b::Float64, delta::Float64, epsilon::Float64)
        liczba_iteracji = 0
        wartosc_lewa = f(a)
        wartosc_prawa = f(b)
        dlugosc_przedzialu = b-a
        if sign(wartosc_lewa) == sign(wartosc_prawa)
            return (0,0,0,1)
        end

        dlugosc_przedzialu = dlugosc_przedzialu/2
        srodek_przedzialu = a + dlugosc_przedzialu
        wartosc_srodka = f(srodek_przedzialu)
        while abs(dlugosc_przedzialu) >= delta && abs(wartosc_srodka) >= epsilon
            liczba_iteracji = liczba_iteracji + 1

            if sign(wartosc_srodka) == sign(wartosc_lewa)
                a = srodek_przedzialu
                wartosc_lewa = wartosc_srodka
            end

            dlugosc_przedzialu = dlugosc_przedzialu/2
            srodek_przedzialu = a + dlugosc_przedzialu
            wartosc_srodka = f(srodek_przedzialu)
        end
        return (srodek_przedzialu, wartosc_srodka, liczba_iteracji, 0)
    end


    function mstycznych(f, pf, x0::Float64, delta::Float64, epsilon::Float64, maxit::Int)

        wartosc_funkcji_w_punkcie = f(x0)
        if abs(wartosc_funkcji_w_punkcie) < epsilon
            return (x0, wartosc_funkcji_w_punkcie, 0, 0)
        end

        for iteracja in 1:maxit
            wartosc_pochodnej_w_punkcie = pf(x0)
            x1 = x0 - wartosc_funkcji_w_punkcie / wartosc_pochodnej_w_punkcie
            wartosc_funkcji_w_punkcie = f(x1)

            if abs(x1 - x0) < delta || abs(wartosc_funkcji_w_punkcie) < epsilon
                return (x1, wartosc_funkcji_w_punkcie, iteracja, 0)
            end
            if abs(wartosc_pochodnej_w_punkcie) < epsilon
                return (x1, wartosc_funkcji_w_punkcie, iteracja, 2)
            end

            x0 = x1
        end
        return (x0, wartosc_funkcji_w_punkcie, maxit, 1)
    end

    function swap(a, b)
        c = a
        a = b
        b = c
        return a, b
    end

    function msiecznych(f, x0::Float64, x1::Float64, delta::Float64, epsilon::Float64, maxit::Int)
        fx0 = f(x0)
        fx1 = f(x1)
        for it in 1:maxit
            if abs(fx0) > abs(fx1)
                x0, x1 = swap(x0, x1)
                fx0, fx1 = swap(fx0, fx1)
            end
            s = (x1-x0)/(fx1-fx0)
            x1 = x0
            fx1 = fx0
            x0 = x0 - fx0 * s
            fx0 = f(x0)
            if abs(x1-x0) < delta || abs(fx0) < epsilon 
                return (x0, fx0, it, 0)
            end
        end
        return (x0, fx0, maxit, 1)
    end
end