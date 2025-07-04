local modem = peripheral.find("modem") or error("Modem bulunamadi.")
modem.open(81)

while true do
    term.clear()
    term.setCursorPos(1, 1)
    print("=== mycm Browser ===")
    io.write("Adres gir (orn: mycm.site): ")
    local address = read()

    modem.transmit(80, 81, tostring(address))
    print("Istek gonderildi...")

    local timeout = os.startTimer(3)
    local gotResponse = false

    while true do
        local event, _, _, _, message = os.pullEvent()
        if event == "modem_message" then
            if type(message) == "string" then
                term.clear()
                term.setCursorPos(1, 1)
                print("=== "..address.." ===")
                print(message)
                gotResponse = true
                break
            else
                -- gelen veri string degilse ignore et
                print("(UYARI: string olmayan veri geldi, yoksayildi)")
            end
        elseif event == "timer" and not gotResponse then
            break
        end
    end

    if not gotResponse then
        term.clear()
        term.setCursorPos(1, 1)
        print("=== "..address.." ===")
        print("404 - Domain gecerli degil")
    end

    print("\nDevam icin tusa bas...")
    os.pullEvent("key")
end
