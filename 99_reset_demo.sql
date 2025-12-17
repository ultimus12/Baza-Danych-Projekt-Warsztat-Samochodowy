-- ==========================================
-- SKRYPT CZYSZCZĄCY PO PREZENTACJI (RESET)
-- ==========================================

-- 1. Przywracamy stan magazynowy
-- (Musimy to zrobić ręcznie, bo usunięcie zlecenia zazwyczaj nie "zwraca" zużytego oleju do beczki)
-- Zakładamy, że przed demo było 50 sztuk.
UPDATE czesci 
SET ilosc_na_stanie = 50 
WHERE id_czesci = 1; -- Upewnij się, że ID 1 to Olej (lub sprawdź nazwę)


-- 2. Usuwamy dane dodane w trakcie demo.
-- Robimy to w odwrotnej kolejności (najpierw szczegóły, potem ogół),
-- żeby nie naruszyć więzów integralności (chyba że masz ON DELETE CASCADE).

-- A. Usuwamy części przypisane do zleceń Passata
DELETE FROM czesci_zlecenia 
WHERE id_zlecenia IN (
    SELECT id_zlecenia FROM zlecenia 
    WHERE id_pojazdu IN (SELECT id_pojazdu FROM pojazdy WHERE nr_rejestracyjny = 'W1 PSTAT')
);

-- B. Usuwamy zlecenia Passata
DELETE FROM zlecenia 
WHERE id_pojazdu IN (SELECT id_pojazdu FROM pojazdy WHERE nr_rejestracyjny = 'W1 PSTAT');

-- C. Usuwamy samochód (Passat)
DELETE FROM pojazdy 
WHERE nr_rejestracyjny = 'W1 PSTAT';

-- D. Usuwamy klienta (Janusz Tracz)
DELETE FROM klienci 
WHERE nazwisko = 'Tracz' AND imie = 'Janusz';


-- 3. Sprawdzenie (Opcjonalne - dla pewności)
SELECT 'CZYSTO!' AS status, count(*) AS liczba_traczow FROM klienci WHERE nazwisko = 'Tracz';