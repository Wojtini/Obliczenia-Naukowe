module methods
    using PyPlot
    export ilorazyRoznicowe, warNewton, naturalna, rysujNnfx

    function ilorazyRoznicowe(x::Vector{Float64}, f::Vector{Float64})
        n = length(x)
        wynik = [v for v in f]
        for i in 2:n
            for j in n:-1:i
                wynik[j] = (wynik[j]-wynik[j-1])/(x[j]-x[j-i+1])
            end
        end
        return wynik
    end

    function warNewton(x::Vector{Float64}, fx::Vector{Float64}, t::Float64)
        n = length(x)
        wynik = fx[n]
        for i in n-1:-1:1
            wynik = wynik * (t - x[i]) + fx[i]
        end
        return wynik
    end

    function naturalna(x::Vector{Float64}, fx::Vector{Float64})
        n = length(x)
        wynik = [v for v in fx]
        for i in n-1:-1:1
            wynik[i] = wynik[i] - wynik[i+1] * x[i]
            for j in i+1:n-1
                wynik[j] = wynik[j] - wynik[j+1] * x[i]
            end
        end
        return wynik
    end

    function rysujNnfx(f, a::Float64, b::Float64, n::Int, filename="default_name")
        liczba_krokow = n + 1
        x = zeros(Float64, liczba_krokow)
        y = zeros(Float64, liczba_krokow)
        d = (b - a) / (n)

        for i in 1:liczba_krokow
            x[i] = a + d * (i - 1)
            y[i] = f(x[i])
        end

        ir = ilorazyRoznicowe(x, y)

        gestosc = 10
        ilosc_punktow = liczba_krokow * gestosc
        d = (b - a) / (ilosc_punktow)

        px = zeros(Float64, ilosc_punktow)
        iy = zeros(Float64, ilosc_punktow)
        dokladne_y = zeros(Float64, ilosc_punktow)

        for p in 1:ilosc_punktow
            px[p] = a + d * (p - 1)
            iy[p] = warNewton(x, ir, px[p])
            dokladne_y[p] = f(px[p])
        end

        clf()
        plot(px, iy, label="interpolacja", linewidth=2.0, alpha=0.5, color="#ff0000")
        plot(px, dokladne_y, label="rzeczywista", linewidth=2.0, alpha=0.5, color="#0000ff")
        grid(true)
        legend(title="Wykres")
        savefig(string("wykresy/wykres", filename, "___", n, ".png"))
    end

end

