# Test Cases

| #   | Test Case Description       | Steps                                                                                                                                          | Expected Result                                                        |
| --- | --------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| 1   | **Initial Orders Load**     | 1. Wait for - Title, Searchbar, Filter, Sorting, Orderlist - to appear.                                                                        | The order list populates with mock data; UI shows order entries        |
| 2   | **Search by Customer Name** | 1. Type part of a customer name (e.g. "Alfreds") into the search field                                                                         | Only orders matching "Alfreds" are displayed                           |
| 3   | **Verify Status Color**     | 1. Open the order list<br>2. Check the color coding of the "Status" field (e.g., "Delivered" = green, "Processing" = orange, "Canceled" = red) | Each status has correct predefined color coding applied                |
| 4   | **Order Detail Display**    | 1. Click on a specific order row<br>2. Check the detail view or information pane                                                               | Correct order details (e.g., customer, status, shipped date) displayed |
| 5   | **Sorting by Order Date**   | 1. Click on the "Order Customer" column header<br>2. Check the displayed order sequence                                                        | Orders sorted by Customer name ascending;                              |
| 6   | **Order List**              | 1.Verify if the Orders have the correct fields.                                                                                                | OrderID, FN - LN, ShippedDate, OrderDate, Status                       |

## SAP - Trial END2END

🔹 Flow 1: Procure-to-Pay Mini (MM → FI/AP)

Ziel: Von der Bestellung bis zur Rechnung ein End-to-End-Szenario durchspielen.

Schritte: 1. Supplier prüfen oder anlegen
• Im Trial sind oft schon Demo-Lieferanten (Business Partner mit Supplier-Rolle) vorhanden.
• Am einfachsten: einen vorhandenen Supplier in der App Manage Business Partner suchen (z. B. über „Role = Supplier“).
• Falls keiner verfügbar ist, müsstest du einen neuen Business Partner mit der Rolle Supplier anlegen. → im Trial klappt das manchmal, manchmal ist die Neuanlage gesperrt. 2. Bestellung anlegen (Purchase Order)
• App: Manage Purchase Orders oder Create Purchase Order.
• Daten: Supplier, Material, Werk, Menge.
• Ergebnis: PO-Nummer. 3. Wareneingang buchen (Goods Receipt)
• App: Post Goods Receipt for Purchasing Document.
• Referenz: die PO-Nummer.
• Ergebnis: Materialbestand erhöht, Belegnummer für WE. 4. Kreditorenrechnung erfassen (Supplier Invoice)
• App: Create Supplier Invoice.
• Daten: Supplier, Betrag, Währung, PO-Referenz.
• Ergebnis: FI-Beleg erzeugt (Debitor/Kreditor-Buchung).

➡️ Ende des Flows: Bestellung → WE → Rechnung → FI-Beleg.
Das bildet den klassischen P2P-Kernprozess ab.

⸻

🔹 Flow 2: FI/CO Kostenbuchung

Ziel: Einfache Kostenbuchung anlegen, die in CO ausgewertet werden kann.

Schritte: 1. Kostenstelle anlegen
• App: Manage Cost Centers.
• Neues Cost Center z. B. „CC_TEST_001“ in Controlling Area „A000“, Company Code „1010“.
• Ergebnis: Neue Kostenstelle ist angelegt. 2. Journal Entry buchen
• App: Post General Journal Entries.
• Kopf: Company Code, Währung.
• Position 1 (Soll): Aufwandskonto (z. B. 600000), Betrag, Kostenstelle.
• Position 2 (Haben): z. B. Bank-/Clearing-Konto.
• Ergebnis: FI-Beleg mit Kostenstellenzuordnung. 3. CO-Report prüfen
• App: Cost Centers – Actuals oder ähnlicher Report.
• Filter auf die neue Kostenstelle setzen.
• Ergebnis: Das gebuchte Journal Entry taucht in der Kostenstellen-Auswertung auf.

➡️ Ende des Flows: Man sieht, wie eine FI-Buchung in CO durchschlägt.

⸻

🔹 Flow 3: BP Customer Smoke

Ziel: Einfachen Kunden-Business Partner anlegen und prüfen, ob er gefunden wird.

Schritte: 1. Neuen Business Partner anlegen
• App: Manage Business Partner.
• Eingaben: ID „CUST_TEST_001“, Name „Testkunde RF“.
• Rolle: Customer hinzufügen.
• Ergebnis: Neuer BP mit Kundenrolle. 2. Suche/Filterung
• In derselben App nach „Testkunde RF“ oder der BP-ID suchen.
• Ergebnis: Treffer erscheint in der Tabelle.

➡️ Ende des Flows: Kunden-BP erfolgreich angelegt und auffindbar.
