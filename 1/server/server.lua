local serverDomain = "mycm.site"

local modem = peripheral.find("modem") or error("Modem bulunamadi.")
modem.open(80)
print("Sunucu baslatildi... DOMAIN: "..serverDomain)

local function getPage(path)
    if path == "" then path = "index" end
    local filename = "pages/"..path..".txt"
    if fs.exists(filename) then
        local file = fs.open(filename, "r")
        local data = file.readAll()
        file.close()
        return data
    else
        return "404 - Sayfa bulunamadi: "..path
    end
end

while true do
    local _, _, _, replyChannel, message = os.pullEvent("modem_message")
    message = tostring(message or "")

    -- Sadece kendi domainini kontrol et, yanit sadece kendi domaini icin gonder
    if message:lower():find("^"..serverDomain:lower()) then
        local path = message:match("^"..serverDomain.."/(.+)$") or "index"
        local content = getPage(path)
        modem.transmit(replyChannel, 80, tostring(content))
        print("Yanit verildi: "..message.." -> "..path..".txt")
    else
        -- HICBIR YANIT GONDERME
        print("Yoksayildi (gecersiz domain): "..message)
    end
end
