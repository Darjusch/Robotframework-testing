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

### Login.

0. Voraussetzungen (einmalig prüfen)
   • Fiori Launchpad offen.
   • Kunde: z. B. Silverstar Corp. (17100001) (Value Help nutzen, falls unsicher).
   • Material: z. B. TG11 (notfalls anderes per Value Help auswählen).
   • Org-Daten:
   • Sales Org: Domestic Sales Org US (1710)
   • Distribution Channel: Direct Sales (10)
   • Division: Product Division 00 (00)

⸻

1. Sales Order anlegen (Create Sales Orders) 1. Öffne Create Sales Orders (Fiori-Suche oben: „Create Sales Orders“). 2. Im Einstiegsdialog:
   • Order Type: Standard Order (OR)
   • Sales Organization: 1710
   • Distribution Channel: 10
   • Division: 00
   • Continue klicken. 3. Feld Sold-to Party: Silverstar Corp. (17100001) auswählen (Value Help → wählen).
   • Ship-to wird meist automatisch gezogen. Wenn nicht: per Partner-Funktion setzen. 4. Position hinzufügen:
   • Material: TG11 (oder anderes per Value Help).
   • Order Quantity: 1 (falls Mindestmenge-Warnung → entweder akzeptieren und mit „Save“ speichern oder Menge erhöhen / anderes Material).
   • Plant: wird oft automatisch bestimmt; wenn „Incompletion“ meckert → im Positionsbereich Plant (Werk) wählen. 5. Create/Save klicken. 6. Oben erscheint eine Meldung: „Standard Order XXXXX was created“ (ggf. „with incompletion“).
   → Vermerke die Sales-Order-Nummer (brauchen wir gleich).

Typische Warnungen (ok zu ignorieren):
– Minimum quantity … not reached → Menge erhöhen oder ignorieren.
– Document is incomplete → meist trotzdem speicherbar; fehlendes Feld per Incompletion-Log nachpflegen (z. B. Plant).

⸻

2. Outbound Delivery anlegen (mit Order-Referenz) 1. Öffne Create Outbound Deliveries – With Order Reference. (Suche: „Create Outbound Deliveries“) 2. Felder füllen:
   • Shipping Point: per Value Help auswählen (nimm einen zu 1710 passenden; irgendein angebotener Shipping Point ist ok).
   • Sales Order: deine eben erzeugte Sales-Order-Nummer eintragen → Enter. 3. Unten die Position(en) auswählen (Haken). 4. Create Delivery klicken. 5. Oben steht eine Meldung mit der Delivery-Nummer (z. B. 8000…).
   → Nummer notieren.

Wenn keine Lieferung möglich:
– Prüfe in der Sales Order die Schedule Lines (Terminlinie), ob bestätigte Menge/Plant da ist.
– Fehlende Daten (z. B. Plant) in der Order-Position nachtragen und erneut Lieferung anlegen.

⸻

3. Post Goods Issue (Warenausgang buchen) 1. Öffne Post Goods Issue for Outbound Delivery. 2. Delivery Number: deine Lieferungsnummer eintragen → Enter. 3. Kurz prüfen (Position/Qty). 4. Post Goods Issue (oder Post) klicken. 5. Meldung abwarten: Material-Beleg/Dokumentnummer wird angezeigt.
   → optional notieren.

⸻

4. Billing Document (Rechnung) erstellen 1. Öffne Create Billing Documents (manchmal „Billing Due List“). 2. Filter setzen, z. B.:
   • Delivery: deine Lieferungsnummer oder
   • Sales Order: deine Auftragsnummer oder
   • Customer: 17100001 3. Go / Apply. 4. In der Ergebnisliste die fällige Position anhaken. 5. Create Billing Document klicken. 6. Meldung mit Billing Document Number (z. B. 9000…) erscheint.
   → Nummer notieren.

In Standard-Szenarien wird die Rechnung direkt in FI gebucht (kein zusätzlicher Schritt nötig).

⸻

5. FI-Beleg anzeigen (Accounting Document)

Du hast mehrere Wege:

A) Aus der Rechnung heraus 1. Öffne Manage Billing Documents oder Display Billing Document. 2. Suche deine Billing-Dokumentnummer. 3. In den Dokumentdetails gibt es i. d. R. einen Link/Button: „Display Accounting Document“ / „Journal Entry“. 4. Anklicken → der zugehörige FI-Beleg öffnet sich.

B) Über Journal Entries 1. Öffne Manage Journal Entries oder Display Journal Entry. 2. Filter nach Reference/Document/Posting Date und/oder Customer. 3. Go → Eintrag öffnen → Line Items / Header prüfen.

C) Dokumentfluss 1. Öffne Manage Sales Orders. 2. Suche deine Sales Order → Open. 3. Document Flow öffnen.
→ Hier siehst du die Kette: Sales Order → Delivery → Goods Issue → Billing → Accounting Document.
→ Auf den Accounting-Dokument-Link klicken.

⸻

Troubleshooting & Tipps
• Incompletion verhindert Lieferung/Rechnung: In der Order „Incompletion Log“ öffnen und fehlende Pflichtfelder (meist Plant/Shipping/Incoterms) nachpflegen.
• Mindestmengen/Gratisgüter-Warnungen: Menge erhöhen oder anderes Material per Value Help wählen (Filter nach „Material Type = Finished Goods“ hilft oft).
• Shipping Point unbekannt: Value Help öffnen und einen beliebigen angebotenen Punkt wählen, der zu 1710 passt (Demo ist tolerant).
• Keine Billing-Due-Liste: Prüfe, ob PGI wirklich gebucht ist (ohne PGI kein Billing).
• FI-Beleg fehlt: In manchen Demos wird die Rechnung sofort gebucht, in anderen braucht es ggf. „Post“ – im Billing-Dokument prüfen, ob Status „Posted to Accounting“ steht; sonst entsprechenden Button nutzen.
