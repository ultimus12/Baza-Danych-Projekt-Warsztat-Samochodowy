# ⚙️ Instrukcja Instalacji i Uruchomienia Projektu

Ten dokument opisuje krok po kroku, jak uruchomić bazę danych "Warsztat" na czystym systemie Windows.

## 📋 Wymagania wstępne

Zanim zaczniesz, upewnij się, że masz zainstalowane:

1.  **PostgreSQL** (serwer bazy danych) - najnowsza wersja.
    * [Pobierz tutaj](https://www.postgresql.org/download/windows/)
    * 🛑 **WAŻNE:** Podczas instalacji zostaniesz poproszony o hasło dla użytkownika `postgres`. Ustaw proste hasło (np. `admin` lub `root`) i **zapamiętaj je**!
2.  **Visual Studio Code** (edytor kodu).
    * [Pobierz tutaj](https://code.visualstudio.com/)
3.  **Git** (do pobrania projektu).
    * [Pobierz tutaj](https://git-scm.com/download/win)

---

## 🚀 Krok 1: Konfiguracja środowiska

1.  Otwórz Visual Studio Code.
2.  Zainstaluj rozszerzenie do obsługi bazy danych:
    * Kliknij ikonę "Klocków" (Extensions) po lewej stronie (`Ctrl+Shift+X`).
    * Wyszukaj **PostgreSQL**.
    * Zainstaluj wtyczkę **Database Client** (autor: Weijan Chen) lub **PostgreSQL** (autor: Chris Kolkman).

## 📥 Krok 2: Pobranie projektu

1.  Otwórz terminal (lub Git Bash) w folderze, w którym chcesz zapisać projekt.
2.  Wpisz komendę:
    ```bash
    git clone [https://github.com/Tharon23/Baza-Danych-Projekt-Warsztat-Samochodowy/tree/main](https://github.com/Tharon23/Baza-Danych-Projekt-Warsztat-Samochodowy/tree/main)
    ```
3.  Otwórz pobrany folder w Visual Studio Code.

## 🗄️ Krok 3: Utworzenie bazy danych

1.  W VS Code kliknij ikonę **Database** na pasku bocznym.
2.  Kliknij `+` (Add Connection) i połącz się z lokalnym serwerem:
    * **Host:** `localhost`
    * **Username:** `postgres`
    * **Password:** (hasło ustalone przy instalacji)
    * **Port:** `5432`
3.  Otwórz nowe zapytanie (Prawy przycisk na połączeniu -> `New Query`) i wpisz:
    ```sql
    CREATE DATABASE warsztat;
    ```
4.  Uruchom zapytanie (przycisk Run ▶️).
5.  Odśwież listę baz danych – powinieneś zobaczyć bazę `warsztat`.

## 🔨 Krok 4: Wgranie struktury (Kluczowy moment!)

Pliki SQL muszą być uruchamiane w ściśle określonej kolejności.

⚠️ **UWAGA:** Przed uruchomieniem każdego pliku upewnij się, że na dolnym pasku VS Code wybrana jest baza **`warsztat`**, a nie `postgres`!

Uruchom pliki jeden po drugim (Prawy przycisk myszy -> **Run Query**):

1.  📄 `01_schema.sql` - Tworzy tabele.
2.  🔗 `02_constraints.sql` - Tworzy relacje (klucze obce).
3.  👁️ `03_views.sql` - Tworzy widoki.
4.  ⚙️ `04_functions_triggers.sql` - Wgrywa funkcje i triggery.
5.  busts_in_silhouette `05_roles.sql` - Konfiguruje role.
6.  🌱 `06_seed_data.sql` - Wgrywa dane testowe.
7.  ⚡ `07_indexes.sql` - Optymalizuje bazę.
8.  archiv `08_advanced_logic.sql` - Dodaje system archiwizacji.
9.  🔒 `09_security.sql` - Nadaje uprawnienia.

## ✅ Krok 5: Weryfikacja

Aby sprawdzić, czy wszystko działa, otwórz nowe zapytanie i uruchom:

```sql
SELECT * FROM widok_ranking_mechanikow;