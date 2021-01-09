script_name("AutoBuy")
script_author("HarlyCloud")
script_version("1.1.0")
script_description("9.1.2021")

require "lib.moonloader"
local dlstatus      = require ('moonloader').download_status
local as_action = require('moonloader').audiostream_state
mc = "{009D00}"
sc = "{00C235}"
wc = "{FFFFFF}"
ec = "{BE3D3D}"
lc = "{ACFF00}"
yc = "{E0BF23}"
mcx = 0x009D00
local path = getWorkingDirectory() .. "\\HarlyCloud Script\\AutoBuy"
if not doesDirectoryExist(path) then
	createDirectory(path)
end
local tag =  "•  {fcc603}[{fcc603}Auto Buy]{ffffff}: "
local imgui = require "imgui"
local encoding = require 'encoding'
local inicfg = require 'inicfg'
local sampev = require 'samp.events'
local bFa, fa       = pcall(require, 'fAwesome5')
local dlstatus      = require ('moonloader').download_status
encoding.default = 'CP1251'
local u8 = encoding.UTF8
local ErrorMessage = true
local path_ini = '..\\HarlyCloud Script\\AutoBuy\\AutoBuy.ini'
local mainIni = inicfg.load({
    main = {
        typebuy = 1,
        clogshow = false,
        autoarenda = false
    },
    ruletki = {
        bronzrulet = false,
        bronzruletcol = " ",
        bronzruletsum = " ",
        serrulet = false,
        serruletcol = " ",
        serruletsum = " ",
        goldrulet = false,
        goldruletcol = " ",
        goldruletsum = " ",
        platrulet = false,
        platruletcol = " ",
        platruletsum = " "
    },
    other = {
        famtalon = false,
        famtaloncol = " ",
        famtalonsum = " ",
        podarok = false,
        podarokcol = " ",
        podaroksum = " ",
        grajdantalon = false,
        grajdantaloncol = " ",
        grajdantalonsum = " ",
        skidochnik = false,
        skidochnikcol = " ",
        skidochniksum = " ",
        travka = false,
        travkacol = " ",
        travkasum = " ",
        tochkam = false,
        tochkamcol = " ",
        tochkamsum = " ",
        zlovmoneta = false,
        zlovmonetacol = " ",
        zlovmonetasum = " ",
        cherep = false,
        cherepcol = " ",
        cherepsum = " ",
        euro = false,
        eurocol = " ",
        eurosum = " ",
        kamen = false,
        kamencol = " ",
        kamensum = " ",
        metall = false,
        metallcol = " ",
        metallsum = " ",
        bronz = false,
        bronzcol = " ",
        bronzsum = " ",
        serebro = false,
        serebrocol = " ",
        serebrosum = " ",
        gold = false,
        goldcol = " ",
        goldsum = " ",
        len = false,
        lencol = " ",
        lensum = " ",
        hlopok = false,
        hlopokcol = " ",
        hlopoksum = " ",
        kras = false,
        krascol = " ",
        krassum = " "
    },
    procent = {
        bronzruletpr = " ",
        serruletpr =  " ",
        goldruletpr = " ",
        platruletpr = " ",
        famtalonpr = " ",
        podarokpr = " ",
        grajdantalonpr = " ",
        skidochnikpr = " ",
        travkapr = " ",
        tochkampr = " ",
        zlovmonetapr = " ",
        chereppr = " ",
        europr = " ",
        kamenpr = " ",
        metallpr = " ",
        serebropr = " ",
        bronzpr = " ",
        goldpr = " ",
        lenpr = " ",
        hlopokpr = " ",
        kraspr = " "
    }
},path_ini)

function saveIniFile()
    local inicfgsaveparam = inicfg.save(mainIni,path_ini)
end
saveIniFile()

local fa_font, fs16, fs20, fs80, infoFs = nil, nil, nil, nil, nil
local fa_glyph_ranges = imgui.ImGlyphRanges({ fa.min_range, fa.max_range })
function imgui.BeforeDrawFrame()
    if fa_font == nil then
        if not doesFileExist('moonloader/HarlyCloud Script/fa-solid-900.ttf') then 
            sampAddChatMessage(tag..'Îòñóòñâóåò ôàéë øðèôòà '..lc..'fa-solid-900.ttf'..wc..' â ïàïêå '..lc..'moonloader/HarlyCloud Script/', mcx)
            sampAddChatMessage(tag..'Çàïóñê áåç íåãî íå âîçìîæåí. Ïåðåóñòàíîâèòå ñêðèïò èëè îáðàòèòåñü ê ðàçðàáîò÷èêó. Ñêðèïò îòêëþ÷¸í..', mcx)
            thisScript():unload()
            return 
        end
        local font_config = imgui.ImFontConfig()
        font_config.MergeMode = true
        fa_font = imgui.GetIO().Fonts:AddFontFromFileTTF('moonloader/HarlyCloud Script/fa-solid-900.ttf', 13.0, font_config, fa_glyph_ranges)
    end
    if fs16 == nil then fs16 = imgui.GetIO().Fonts:AddFontFromFileTTF(getFolderPath(0x14) .. '\\trebucbd.ttf', 16.0, nil, imgui.GetIO().Fonts:GetGlyphRangesCyrillic()) end
    if fs20 == nil then fs20 = imgui.GetIO().Fonts:AddFontFromFileTTF(getFolderPath(0x14) .. '\\trebucbd.ttf', 20.0, nil, imgui.GetIO().Fonts:GetGlyphRangesCyrillic()) end
    if fs80 == nil then fs80 = imgui.GetIO().Fonts:AddFontFromFileTTF(getFolderPath(0x14) .. '\\trebucbd.ttf', 80.0, nil, imgui.GetIO().Fonts:GetGlyphRangesCyrillic()) end
    if infoFs == nil then infoFs = imgui.GetIO().Fonts:AddFontFromFileTTF(getFolderPath(0x14) .. '\\trebucbd.ttf', 35.0, nil, imgui.GetIO().Fonts:GetGlyphRangesCyrillic()) end
end


servak = {"185.169.134.3:7777", "185.169.134.4:7777", "185.169.134.43:7777", "185.169.134.44:7777", "185.169.134.45:7777", "185.169.134.5:7777", "185.169.134.59:7777", "185.169.134.61:7777", "185.169.134.107:7777", "185.169.134.109:7777", "185.169.134.166:7777", "185.169.134.171:7777", "185.169.134.172:7777", "185.169.134.173:7777", "185.169.134.174:7777"}
local vkladki = {
    true,
    false
}

devLink = {
    ['VK'] = 'vk.com/harlyfun',
    ['DS'] = 'HarlyCloud#1734',
    ['TG'] = 't.me/HarlyCloud',
}
local proc = 0
local changelog = {}

local main_window_state = imgui.ImBool(false)
local bronzrulet       = imgui.ImBool(mainIni.ruletki.bronzrulet)
local bronzruletcol    = imgui.ImBuffer(u8(mainIni.ruletki.bronzruletcol), 10)
local bronzruletsum    = imgui.ImBuffer(u8(mainIni.ruletki.bronzruletsum), 10)
local bronzruletpr     = imgui.ImBuffer(u8(mainIni.procent.bronzruletpr), 10)
local serrulet         = imgui.ImBool(mainIni.ruletki.serrulet)
local serruletcol      = imgui.ImBuffer(u8(mainIni.ruletki.serruletcol), 10)
local serruletsum      = imgui.ImBuffer(u8(mainIni.ruletki.serruletsum), 10)
local serruletpr     = imgui.ImBuffer(u8(mainIni.procent.serruletpr), 10)
local goldrulet        = imgui.ImBool(mainIni.ruletki.goldrulet)
local goldruletcol     = imgui.ImBuffer(u8(mainIni.ruletki.goldruletcol), 10)
local goldruletsum     = imgui.ImBuffer(u8(mainIni.ruletki.goldruletsum), 10)
local goldruletpr     = imgui.ImBuffer(u8(mainIni.procent.goldruletpr), 10)
local platrulet        = imgui.ImBool(mainIni.ruletki.platrulet)
local platruletcol     = imgui.ImBuffer(u8(mainIni.ruletki.platruletcol), 10)
local platruletsum     = imgui.ImBuffer(u8(mainIni.ruletki.platruletsum), 10)
local platruletpr     = imgui.ImBuffer(u8(mainIni.procent.platruletpr), 10)
local famtalon         = imgui.ImBool(mainIni.other.famtalon)
local famtaloncol      = imgui.ImBuffer(u8(mainIni.other.famtaloncol), 10)
local famtalonsum      = imgui.ImBuffer(u8(mainIni.other.famtalonsum), 10)
local famtalonpr     = imgui.ImBuffer(u8(mainIni.procent.famtalonpr), 10)
local podarok          = imgui.ImBool(mainIni.other.podarok)
local podarokcol       = imgui.ImBuffer(u8(mainIni.other.podarokcol), 10)
local podaroksum       = imgui.ImBuffer(u8(mainIni.other.podaroksum), 10)
local podarokpr     = imgui.ImBuffer(u8(mainIni.procent.podarokpr), 10)
local grajdantalon     = imgui.ImBool(mainIni.other.grajdantalon)
local grajdantaloncol  = imgui.ImBuffer(u8(mainIni.other.grajdantaloncol), 10)
local grajdantalonsum  = imgui.ImBuffer(u8(mainIni.other.grajdantalonsum), 10)
local grajdantalonpr     = imgui.ImBuffer(u8(mainIni.procent.grajdantalonpr), 10)
local skidochnik       = imgui.ImBool(mainIni.other.skidochnik)
local skidochnikcol    = imgui.ImBuffer(u8(mainIni.other.skidochnikcol), 10)
local skidochniksum    = imgui.ImBuffer(u8(mainIni.other.skidochniksum), 10)
local skidochnikpr     = imgui.ImBuffer(u8(mainIni.procent.skidochnikpr), 10)
local travka          = imgui.ImBool(mainIni.other.travka)
local travkacol       = imgui.ImBuffer(u8(mainIni.other.travkacol), 10)
local travkasum       = imgui.ImBuffer(u8(mainIni.other.travkasum), 10)
local travkapr     = imgui.ImBuffer(u8(mainIni.procent.travkapr), 10)
local tochkam          = imgui.ImBool(mainIni.other.tochkam)
local tochkamcol       = imgui.ImBuffer(u8(mainIni.other.tochkamcol), 10)
local tochkamsum       = imgui.ImBuffer(u8(mainIni.other.tochkamsum), 10)
local tochkampr     = imgui.ImBuffer(u8(mainIni.procent.tochkampr), 10)
local zlovmoneta          = imgui.ImBool(mainIni.other.zlovmoneta)
local zlovmonetacol       = imgui.ImBuffer(u8(mainIni.other.zlovmonetacol), 10)
local zlovmonetasum       = imgui.ImBuffer(u8(mainIni.other.zlovmonetasum), 10)
local zlovmonetapr     = imgui.ImBuffer(u8(mainIni.procent.zlovmonetapr), 10)
local cherep          = imgui.ImBool(mainIni.other.cherep)
local cherepcol       = imgui.ImBuffer(u8(mainIni.other.cherepcol), 10)
local cherepsum       = imgui.ImBuffer(u8(mainIni.other.cherepsum), 10)
local chereppr     = imgui.ImBuffer(u8(mainIni.procent.chereppr), 10)
local euro          = imgui.ImBool(mainIni.other.euro)
local eurocol       = imgui.ImBuffer(u8(mainIni.other.eurocol), 10)
local eurosum       = imgui.ImBuffer(u8(mainIni.other.eurosum), 10)
local europr     = imgui.ImBuffer(u8(mainIni.procent.europr), 10)
----------------------------------------------------------------------------------------------------------
local kamen         = imgui.ImBool(mainIni.other.kamen)
local kamencol       = imgui.ImBuffer(u8(mainIni.other.kamencol), 10)
local kamensum       = imgui.ImBuffer(u8(mainIni.other.kamensum), 10)
local kamenpr       = imgui.ImBuffer(u8(mainIni.procent.kamenpr), 10)
local metall          = imgui.ImBool(mainIni.other.metall)
local metallcol       = imgui.ImBuffer(u8(mainIni.other.metallcol), 10)
local metallsum       = imgui.ImBuffer(u8(mainIni.other.metallsum), 10)
local metallpr       = imgui.ImBuffer(u8(mainIni.procent.metallpr), 10)
local bronz         = imgui.ImBool(mainIni.other.bronz)
local bronzcol       = imgui.ImBuffer(u8(mainIni.other.bronzcol), 10)
local bronzsum       = imgui.ImBuffer(u8(mainIni.other.bronzsum), 10)
local bronzpr       = imgui.ImBuffer(u8(mainIni.procent.bronzpr), 10)
local serebro          = imgui.ImBool(mainIni.other.serebro)
local serebrocol       = imgui.ImBuffer(u8(mainIni.other.serebrocol), 10)
local serebrosum       = imgui.ImBuffer(u8(mainIni.other.serebrosum), 10)
local serebropr       = imgui.ImBuffer(u8(mainIni.procent.serebropr), 10)
local gold          = imgui.ImBool(mainIni.other.gold)
local goldcol       = imgui.ImBuffer(u8(mainIni.other.goldcol), 10)
local goldsum       = imgui.ImBuffer(u8(mainIni.other.goldsum), 10)
local goldpr       = imgui.ImBuffer(u8(mainIni.procent.goldpr), 10)
local len          = imgui.ImBool(mainIni.other.len)
local lencol       = imgui.ImBuffer(u8(mainIni.other.lencol), 10)
local lensum       = imgui.ImBuffer(u8(mainIni.other.lensum), 10)
local lenpr       = imgui.ImBuffer(u8(mainIni.procent.lenpr), 10)
local hlopok          = imgui.ImBool(mainIni.other.hlopok)
local hlopokcol       = imgui.ImBuffer(u8(mainIni.other.hlopokcol), 10)
local hlopoksum       = imgui.ImBuffer(u8(mainIni.other.hlopoksum), 10)
local hlopokpr       = imgui.ImBuffer(u8(mainIni.procent.hlopokpr), 10)
local kras          = imgui.ImBool(mainIni.other.kras)
local krascol       = imgui.ImBuffer(u8(mainIni.other.krascol), 10)
local krassum       = imgui.ImBuffer(u8(mainIni.other.krassum), 10)
local kraspr       = imgui.ImBuffer(u8(mainIni.procent.kraspr), 10)
local typebuy       = imgui.ImInt(mainIni.main.typebuy)
local autoarenda       = imgui.ImBool(mainIni.main.autoarenda)
local changeLogWindow = imgui.ImBool(mainIni.main.clogshow)



function main()
    while not isSampAvailable() do wait(0) end
	if not sampIsLocalPlayerSpawned() then
	  return false
	end
	wait(2000)
	servip, servport = sampGetCurrentServerAddress()
	sexip = ""..servip..":"..servport
	for i, val in ipairs(servak) do
		if val == sexip then
			server = i
		end
	end
    if server then
        autoupdatet("https://raw.githubusercontent.com/HarlyCloud/AutoBuy/main/version.json", '[ ]: ', " ")
		SCM("Óñïåøíî çàïóñòèëñÿ! Äîáðî ïîæàëîâàòü íà Arizona Role Play")
        SCM("Àêòèâàöèÿ ìåíþ ñêðèïòà /autobuy")
        sampRegisterChatCommand("autobuy",function() 
        main_window_state.v = not main_window_state.v
        end)
	else
        SCM("Íà äàííîì ñåðâåðà ñêðèïò íå ðàáîòàåò")
        SCM("Ñêðèïò äîñòóïåí òîëüêî íà ñåðâåðàõ Arizona Role Play")
        thisScript():unload()
	end
    while true do
        wait(0)
        imgui.Process = main_window_state.v or changeLogWindow.v
    end
end

function SCM(arg) -- Ñîêðàùåíèå êîìàíäû sampAddChatMessage
    sampAddChatMessage(" •  {fcc603}[{fcc603}Auto Buy]{ffffff}: " .. arg,-1)
end

function imgui.OnDrawFrame()
    local sw, sh = getScreenResolution()
    if main_window_state.v then
        imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		imgui.SetNextWindowSize(imgui.ImVec2(1000,500), imgui.Cond.FirstUseEver)
		imgui.PushStyleVar(imgui.StyleVar.WindowPadding, imgui.ImVec2(0,0))
        imgui.Begin('##AutoBuy',main_window_state,imgui.WindowFlags.NoResize + imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoScrollbar + imgui.WindowFlags.NoTitleBar)
        imgui.CreatePaddingX(20)
        main_button()
        imgui.SetCursorPos(imgui.ImVec2(970,25))
        imgui.CloseButton(5.5,main_window_state)
        imgui.SetCursorPos(imgui.ImVec2(0,61))
        imgui.BeginGroup()
        if vkladki[1] then
            imgui.CreatePaddingX(10)
            vkladkaone()
        end
        if vkladki[2] then 
            imgui.CreatePaddingX(10)
            beginchild1()
            imgui.SameLine()
            beginchild2()
        end
        imgui.EndGroup()
		imgui.End()
        imgui.PopStyleVar(1)
    end
    if changeLogWindow.v then 
        imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
        imgui.SetNextWindowSize(imgui.ImVec2(sw / 1.5, sh / 1.5), imgui.Cond.FirstUseEver)

        imgui.Begin('##ChangeLogWindow', changeLogWindow, imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoResize + imgui.WindowFlags.NoScrollbar + imgui.WindowFlags.NoTitleBar + imgui.WindowFlags.ShowBorders)
            imgui.PushFont(infoFs)
            imgui.CenterTextColoredRGB(lc..'Ñïèñîê èçìåíåíèé')
            imgui.PopFont()
            if daysAfterUpdate() <= 3 then 
                imgui.SameLine()
                imgui.MiniLable('New!', imgui.ImVec4(1, 0.3, 0.3, 1), 5, 6)
            end
            imgui.CenterTextColoredRGB('{606060}Âåðñèÿ: {868686}'..thisScript().version..'{606060} | Ïîñëåäíåå îáíîâëåíèå âûøëî {868686}'..updateDate())
            imgui.PushStyleColor(imgui.Col.ChildWindowBg, imgui.ImVec4(0.07, 0.07, 0.07, 1.00))
            imgui.BeginChild('##ChangeLog', imgui.ImVec2(-1, imgui.GetWindowHeight() - 150), true)
                for count = 0, #changelog do
                    local count = #changelog - count
                    local ver = changelog[count]['ver']
                    local date = changelog[count]['date']
                    local info = changelog[count]['info']
                    local patches = changelog[count]['patches']['info']

                    imgui.PushFont(fs20)
                    imgui.TextColoredRGB(sc..ver)
                    imgui.PopFont()
                    imgui.SameLine()
                    local isBeta = isVersionBeta(ver)
                    imgui.MiniLable(isBeta and 'Beta' or u8('Îò '..date), isBeta and imgui.ImVec4(1, 1, 0, 1) or imgui.ImVec4(0, 1, 0, 1), 10, 10)

                    imgui.PushTextWrapPos(imgui.GetWindowWidth() - 30)
                    for k, v in ipairs(info) do
                        imgui.TextColoredRGB('{606060}'..k..') {SSSSSS}'..v) 
                    end
                    if #info <= 0 then imgui.TextColoredRGB('{505050}(Äàííàÿ âåðñèÿ íå èìååò èçìåíåíèé)') end

                    if #patches > 0 then
                        imgui.TextColoredRGB(sc..'>> Ñïèñîê ïàò÷åé ('..#patches..')')
                        imgui.Hint(u8('Êëèêíèòå, ÷òî áû '..(changelog[count]['patches']['show'] and 'ñâåðíóòü' or 'ðàçâåðíóòü')))
                        if imgui.IsItemClicked() then 
                            changelog[count]['patches']['show'] = not changelog[count]['patches']['show']
                        end
                        if changelog[count]['patches']['show'] then
                            local p1 = imgui.GetCursorScreenPos()
                            for _, info in ipairs(patches) do
                                imgui.SetCursorPosX(40)
                                imgui.TextColoredRGB('{909090}'..info)
                            end
                            local p2 = imgui.GetCursorScreenPos()
                            imgui.GetWindowDrawList():AddLine(imgui.ImVec2(p1.x + 20.5, p1.y + 2), imgui.ImVec2(p2.x + 20, p2.y - 2), 0xFF00C235, 2)
                        end
                    end
                    imgui.PopTextWrapPos()

                    imgui.NewLine()
                end
            imgui.EndChild()
            imgui.SetCursorPosX((imgui.GetWindowWidth() - 300) / 2)
            
            imgui.PushStyleColor(imgui.Col.Border, imgui.ImVec4(0, 1, 0, 1))
            imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(imgui.GetStyle().Colors[imgui.Col.WindowBg]))
            if imgui.Button(u8'Çàêðûòü îêíî', imgui.ImVec2(300, 30)) then 
                mainIni.main.clogshow = false
                saveIniFile()
                changeLogWindow.v = false 
            end
            imgui.PopStyleColor(3)
        imgui.End()
    end
end
function vkladkaone()
    imgui.BeginGroup()
    imgui.BeginChild('##vkladkaone', imgui.ImVec2(980, 300), true)
    imgui.CreatePaddingY(10)
    imgui.CreatePaddingX(10)
    if imgui.Checkbox(u8"Àâòî àðåíäà ëàâêè", autoarenda) then
        mainIni.main.autoarenda = autoarenda.v
        saveIniFile()
    end
    imgui.Hint(u8"Êîãäà âû ïîäõîäèòå ê ëàâêè è íàæèìàåòå ALT â ïîÿâèâùåìñÿ äèàëîãå àâòîìàòè÷åñêè ïîäòâåðæäàåòñÿ àðåíäà.")
    imgui.EndChild()
        imgui.CenterTextColoredRGB('{404040}v'..thisScript().version.. " stable")
        imgui.SetCursorPosX((imgui.GetWindowWidth() - 300) / 2)
        if imgui.ButtonHex(u8'Èíôîðìàöèÿ îá îáíîâëåíèÿõ', 0x209020, imgui.ImVec2(300, 20)) then 
            changeLogWindow.v = true
        end
        imgui.CenterTextColoredRGB('{606060}Ññûëêè íà ðàçðàáîò÷èêà:')
        imgui.SetCursorPosX((imgui.GetWindowWidth() - 415) / 2)
        imgui.ButtonVK(devLink['VK'])
        imgui.SameLine()
        imgui.ButtonDiscord(devLink['DS'])
        imgui.SameLine()
        imgui.ButtonTelegram(devLink['TG'])
        imgui.SameLine()
        imgui.ButtonBlastHK('blast.hk/members/304154/')
    imgui.EndGroup()
end
function beginchild2()
    imgui.BeginGroup()
    imgui.BeginChild('##beginchild2', imgui.ImVec2(480, 340), true)
    imgui.CreatePaddingY(10)
    imgui.CreatePaddingX(10)
    if imgui.Checkbox(u8"Êàìåíü",kamen) then
        mainIni.other.kamen = kamen.v
        saveIniFile()
    end
    if kamen.v then
        imgui.SameLine()
        if typebuy.v == 1 then
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##kamencol", kamencol) then
            mainIni.other.kamencol = tostring(u8:decode(kamencol.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Êîë.")
        else
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##kamenpr", kamenpr) then
            mainIni.procent.kamenpr = tostring(u8:decode(kamenpr.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Ïðîö.")
        end
        imgui.SameLine()
        imgui.PushItemWidth(65)
        if imgui.InputText(u8"##kamensum", kamensum) then
        mainIni.other.kamensum = tostring(u8:decode(kamensum.v))
        saveIniFile()
        end
        imgui.SameLine()
        imgui.TextDisabled(u8"Öåíà çà øò")
    end
    imgui.CreatePaddingX(10)
    if imgui.Checkbox(u8"Ìåòàëë",metall) then
        mainIni.other.metall = metall.v
        saveIniFile()
    end
    if metall.v then
        imgui.SameLine()
        if typebuy.v == 1 then
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##metallcol", metallcol) then
            mainIni.other.metallcol = tostring(u8:decode(metallcol.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Êîë.")
        else
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##metallpr", metallpr) then
            mainIni.procent.metallpr = tostring(u8:decode(metallpr.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Ïðîö.")
        end
        imgui.SameLine()
        imgui.PushItemWidth(65)
        if imgui.InputText(u8"##metallsum", metallsum) then
        mainIni.other.metallsum = tostring(u8:decode(metallsum.v))
        saveIniFile()
        end
        imgui.SameLine()
        imgui.TextDisabled(u8"Öåíà çà øò")
    end
    imgui.CreatePaddingX(10)
    if imgui.Checkbox(u8"Áðîíçà",bronz) then
        mainIni.other.bronz = bronz.v
        saveIniFile()
    end
    if bronz.v then
        imgui.SameLine()
        if typebuy.v == 1 then
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##bronzcol", bronzcol) then
            mainIni.other.bronzcol = tostring(u8:decode(bronzcol.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Êîë.")
        else
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##bronzpr", bronzpr) then
            mainIni.procent.bronzpr = tostring(u8:decode(bronzpr.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Ïðîö.")
        end
        imgui.SameLine()
        imgui.PushItemWidth(65)
        if imgui.InputText(u8"##bronzsum", bronzsum) then
        mainIni.other.bronzsum = tostring(u8:decode(bronzsum.v))
        saveIniFile()
        end
        imgui.SameLine()
        imgui.TextDisabled(u8"Öåíà çà øò")
    end
    imgui.CreatePaddingX(10)
    if imgui.Checkbox(u8"Ñåðåáðî",serebro) then
        mainIni.other.serebro = serebro.v
        saveIniFile()
    end
    if serebro.v then
        imgui.SameLine()
        if typebuy.v == 1 then
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##serebrocol", serebrocol) then
            mainIni.other.serebrocol = tostring(u8:decode(serebrocol.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Êîë.")
        else
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##serebropr", serebropr) then
            mainIni.procent.serebropr = tostring(u8:decode(serebropr.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Ïðîö.")
        end
        imgui.SameLine()
        imgui.PushItemWidth(65)
        if imgui.InputText(u8"##serebrosum", serebrosum) then
        mainIni.other.serebrosum = tostring(u8:decode(serebrosum.v))
        saveIniFile()
        end
        imgui.SameLine()
        imgui.TextDisabled(u8"Öåíà çà øò")
    end
    imgui.CreatePaddingX(10)
    if imgui.Checkbox(u8"Çîëîòî",gold) then
        mainIni.other.gold = gold.v
        saveIniFile()
    end
    if gold.v then
        imgui.SameLine()
        if typebuy.v == 1 then
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##goldcol", goldcol) then
            mainIni.other.goldcol = tostring(u8:decode(goldcol.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Êîë.")
        else
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##goldpr", goldpr) then
            mainIni.procent.goldpr = tostring(u8:decode(goldpr.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Ïðîö.")
        end
        imgui.SameLine()
        imgui.PushItemWidth(65)
        if imgui.InputText(u8"##goldsum", goldsum) then
        mainIni.other.goldsum = tostring(u8:decode(goldsum.v))
        saveIniFile()
        end
        imgui.SameLine()
        imgui.TextDisabled(u8"Öåíà çà øò")
    end
    imgui.CreatePaddingX(10)
    if imgui.Checkbox(u8"Ë¸í",len) then
        mainIni.other.len = len.v
        saveIniFile()
    end
    if len.v then
        imgui.SameLine()
        if typebuy.v == 1 then
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##lencol", lencol) then
            mainIni.other.lencol = tostring(u8:decode(lencol.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Êîë.")
        else
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##lenpr", lenpr) then
            mainIni.procent.lenpr = tostring(u8:decode(lenpr.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Ïðîö.")
        end
        imgui.SameLine()
        imgui.PushItemWidth(65)
        if imgui.InputText(u8"##lensum", lensum) then
        mainIni.other.lensum = tostring(u8:decode(lensum.v))
        saveIniFile()
        end
        imgui.SameLine()
        imgui.TextDisabled(u8"Öåíà çà øò")
    end
    imgui.CreatePaddingX(10)
    if imgui.Checkbox(u8"Õëîïîê",hlopok) then
        mainIni.other.hlopok = hlopok.v
        saveIniFile()
    end
    if hlopok.v then
        imgui.SameLine()
        if typebuy.v == 1 then
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##hlopokcol", hlopokcol) then
            mainIni.other.hlopokcol = tostring(u8:decode(hlopokcol.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Êîë.")
        else
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##hlopokpr", hlopokpr) then
            mainIni.procent.hlopokpr = tostring(u8:decode(hlopokpr.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Ïðîö.")
        end
        imgui.SameLine()
        imgui.PushItemWidth(65)
        if imgui.InputText(u8"##hlopoksum", hlopoksum) then
        mainIni.other.hlopoksum = tostring(u8:decode(hlopoksum.v))
        saveIniFile()
        end
        imgui.SameLine()
        imgui.TextDisabled(u8"Öåíà çà øò")
    end
    imgui.CreatePaddingX(10)
    if imgui.Checkbox(u8"Êðàñèòåëü",kras) then
        mainIni.other.kras = kras.v
        saveIniFile()
    end
    if kras.v then
        imgui.SameLine()
        if typebuy.v == 1 then
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##krascol", krascol) then
            mainIni.other.krascol = tostring(u8:decode(krascol.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Êîë.")
        else
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##kraspr", kraspr) then
            mainIni.procent.kraspr = tostring(u8:decode(kraspr.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Ïðîö.")
        end
        imgui.SameLine()
        imgui.PushItemWidth(65)
        if imgui.InputText(u8"##krassum", krassum) then
        mainIni.other.krassum = tostring(u8:decode(krassum.v))
        saveIniFile()
        end
        imgui.SameLine()
        imgui.TextDisabled(u8"Öåíà çà øò")
    end
    imgui.EndChild()
    local auf = imgui.ImVec2(150,50)
    imgui.CreatePaddingY(2)
    imgui.CreatePaddingX(8)
    if imgui.RadioButton(u8'Öåíû', typebuy, 1) then
        mainIni.main.typebuy = typebuy.v
        saveIniFile()
    end
    imgui.Hint(u8"Ïðîñòî âûñòàâëÿåòå öåíó çà òîâàð")
    imgui.SameLine()
    if imgui.RadioButton(u8'Ïðîöåíòû', typebuy, 2) then
        mainIni.main.typebuy = typebuy.v
        SCM("Â ðàçðàáîòêå, íà äàííûé ìîìåíò ðàáîòàåò òîëüêî ñ öåíàìè")
        saveIniFile()
    end
    imgui.Hint(u8"Âûñòàâëÿéòå ïðîöåíò äåíåã êîòîðûå ïîéäóò íà òî èëè èíîé òîâàð â âèäå:\n0.1 = 10% | 0.01 = 1% | 1 = 100%")
    imgui.SameLine()
    if imgui.Button(u8'Ñëåäóùàÿ ñòðàíèöà '..fa.ICON_FA_ARROW_RIGHT,auf) then
        SCM("Â ðàçðàáîòêå")
    end
    imgui.SameLine()
    if imgui.Button(u8('Íà÷àòü ñêóï'),auf) then
        fastskup()
    end
    imgui.Hint(u8"Îòêðîéòå íà÷àëüíîå ìåíþ íàæàâ íà ALT")
    if typebuy.v == 2 then
        local bbb = imgui.ImVec2(480,25)
        if imgui.Button(u8('Ïðîâåðèòü ïðîöåíòû'),bbb) then
            proc = 0
			superproc()
			if proc>1.0000000002 then
				SCM('{FF0000}Âíèìàíèå{FFFAFA}, ïðîöåíòû ïðèâûøàþò 1 íà {FF0000}'..proc)
			else
				SCM('Ïðîöåíòû â íîðìå: {00FF00}'..proc)
			end
        end
        imgui.Hint(u8"Íàæàâ íà êíîïêó âñå óêàçàííûå ïðîöåíòû ïðîâåðÿòñÿ. \n  ÂÍÈÌÀÍÈÅ: ÍÅ ÄÎÏÓÑÊÀÉÒÅ ×ÒÎ ÁÛ ÏÐÎÖÅÍÒÀ ÍÅ ÁÛËÎ! ÈÍÀ×Å ÑÊÐÈÏÒ ÊÐÀØÍÅÒÑß")
    end
    imgui.EndGroup()
end

function beginchild1()
    imgui.BeginChild('##beginchild1', imgui.ImVec2(480, 430), true)
    imgui.CreatePaddingY(10)
    imgui.CreatePaddingX(10)
    if imgui.Checkbox(u8"Áðîíçîâàÿ ðóëåòêà",bronzrulet) then
        mainIni.ruletki.bronzrulet = bronzrulet.v
        saveIniFile()
    end
    if bronzrulet.v then
        imgui.SameLine()
        if typebuy.v == 1 then
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##bronzruletcol", bronzruletcol) then
            mainIni.ruletki.bronzruletcol = tostring(u8:decode(bronzruletcol.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Êîë.")
        else
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##bronzruletpr", bronzruletpr) then
            mainIni.procent.bronzruletpr = tostring(u8:decode(bronzruletpr.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Ïðîö.")
        end
            imgui.SameLine()
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##bronzruletsum", bronzruletsum) then
            mainIni.ruletki.bronzruletsum = tostring(u8:decode(bronzruletsum.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Öåíà çà øò")
    end
    imgui.CreatePaddingX(10)
    if imgui.Checkbox(u8"Ñåðåáðÿíàÿ ðóëåòêà",serrulet) then
        mainIni.ruletki.serrulet = serrulet.v
        saveIniFile()
    end
    if serrulet.v then
        imgui.SameLine()
        if typebuy.v == 1 then
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##serruletcol", serruletcol) then
            mainIni.ruletki.serruletcol = tostring(u8:decode(serruletcol.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Êîë.")
        else
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##serruletpr", serruletpr) then
            mainIni.procent.serruletpr = tostring(u8:decode(serruletpr.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Ïðîö.")
        end
            imgui.SameLine()
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##serruletsum", serruletsum) then
            mainIni.ruletki.serruletsum = tostring(u8:decode(serruletsum.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Öåíà çà øò")
    end
    imgui.CreatePaddingX(10)
    if imgui.Checkbox(u8"Çîëîòàÿ ðóëåòêà",goldrulet) then
        mainIni.ruletki.goldrulet = goldrulet.v
        saveIniFile()
    end
    if goldrulet.v then
        imgui.SameLine()
        if typebuy.v == 1 then
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##goldruletcol", goldruletcol) then
            mainIni.ruletki.goldruletcol = tostring(u8:decode(goldruletcol.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Êîë.")
        else
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##goldruletpr", goldruletpr) then
            mainIni.procent.goldruletpr = tostring(u8:decode(goldruletpr.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Ïðîö.")
        end
            imgui.SameLine()
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##goldruletsum", goldruletsum) then
            mainIni.ruletki.goldruletsum = tostring(u8:decode(goldruletsum.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Öåíà çà øò")
    end
    imgui.CreatePaddingX(10)
    if imgui.Checkbox(u8"Ïëàòèíîâàÿ ðóëåòêà",platrulet) then
        mainIni.ruletki.platrulet = platrulet.v
        saveIniFile()
    end
    if platrulet.v then
        imgui.SameLine()
        if typebuy.v == 1 then
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##platruletcol", platruletcol) then
            mainIni.ruletki.platruletcol = tostring(u8:decode(platruletcol.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Êîë.")
        else
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##platruletpr", platruletpr) then
            mainIni.procent.platruletpr = tostring(u8:decode(platruletpr.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Ïðîö.")
        end
            imgui.SameLine()
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##platruletsum", platruletsum) then
            mainIni.ruletki.platruletsum = tostring(u8:decode(platruletsum.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Öåíà çà øò")
    end
    imgui.CreatePaddingX(10)
    if imgui.Checkbox(u8"Ñåìåéíûå òàëîíû",famtalon) then
        mainIni.other.famtalon = famtalon.v
        saveIniFile()
    end
    if famtalon.v then
        imgui.SameLine()
        if typebuy.v == 1 then
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##famtaloncol", famtaloncol) then
            mainIni.other.famtaloncol = tostring(u8:decode(famtaloncol.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Êîë.")
        else
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##famtalonpr", famtalonpr) then
            mainIni.procent.famtalonpr = tostring(u8:decode(famtalonpr.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Ïðîö.")
        end
            imgui.SameLine()
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##famtalonsum", famtalonsum) then
            mainIni.other.famtalonsum = tostring(u8:decode(famtalonsum.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Öåíà çà øò")
    end
    imgui.CreatePaddingX(10)
    if imgui.Checkbox(u8"Ïîäàðîê",podarok) then
        mainIni.other.podarok = podarok.v
        saveIniFile()
    end
    if podarok.v then
        imgui.SameLine()
        if typebuy.v == 1 then
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##podarokcol", podarokcol) then
            mainIni.other.podarokcol = tostring(u8:decode(podarokcol.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Êîë.")
        else
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##podarokpr", podarokpr) then
            mainIni.procent.podarokpr = tostring(u8:decode(podarokpr.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Ïðîö.")
        end
            imgui.SameLine()
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##podaroksum", podaroksum) then
            mainIni.other.podaroksum = tostring(u8:decode(podaroksum.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Öåíà çà øò")
    end
    imgui.CreatePaddingX(10)
    if imgui.Checkbox(u8"Ãðàæäàíñêèé òàëîí",grajdantalon) then
        mainIni.other.grajdantalon = grajdantalon.v
        saveIniFile()
    end
    if grajdantalon.v then
        imgui.SameLine()
        if typebuy.v == 1 then
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##grajdantaloncol", grajdantaloncol) then
            mainIni.other.grajdantaloncol = tostring(u8:decode(grajdantaloncol.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Êîë.")
        else
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##grajdantalonpr", grajdantalonpr) then
            mainIni.procent.grajdantalonpr = tostring(u8:decode(grajdantalonpr.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Ïðîö.")
        end
            imgui.SameLine()
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##grajdantalonsum", grajdantalonsum) then
            mainIni.other.grajdantalonsum = tostring(u8:decode(grajdantalonsum.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Öåíà çà øò")
    end
    imgui.CreatePaddingX(10)
    if imgui.Checkbox(u8"Ñêèäî÷íûé òàëîí",skidochnik) then
        mainIni.other.skidochnik = skidochnik.v
        saveIniFile()
    end
    if skidochnik.v then
        imgui.SameLine()
        if typebuy.v == 1 then
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##skidochnikcol", skidochnikcol) then
            mainIni.other.skidochnikcol = tostring(u8:decode(skidochnikcol.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Êîë.")
        else
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##skidochnikpr", skidochnikpr) then
            mainIni.procent.skidochnikpr = tostring(u8:decode(skidochnikpr.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Ïðîö.")
        end
            imgui.SameLine()
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##skidochniksum", skidochniksum) then
            mainIni.other.skidochniksum = tostring(u8:decode(skidochniksum.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Öåíà çà øò")
    end
    imgui.CreatePaddingX(10)
    if imgui.Checkbox(u8"Ñ÷àñëèâàÿ òðàâêà",travka) then
        mainIni.other.travka = travka.v
        saveIniFile()
    end
    if travka.v then
        imgui.SameLine()
        if typebuy.v == 1 then
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##travkacol", travkacol) then
            mainIni.other.travkacol = tostring(u8:decode(travkacol.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Êîë.")
        else
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##travkapr", travkapr) then
            mainIni.procent.travkapr = tostring(u8:decode(travkapr.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Ïðîö.")
        end
            imgui.SameLine()
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##travkasum", travkasum) then
            mainIni.other.travkasum = tostring(u8:decode(travkasum.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Öåíà çà øò")
    end
    imgui.CreatePaddingX(10)
    if imgui.Checkbox(u8"Òî÷èëüíûå êàìíè",tochkam) then
        mainIni.other.tochkam = tochkam.v
        saveIniFile()
    end
    if tochkam.v then
        imgui.SameLine()
        if typebuy.v == 1 then
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##tochkamcol", tochkamcol) then
            mainIni.other.tochkamcol = tostring(u8:decode(tochkamcol.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Êîë.")
        else
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##tochkampr", tochkampr) then
            mainIni.procent.tochkampr = tostring(u8:decode(tochkampr.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Ïðîö.")
        end
            imgui.SameLine()
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##tochkamsum", tochkamsum) then
            mainIni.other.tochkamsum = tostring(u8:decode(tochkamsum.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Öåíà çà øò")
    end
    imgui.CreatePaddingX(10)
    if imgui.Checkbox(u8"Çëîâåùàÿ ìîíåòà",zlovmoneta) then
        mainIni.other.zlovmoneta = zlovmoneta.v
        saveIniFile()
    end
    if zlovmoneta.v then
        imgui.SameLine()
        if typebuy.v == 1 then
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##zlovmonetacol", zlovmonetacol) then
            mainIni.other.zlovmonetacol = tostring(u8:decode(zlovmonetacol.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Êîë.")
        else
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##zlovmonetapr", zlovmonetapr) then
            mainIni.procent.zlovmonetapr = tostring(u8:decode(zlovmonetapr.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Ïðîö.")
        end
            imgui.SameLine()
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##zlovmonetasum", zlovmonetasum) then
            mainIni.other.zlovmonetasum = tostring(u8:decode(zlovmonetasum.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Öåíà çà øò")
    end
    imgui.CreatePaddingX(10)
    if imgui.Checkbox(u8"×åðåïà",cherep) then
        mainIni.other.cherep = cherep.v
        saveIniFile()
    end
    if cherep.v then
        imgui.SameLine()
        if typebuy.v == 1 then
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##cherepcol", cherepcol) then
            mainIni.other.cherepcol = tostring(u8:decode(cherepcol.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Êîë.")
        else
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##chereppr", chereppr) then
            mainIni.procent.chereppr = tostring(u8:decode(chereppr.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Ïðîö.")
        end
            imgui.SameLine()
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##cherepsum", cherepsum) then
            mainIni.other.cherepsum = tostring(u8:decode(cherepsum.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Öåíà çà øò")
    end
    imgui.CreatePaddingX(10)
    if imgui.Checkbox(u8"Åâðî",euro) then
        mainIni.other.euro = euro.v
        saveIniFile()
    end
    if euro.v then
        imgui.SameLine()
        if typebuy.v == 1 then
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##eurocol", eurocol) then
            mainIni.other.eurocol = tostring(u8:decode(eurocol.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Êîë.")
        else
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##europr", europr) then
            mainIni.procent.europr = tostring(u8:decode(europr.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Ïðîö.")
        end
            imgui.SameLine()
            imgui.PushItemWidth(65)
            if imgui.InputText(u8"##eurosum", eurosum) then
            mainIni.other.eurosum = tostring(u8:decode(eurosum.v))
            saveIniFile()
            end
            imgui.SameLine()
            imgui.TextDisabled(u8"Öåíà çà øò")
    end
    imgui.EndChild()
end

function main_button()
    imgui.SetCursorPos(imgui.ImVec2(10,10))
	imgui.BeginGroup()
    local auf = imgui.ImVec2(100,40)
    if imgui.Button(u8('Ãëàâíîå'),auf) then
        sbros()
        vkladki[1] = true
    end
    imgui.Hint(u8"Ãëàâíàÿ ñòðàíèöà",0)
	imgui.SameLine()
    if imgui.Button(u8('ÀâòîÑêóï'),auf) then
        sbros()
        vkladki[2] = true
    end
    imgui.Hint(u8"Àâòîìàòè÷åñêè âûñòàâëÿåò íà ñêóï âñå òîâàðû êîòîðûå âû âûáåðèòå.",0)
    imgui.EndGroup()
    imgui.Separator()
end 

local cc = {}
function cc:hex(hex,alpha)
    alpha = tonumber(alpha) or 255
    local methods = {}
    function methods:rgb()
        return tonumber("0x"..hex:sub(1,2)), tonumber("0x"..hex:sub(3,4)), tonumber("0x"..hex:sub(5,6))
    end
    function methods:rgba()
        local r,g,b = methods:rgb()
        return r,g,b,alpha
    end
    function methods:ImVec4()
        local r,g,b,a = methods:rgba()
        return imgui.ImVec4(r/255,g/255,b/255,a/255)
    end
    function methods:ImColor()
        return imgui.ImColor(methods:ImVec4())
    end
    function methods:U32()
        return methods:ImColor():GetU32()
    end
    return methods
end

function imgui.ButtonHex(lable, rgb, size)
    local r = bit.band(bit.rshift(rgb, 16), 0xFF) / 255
    local g = bit.band(bit.rshift(rgb, 8), 0xFF) / 255
    local b = bit.band(rgb, 0xFF) / 255

    imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(r, g, b, 0.6))
    imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(r, g, b, 0.8))
    imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(r, g, b, 1.0))
    local button = imgui.Button(lable, size)
    imgui.PopStyleColor(3) 
    return button
end

function imgui.Hint(text, delay, action)
    if imgui.IsItemHovered() then
        if go_hint == nil then go_hint = os.clock() + (delay and delay or 0.0) end
        local alpha = (os.clock() - go_hint) * 5
        if os.clock() >= go_hint then 
            imgui.PushStyleVar(imgui.StyleVar.WindowPadding, imgui.ImVec2(10, 10))
            imgui.PushStyleVar(imgui.StyleVar.Alpha, (alpha <= 1.0 and alpha or 1.0))
                imgui.PushStyleColor(imgui.Col.PopupBg, imgui.ImVec4(0.11, 0.11, 0.11, 1.00))
                    imgui.BeginTooltip()
                    imgui.PushTextWrapPos(450)
                    imgui.TextColored(imgui.GetStyle().Colors[imgui.Col.ButtonHovered], fa.ICON_FA_INFO_CIRCLE..u8' Ïîäñêàçêà:')
                    imgui.TextUnformatted(text)
                    if action ~= nil then 
                        imgui.TextColored(imgui.GetStyle().Colors[imgui.Col.TextDisabled], '\n'..fa.ICON_FA_SHARE..' '..action)
                    end
                    if not imgui.IsItemVisible() and imgui.GetStyle().Alpha == 1.0 then go_hint = nil end
                    imgui.PopTextWrapPos()
                    imgui.EndTooltip()
                imgui.PopStyleColor()
            imgui.PopStyleVar(2)
        end
    end
end

function imgui.CloseButton(rad,bool)
	local pos = imgui.GetCursorScreenPos()
	local poss = imgui.GetCursorPos()
	local a,b,c,d = pos.x - rad, pos.x + rad, pos.y - rad, pos.y + rad
	local e,f = poss.x - rad, poss.y - rad
    local list = imgui.GetWindowDrawList()
    local white = cc:hex('ffffff'):U32()
	list:AddLine(imgui.ImVec2(a,d),imgui.ImVec2(b,c),white)
	list:AddLine(imgui.ImVec2(b,d),imgui.ImVec2(a,c),white)
	imgui.SetCursorPos(imgui.ImVec2(e,f))
	if imgui.InvisibleButton('##closebutolo',imgui.ImVec2(rad*2,rad*2)) then
        if type(bool) == 'userdata' then
            bool.v = false
        elseif type(bool) == 'function' then
            bool()
        end
	end
end

function updateDate()
    local strDate = thisScript().description
    local d, m, y = strDate:match('(%d+)%.(%d+)%.(%d+)')
    local tDateUpdate = { 
        year = y,
        month = m,
        day = d
    }
    return getStrDate(os.time(tDateUpdate))
end

function getStrDate(unixTime)
    local tMonths = {'ÿíâàðÿ', 'ôåâðàëÿ', 'ìàðòà', 'àïðåëÿ', 'ìàÿ', 'èþíÿ', 'èþëÿ', 'àâãóñòà', 'ñåíòÿáðÿ', 'îêòÿáðÿ', 'íîÿáðÿ', 'äåêàáðÿ'}
    local day = tonumber(os.date('%d', unixTime))
    local month = tMonths[tonumber(os.date('%m', unixTime))]
    local year = tonumber(os.date('%Y', unixTime))
    return string.format('%s %s %s', day, month, year)
end

function isVersionBeta(strVer)
    local sel_g, sel_v, sel_p = strVer:match('(%d+)%.(%d+)%.(%d+).*')
    local now_g, now_v, now_p = thisScript().version:match('(%d+)%.(%d+)%.(%d+).*')
    return tonumber(tostring(sel_g..sel_v..sel_p)) > tonumber(tostring(now_g..now_v..now_p))
end

function sbros()
    for i = 0, 4 do
        vkladki[i] = false
    end
end

function imgui.CreatePaddingX(padding_custom)
	padding_custom = padding_custom or 8 
	imgui.SetCursorPosX(imgui.GetCursorPos().x + padding_custom)
end
function imgui.CreatePaddingY(padding_custom)
	padding_custom = padding_custom or 8
	imgui.SetCursorPosY(imgui.GetCursorPos().y + padding_custom)
end

function imgui.CenterTextColoredRGB(text)
    local width = imgui.GetWindowWidth()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local ImVec4 = imgui.ImVec4

    local explode_argb = function(argb)
        local a = bit.band(bit.rshift(argb, 24), 0xFF)
        local r = bit.band(bit.rshift(argb, 16), 0xFF)
        local g = bit.band(bit.rshift(argb, 8), 0xFF)
        local b = bit.band(argb, 0xFF)
        return a, r, g, b
    end

    local getcolor = function(color)
        if color:sub(1, 6):upper() == 'SSSSSS' then
            local r, g, b = colors[1].x, colors[1].y, colors[1].z
            local a = tonumber(color:sub(7, 8), 16) or colors[1].w * 255
            return ImVec4(r, g, b, a / 255)
        end
        local color = type(color) == 'string' and tonumber(color, 16) or color
        if type(color) ~= 'number' then return end
        local r, g, b, a = explode_argb(color)
        return imgui.ImColor(r, g, b, a):GetVec4()
    end

    local render_text = function(text_)
        for w in text_:gmatch('[^\r\n]+') do
            local textsize = w:gsub('{.-}', '')
            local text_width = imgui.CalcTextSize(u8(textsize))
            imgui.SetCursorPosX( width / 2 - text_width .x / 2 )
            local text, colors_, m = {}, {}, 1
            w = w:gsub('{(......)}', '{%1FF}')
            while w:find('{........}') do
                local n, k = w:find('{........}')
                local color = getcolor(w:sub(n + 1, k - 1))
                if color then
                    text[#text], text[#text + 1] = w:sub(m, n - 1), w:sub(k + 1, #w)
                    colors_[#colors_ + 1] = color
                    m = n
                end
                w = w:sub(1, n - 1) .. w:sub(k + 1, #w)
            end
            if text[0] then
                for i = 0, #text do
                    imgui.TextColored(colors_[i] or colors[1], u8(text[i]))
                    imgui.SameLine(nil, 0)
                end
                imgui.NewLine()
            else
                imgui.Text(u8(w))
            end
        end
    end
    render_text(text)
end
function imgui.ButtonDiscord(textbuffer)
    imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(0.41, 0.19, 0.63, 1))
    imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(0.41, 0.19, 0.63, 1))
    imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(0.41, 0.19, 0.63, 1))
    if imgui.Button('Discord', imgui.ImVec2(100, 30)) then setClipboardText(textbuffer) end
    imgui.PopStyleColor(3)
    imgui.Hint(textbuffer, 0, u8(getClipboardText() == textbuffer and 'Ñêîïèðîâàíî!' or 'Êëèêíèòå ÷òî-áû ñêîïèðîâàòü'))
end

function imgui.MiniLable(text, clr, offsx, offsy)
    local dList = imgui.GetWindowDrawList()
    local p = imgui.GetCursorScreenPos()
    local textsize = imgui.CalcTextSize(text)
    dList:AddRect(imgui.ImVec2((p.x + offsx) - 10, p.y), imgui.ImVec2((p.x + offsx + textsize.x) + 10, p.y + (offsy * 2)), imgui.GetColorU32(clr), 16.0)
    local p_ = imgui.GetCursorPos()
    imgui.SetCursorPos(imgui.ImVec2(p_.x + offsx, p_.y + (offsy - 7.5)))
    imgui.TextColored(clr, text) 
end

function daysAfterUpdate()
    local strDate = thisScript().description
    local d, m, y = strDate:match('(%d+)%.(%d+)%.(%d+)')
    local tDateUpdate = { 
        year = y,
        month = m,
        day = d
    }
    local tDateNow = {
        year = os.date("%Y", os.time()),
        month = os.date("%m", os.time()),
        day = os.date("%d", os.time())
    }
    return math.floor((os.time(tDateNow) - os.time(tDateUpdate)) / 86400)
end

function imgui.TextColoredRGB(text)
    local style = imgui.GetStyle()
    local colors = style.Colors
    local ImVec4 = imgui.ImVec4

    local explode_argb = function(argb)
        local a = bit.band(bit.rshift(argb, 24), 0xFF)
        local r = bit.band(bit.rshift(argb, 16), 0xFF)
        local g = bit.band(bit.rshift(argb, 8), 0xFF)
        local b = bit.band(argb, 0xFF)
        return a, r, g, b
    end

    local getcolor = function(color)
        if color:sub(1, 6):upper() == 'SSSSSS' then
            local r, g, b = colors[1].x, colors[1].y, colors[1].z
            local a = tonumber(color:sub(7, 8), 16) or colors[1].w * 255
            return ImVec4(r, g, b, a / 255)
        end
        local color = type(color) == 'string' and tonumber(color, 16) or color
        if type(color) ~= 'number' then return end
        local r, g, b, a = explode_argb(color)
        return imgui.ImColor(r, g, b, a):GetVec4()
    end

    local render_text = function(text_)
        for w in text_:gmatch('[^\r\n]+') do
            local text, colors_, m = {}, {}, 1
            w = w:gsub('{(......)}', '{%1FF}')
            while w:find('{........}') do
                local n, k = w:find('{........}')
                local color = getcolor(w:sub(n + 1, k - 1))
                if color then
                    text[#text], text[#text + 1] = w:sub(m, n - 1), w:sub(k + 1, #w)
                    colors_[#colors_ + 1] = color
                    m = n
                end
                w = w:sub(1, n - 1) .. w:sub(k + 1, #w)
            end
            if text[0] then
                for i = 0, #text do
                    imgui.TextColored(colors_[i] or colors[1], u8(text[i]))
                    imgui.SameLine(nil, 0)
                end
                imgui.NewLine()
            else imgui.Text(u8(w)) end
        end
    end
    render_text(text)
end


function imgui.ButtonVK(textbuffer)
    imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(0.00, 0.35, 0.65, 1))
    imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(0.00, 0.40, 0.65, 1))
    imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(0.00, 0.45, 0.65, 1))
    if imgui.Button(u8'ÂÊîíòàêòå', imgui.ImVec2(100, 30)) then setClipboardText(textbuffer) end
    imgui.PopStyleColor(3)
    imgui.Hint(textbuffer, 0, u8(getClipboardText() == textbuffer and 'Ñêîïèðîâàíî!' or 'Êëèêíèòå ÷òî-áû ñêîïèðîâàòü'))
end

function imgui.ButtonBlastHK(textbuffer)
    imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(0.19, 0.22, 0.26, 1))
    imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(0.15, 0.18, 0.22, 1))
    imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(0.11, 0.14, 0.18, 1))
    if imgui.Button('BlastHack', imgui.ImVec2(100, 30)) then setClipboardText(textbuffer) end
    imgui.PopStyleColor(3)
    imgui.Hint(textbuffer, 0, u8(getClipboardText() == textbuffer and 'Ñêîïèðîâàíî!' or 'Êëèêíèòå ÷òî-áû ñêîïèðîâàòü'))
end

function imgui.ButtonTelegram(textbuffer)
    imgui.PushStyleColor(imgui.Col.Button, imgui.ImVec4(0, 0.45, 0.8, 1))
    imgui.PushStyleColor(imgui.Col.ButtonHovered, imgui.ImVec4(0, 0.45, 0.8, 1))
    imgui.PushStyleColor(imgui.Col.ButtonActive, imgui.ImVec4(0, 0.45, 0.8, 1))
    if imgui.Button('Telegram', imgui.ImVec2(100, 30)) then setClipboardText(textbuffer) end
    imgui.PopStyleColor(3)
    imgui.Hint(textbuffer, 0, u8(getClipboardText() == textbuffer and 'Ñêîïèðîâàíî!' or 'Êëèêíèòå ÷òî-áû ñêîïèðîâàòü'))
end
local money=getPlayerMoney(PLAYER_HANDLE)
local summa = 0
function fastskupruletki()
    if bronzrulet.v then
        amount=math.floor(tonumber(bronzruletpr.v)*money/tonumber(bronzruletsum.v))
        str2()
        sampSendDialogResponse(3050, 1, 8, '')
        if typebuy.v == 1 then
        sampSendDialogResponse(3060, 1, 0, bronzruletcol.v..' '..bronzruletsum.v)
        summa = summa + tonumber(bronzruletcol.v)*tonumber(bronzruletsum.v)
        else
            sampSendDialogResponse(3060, 1, 0, amount..' '..bronzruletsum.v)
            summa = summa + tonumber(amount)*tonumber(bronzruletsum.v)
        end
    end
    if serrulet.v then
        amount=math.floor(tonumber(serruletpr.v)*money/tonumber(serruletsum.v))
        str2()
        sampSendDialogResponse(3050, 1, 9, '')
        if typebuy.v == 1 then
            sampSendDialogResponse(3060, 1, 0, serruletcol.v..' '..serruletsum.v)
            summa = summa + tonumber(serruletcol.v)*tonumber(serruletsum.v)
        else
            sampSendDialogResponse(3060, 1, 0, amount..' '..serruletsum.v)
            summa = summa + tonumber(amount)*tonumber(serruletsum.v)
        end
    end 
    if goldrulet.v then
        amount=math.floor(tonumber(goldruletpr.v)*money/tonumber(goldruletsum.v))
        str2()
        sampSendDialogResponse(3050, 1, 10, '')
        if typebuy.v == 1 then
            sampSendDialogResponse(3060, 1, 0, goldruletcol.v..' '..goldruletsum.v)
            summa = summa + tonumber(goldruletcol.v)*tonumber(goldruletsum.v)
        else
            sampSendDialogResponse(3060, 1, 0, amount..' '..goldruletsum.v)
            summa = summa + tonumber(amount)*tonumber(goldruletsum.v)
        end
    end
end
function resi()
    if hlopok.v then
        amount=math.floor(tonumber(hlopokpr.v)*money/tonumber(hlopoksum.v))
        str3()
        sampSendDialogResponse(3050, 1, 2, '')
        if typebuy.v == 1 then
            sampSendDialogResponse(3060, 1, 0, hlopokcol.v..' '..hlopoksum.v)
            summa = summa + tonumber(hlopokcol.v)*tonumber(hlopoksum.v)
        else
            sampSendDialogResponse(3060, 1, 0, amount..' '..hlopoksum.v)
            summa = summa + tonumber(amount)*tonumber(hlopoksum.v)
        end
    end
    if len.v then
        amount=math.floor(tonumber(lenpr.v)*money/tonumber(lensum.v))
        str3()
        sampSendDialogResponse(3050, 1, 3, '')
        if typebuy.v == 1 then
            sampSendDialogResponse(3060, 1, 0, lencol.v..' '..lensum.v)
            summa = summa + tonumber(lencol.v)*tonumber(lensum.v)
        else
            sampSendDialogResponse(3060, 1, 0, amount..' '..lensum.v)
            summa = summa + tonumber(amount)*tonumber(lensum.v)
        end
    end
    if kamen.v then
        amount=math.floor(tonumber(kamenpr.v)*money/tonumber(kamensum.v))
        str3()
        sampSendDialogResponse(3050, 1, 4, '')
        if typebuy.v == 1 then
            sampSendDialogResponse(3060, 1, 0, kamencol.v..' '..kamensum.v)
            summa = summa + tonumber(kamencol.v)*tonumber(kamensum.v)
        else
            sampSendDialogResponse(3060, 1, 0, amount..' '..kamensum.v)
            summa = summa + tonumber(amount)*tonumber(kamensum.v)
        end
    end
    if metall.v then
        amount=math.floor(tonumber(metallpr.v)*money/tonumber(metallsum.v))
        str3()
        sampSendDialogResponse(3050, 1, 5, '')
        if typebuy.v == 1 then
            sampSendDialogResponse(3060, 1, 0, metallcol.v..' '..metallsum.v)
            summa = summa + tonumber(metallcol.v)*tonumber(metallsum.v)
        else
            sampSendDialogResponse(3060, 1, 0, amount..' '..metallsum.v)
            summa = summa + tonumber(amount)*tonumber(metallsum.v)
        end
    end
    if bronz.v then
        amount=math.floor(tonumber(bronzpr.v)*money/tonumber(bronzsum.v))
        str3()
        sampSendDialogResponse(3050, 1, 6, '')
        if typebuy.v == 1 then
            sampSendDialogResponse(3060, 1, 0, bronzcol.v..' '..bronzsum.v)
            summa = summa + tonumber(bronzcol.v)*tonumber(bronzsum.v)
        else
            sampSendDialogResponse(3060, 1, 0, amount..' '..bronzsum.v)
            summa = summa + tonumber(amount)*tonumber(bronzsum.v)
        end
    end
    if serebro.v then
        amount=math.floor(tonumber(serebropr.v)*money/tonumber(serebrosum.v))
        str3()
        sampSendDialogResponse(3050, 1, 7, '')
        if typebuy.v == 1 then
            sampSendDialogResponse(3060, 1, 0, serebrocol.v..' '..serebrosum.v)
            summa = summa + tonumber(serebrocol.v)*tonumber(serebrosum.v)
        else
            sampSendDialogResponse(3060, 1, 0, amount..' '..serebrosum.v)
            summa = summa + tonumber(amount)*tonumber(serebrosum.v)
        end
    end
    if gold.v then
        amount=math.floor(tonumber(goldpr.v)*money/tonumber(goldsum.v))
        str3()
        sampSendDialogResponse(3050, 1, 8, '')
        if typebuy.v == 1 then
            sampSendDialogResponse(3060, 1, 0, goldcol.v..' '..goldsum.v)
            summa = summa + tonumber(goldcol.v)*tonumber(goldsum.v)
        else
            sampSendDialogResponse(3060, 1, 0, amount..' '..goldsum.v)
            summa = summa + tonumber(amount)*tonumber(goldsum.v)
        end
    end
    if kras.v then
        amount=math.floor(tonumber(kraspr.v)*money/tonumber(krassum.v))
        str3()
        sampSendDialogResponse(3050, 1, 9, '')
        if typebuy.v == 1 then
            sampSendDialogResponse(3060, 1, 0, krascol.v..' '..krassum.v)
            summa = summa + tonumber(krascol.v)*tonumber(krassum.v)
        else
            sampSendDialogResponse(3060, 1, 0, amount..' '..krassum.v)
            summa = summa + tonumber(amount)*tonumber(krassum.v)
        end
    end
end
function fastskup()
    lua_thread.create(function()
    wait(100)
        if bronzrulet.v and tonumber(bronzruletsum.v)~= 0 then
            money=money-tonumber(bronzruletsum.v)
        end
        if serrulet.v and tonumber(serruletsum.v)~= 0 then
            money=money-tonumber(serruletsum.v)
        end
        if goldrulet.v and tonumber(goldruletsum.v)~= 0 then
            money=money-tonumber(goldruletsum.v)
        end
        if platrulet.v and tonumber(platruletsum.v)~= 0 then
            money=money-tonumber(platruletsum.v)
        end
        proc=0
		superproc()
        if proc >1.000002 then
            SCM('Ðàñïðåäåëèòå ïðîöåíòû òàê, ÷òîáû îíè íå ïðåâîñõîäèëè 1. Ñåé÷àñ: {FF0000}'..proc)
        elseif (money<0) then
			SCM('Íå õâàòàåò äåíåã íà ñêóï, óáåðè íåñêîëüêî òîâàðîâ.')
		elseif sampIsDialogActive() then
            if sampGetCurrentDialogId() == 3040 then 
                if famtalon.v then
                    amount=math.floor(tonumber(famtalonpr.v)*money/tonumber(famtalonsum.v))
                    str1()
                    sampSendDialogResponse(3050, 1, 12, '')
                    if typebuy.v == 1 then
                    sampSendDialogResponse(3060, 1, 0, famtaloncol.v..' '..famtalonsum.v)
                    summa = summa + tonumber(famtaloncol.v)*tonumber(famtalonsum.v)
                    else
                    sampSendDialogResponse(3060, 1, 0, amount..' '..famtalonsum.v)
                    summa = summa + tonumber(amount)*tonumber(famtalonsum.v)
                    end
                end
                if cherep.v then
                    amount=math.floor(tonumber(chereppr.v)*money/tonumber(cherepsum.v))
                    str1()
                    sampSendDialogResponse(3050, 1, 18, '')
                    if typebuy.v == 1 then
                        sampSendDialogResponse(3060, 1, 0, cherepcol.v..' '..cherepsum.v)
                        summa = summa + tonumber(cherepcol.v)*tonumber(cherepsum.v)
                    else
                        sampSendDialogResponse(3060, 1, 0, amount..' '..cherepsum.v)
                        summa = summa + tonumber(amount)*tonumber(cherepsum.v)
                    end
                end
                if skidochnik.v then
                    amount=math.floor(tonumber(skidochnikpr.v)*money/tonumber(skidochniksum.v))
                    str2()
                    sampSendDialogResponse(3050, 1, 4, '')
                    if typebuy.v == 1 then
                        sampSendDialogResponse(3060, 1, 0, skidochnikcol.v..' '..skidochniksum.v)
                        summa = summa + tonumber(skidochnikcol.v)*tonumber(skidochniksum.v)
                    else
                        sampSendDialogResponse(3060, 1, 0, amount..' '..skidochniksum.v)
                        summa = summa + tonumber(amount)*tonumber(skidochniksum.v)
                    end
                end
                if podarok.v then
                    amount=math.floor(tonumber(podarokpr.v)*money/tonumber(podaroksum.v))
                    str2()
                    sampSendDialogResponse(3050, 1, 5, '')
                    if typebuy.v == 1 then
                        sampSendDialogResponse(3060, 1, 0, podarokcol.v..' '..podaroksum.v)
                        summa = summa + tonumber(podarokcol.v)*tonumber(podaroksum.v)
                    else
                        sampSendDialogResponse(3060, 1, 0, amount..' '..podaroksum.v)
                        summa = summa + tonumber(amount)*tonumber(podaroksum.v)
                    end
                end
                fastskupruletki()
                resi()
                if euro.v then
                    amount=math.floor(tonumber(europr.v)*money/tonumber(eurosum.v))
                    str17()
                    sampSendDialogResponse(3050, 1, 4, '')
                    if typebuy.v == 1 then
                        sampSendDialogResponse(3060, 1, 0, eurocol.v..' '..eurosum.v)
                        summa = summa + tonumber(eurocol.v)*tonumber(eurosum.v)
                    else
                        sampSendDialogResponse(3060, 1, 0, amount..' '..eurosum.v)
                        summa = summa + tonumber(amount)*tonumber(eurosum.v)
                    end
                end
                if grajdantalon.v then
                    amount=math.floor(tonumber(grajdantalonpr.v)*money/tonumber(grajdantalonsum.v))
                    str19()
                    sampSendDialogResponse(3050, 1, 5, '')
                    if typebuy.v == 1 then
                        sampSendDialogResponse(3060, 1, 0, grajdantaloncol.v..' '..grajdantalonsum.v)
                        summa = summa + tonumber(grajdantaloncol.v)*tonumber(grajdantalonsum.v)
                    else
                        sampSendDialogResponse(3060, 1, 0, amount..' '..grajdantalonsum.v)
                        summa = summa + tonumber(amount)*tonumber(grajdantalonsum.v)
                    end
                end
                if zlovmoneta.v then
                    amount=math.floor(tonumber(zlovmonetapr.v)*money/tonumber(zlovmonetasum.v))
                    str20()
                    sampSendDialogResponse(3050, 1, 17, '')
                    if typebuy.v == 1 then
                        sampSendDialogResponse(3060, 1, 0, zlovmonetacol.v..' '..zlovmonetasum.v)
                        summa = summa + tonumber(zlovmonetacol.v)*tonumber(zlovmonetasum.v)
                    else
                        sampSendDialogResponse(3060, 1, 0, amount..' '..zlovmonetasum.v)
                        summa = summa + tonumber(amount)*tonumber(zlovmonetasum.v)
                    end
                end
                if tochkam.v then
                    amount=math.floor(tonumber(tochkampr.v)*money/tonumber(tochkamsum.v))
                    str20()
                    sampSendDialogResponse(3050, 1, 18, '')
                    if typebuy.v == 1 then
                        sampSendDialogResponse(3060, 1, 0, tochkamcol.v..' '..tochkamsum.v)
                        summa = summa + tonumber(tochkamcol.v)*tonumber(tochkamsum.v)
                    else
                        sampSendDialogResponse(3060, 1, 0, amount..' '..tochkamsum.v)
                        summa = summa + tonumber(amount)*tonumber(tochkamsum.v)
                    end
                end
                if travka.v then
                    amount=math.floor(tonumber(travkapr.v)*money/tonumber(travkasum.v))
                    str21()
                    sampSendDialogResponse(3050, 1, 1, '')
                    if typebuy.v == 1 then
                        sampSendDialogResponse(3060, 1, 0, travkacol.v..' '..travkasum.v)
                        summa = summa + tonumber(travkacol.v)*tonumber(travkasum.v)
                    else
                        sampSendDialogResponse(3060, 1, 0, amount..' '..travkasum.v)
                        summa = summa + tonumber(amount)*tonumber(travkasum.v)
                    end
                end
                if platrulet.v then
                    str21()
                    sampSendDialogResponse(3050, 1, 10, '')
                    if typebuy.v == 1 then
                        sampSendDialogResponse(3060, 1, 0, platruletcol.v..' '..platruletsum.v)
                        summa = summa + tonumber(travkacol.v)*tonumber(travkasum.v)
                    else
                        sampSendDialogResponse(3060, 1, 0, amount..' '..travkasum.v)
                        summa = summa + tonumber(amount)*tonumber(travkasum.v)
                    end
                end
                wait(500)
                if summa == 0 then
                    SCM("Ñòðàííî, ïîõîæå âû íå âûáðàëè òîâàð èëè æå ïðîñòî íå óêàçàëè öåíû è êîëè÷åñòâî")
                else
                    SCM("Âñå òîâàðû áûëè âûñòàâëåííû íà ñêóï. Íà ñóììó "..lc.. ""..summa)
                end
            else
                SCM("Íàæìè íà êíîïî÷êó ALT")
            end
        else
            SCM("Íàæìè íà êíîïî÷êó ALT")
        end
    end)
end

function str1()
    sampSendDialogResponse(3040, 1, 0, '')
end
function str2()
    sampSendDialogResponse(3040, 1, 0, '')
    sampSendDialogResponse(3050, 1, 19, '')
end
function str3()
    sampSendDialogResponse(3040, 1, 0, '')
    sampSendDialogResponse(3050, 1, 19, '')
    sampSendDialogResponse(3050, 1, 20, '')
end
function str4()
    sampSendDialogResponse(3040, 1, 0, '')
    sampSendDialogResponse(3050, 1, 19, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
end
function str5()
    sampSendDialogResponse(3040, 1, 0, '')
    sampSendDialogResponse(3050, 1, 19, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
end
function str6()
    sampSendDialogResponse(3040, 1, 0, '')
    sampSendDialogResponse(3050, 1, 19, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
end
function str7()
    sampSendDialogResponse(3040, 1, 0, '')
    sampSendDialogResponse(3050, 1, 19, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
end
function str8()
    sampSendDialogResponse(3040, 1, 0, '')
    sampSendDialogResponse(3050, 1, 19, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
end
function str9()
    sampSendDialogResponse(3040, 1, 0, '')
    sampSendDialogResponse(3050, 1, 19, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
end
function str10()
    sampSendDialogResponse(3040, 1, 0, '')
    sampSendDialogResponse(3050, 1, 19, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
end
function str11()
    sampSendDialogResponse(3040, 1, 0, '')
    sampSendDialogResponse(3050, 1, 19, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
end
function str12()
    sampSendDialogResponse(3040, 1, 0, '')
    sampSendDialogResponse(3050, 1, 19, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
end
function str13()
    sampSendDialogResponse(3040, 1, 0, '')
    sampSendDialogResponse(3050, 1, 19, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
end
function str14()
    sampSendDialogResponse(3040, 1, 0, '')
    sampSendDialogResponse(3050, 1, 19, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
end
function str15()
    sampSendDialogResponse(3040, 1, 0, '')
    sampSendDialogResponse(3050, 1, 19, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
end
function str16()
    sampSendDialogResponse(3040, 1, 0, '')
    sampSendDialogResponse(3050, 1, 19, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
end
function str17()
    sampSendDialogResponse(3040, 1, 0, '')
    sampSendDialogResponse(3050, 1, 19, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
end
function str18()
    sampSendDialogResponse(3040, 1, 0, '')
    sampSendDialogResponse(3050, 1, 19, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
end
function str19()
    sampSendDialogResponse(3040, 1, 0, '')
    sampSendDialogResponse(3050, 1, 19, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
end
function str20()
    sampSendDialogResponse(3040, 1, 0, '')
    sampSendDialogResponse(3050, 1, 19, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
end
function str21()
    sampSendDialogResponse(3040, 1, 0, '')
    sampSendDialogResponse(3050, 1, 19, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
    sampSendDialogResponse(3050, 1, 20, '')
end

function superproc()
    if typebuy.v == 2 then
        if famtalon.v then proc = proc+tonumber(famtalonpr.v) end
        if cherep.v then proc = proc+tonumber(chereppr.v) end
        if bronzrulet.v then proc = proc+tonumber(bronzruletpr.v) end
        if serrulet.v then proc = proc+tonumber(serruletpr.v) end
        if goldrulet.v then proc = proc+tonumber(goldruletpr.v) end
        if skidochnik.v then proc = proc+tonumber(skidochnikpr.v) end
        if podarok.v then proc = proc+tonumber(podarokpr.v) end
        if euro.v then proc = proc+tonumber(europr.v) end
        if grajdantalon.v then proc = proc+tonumber(grajdantalonpr.v) end
        if zlovmoneta.v then proc = proc+tonumber(zlovmonetapr.v) end
        if tochkam.v then proc = proc+tonumber(tochkampr.v) end
        if travka.v then proc = proc+tonumber(travkapr.v) end
        if platrulet.v then proc = proc+tonumber(platruletpr.v) end
        if kamen.v then proc = proc+tonumber(kamenpr.v) end
        if metall.v then proc = proc+tonumber( metallpr.v) end
        if bronz.v then proc = proc+tonumber(bronzpr.v) end
        if serebro.v then proc = proc+tonumber(serebropr.v) end
        if gold.v then proc = proc+tonumber(goldpr.v) end
    end
end

function autoupdatet(json_url, prefix, url)
    local dlstatus = require('moonloader').download_status
    local json = getWorkingDirectory() .. '\\'..thisScript().name..'-version.json'
    if doesFileExist(json) then os.remove(json) end
    downloadUrlToFile(json_url, json,
      function(id, status, p1, p2)
        if status == dlstatus.STATUSEX_ENDDOWNLOAD then
          if doesFileExist(json) then
            local f = io.open(json, 'r')
            if f then
              local info = decodeJson(f:read('*a'))
              updatelink = info.updateurl
              updateversion = info.latest
              f:close()
              os.remove(json)
              if updateversion ~= thisScript().version then
                lua_thread.create(function(prefix)
                  local dlstatus = require('moonloader').download_status
                  local color = -1
                  SCM('Îáíàðóæåíî îáíîâëåíèå. Ïûòàþñü îáíîâèòüñÿ c '..thisScript().version..' íà '..updateversion)
                  wait(250)
                  downloadUrlToFile(updatelink, thisScript().path,
                    function(id3, status1, p13, p23)
                      if status1 == dlstatus.STATUS_DOWNLOADINGDATA then
                        SCM(string.format('Çàãðóæåíî %d èç %d.', p13, p23))
                      elseif status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
                        SCM('Çàãðóçêà îáíîâëåíèÿ çàâåðøåíà.')
                        SCM('Îáíîâëåíèå çàâåðøåíî!')
                        mainIni.main.clogshow = true
                        saveIniFile()
                        goupdatestatus = true
                        lua_thread.create(function() wait(500) thisScript():reload() end)
                      end
                      if status1 == dlstatus.STATUSEX_ENDDOWNLOAD then
                        if goupdatestatus == nil then
                          SCM('Îáíîâëåíèå ïðîøëî íåóäà÷íî. Çàïóñêàþ óñòàðåâøóþ âåðñèþ..')
                          update = false
                        end
                      end
                    end
                  )
                  end, prefix
                )
              else
                update = false
                SCM('Îáíîâëåíèå íå òðåáóåòñÿ.')
              end
            end
          else
            SCM('Íå ìîãó ïðîâåðèòü îáíîâëåíèå. Ñìèðèòåñü èëè ïðîâåðüòå ñàìîñòîÿòåëüíî íà '..url)
            update = false
          end
        end
      end
    )
    while update ~= false do wait(100) end
end

function log(text)
    sampfuncsLog(mc..tag..text)
end
errorLog = {}
function onSystemMessage(msg, type, sender)
    if type == 3 then
        table.insert(errorLog, msg)
    end
end


function onScriptTerminate(script, quitGame)
    if script == thisScript() and ErrorMessage and not quitGame then
        local ver = thisScript().version
        local moon = getMoonloaderVersion()
        local date = os.date('%d.%m.%Y %H:%M:%S', os.time())
        local libs = {
            (imgui and lc..'Ïðñóòñâóåò ('..imgui._VERSION..')' or '{FF0000}Îòñóòñâóåò'), -- Imgui
            (bFa and lc..'Ïðñóòñâóåò' or '{FF0000}Îòñóòñâóåò'), -- FontAwesome
            (doesFileExist(getWorkingDirectory()..'\\resource\\HarlyCloud Script\\fa-solid-900.ttf') and lc..'Ïðñóòñâóåò' or '{FF0000}Îòñóòñâóåò'), -- Font
            (sampev and lc..'Ïðñóòñâóåò' or '{FF0000}Îòñóòñâóåò') -- SAMP.lua (Events)
        }
        local log = #errorLog > 0 and table.concat(errorLog, '\n') or 'Ñâåäåíèÿ îòñóòâóþò'
        local rall = doesFileExist(getWorkingDirectory()..'\\reload_all.lua')

sampShowDialog(0, mc..'Auto Buy '..ec..'| Îøèáêà', 
string.format(
[[{E0BF23}Âíèìàíèå! Ñêðèïò âíåçàïíî çàâåðøèë ñâîþ ðàáîòó.

{ACFF00}Ñâåäåíèÿ î ñèñòåìå:
{FFFFFF} - Âðåìÿ: {00C235}%s
{FFFFFF} - Âåðñèÿ ñêðèïòà: {00C235}%s
{FFFFFF} - Âåðñèÿ MoonLoader: {00C235}%s

{ACFF00}Íàëè÷èå íàèáîëåå âàæíûõ áèáëèîòåê:
{FFFFFF} - Dear Imgui: %s
{FFFFFF} - FontAwesome: %s
{FFFFFF} - Font (fa-solid-900): %s
{FFFFFF} - SAMP.lua: %s

{ACFF00}Ëîã ñêðèïòà:
{BE3D3D}%s

{ACFF00}Èíôîðìàöèÿ:{E0BF23}
 - Åñëè äàííàÿ îøèáêà âîçíèêëà ïðè çàïóñêå èãðû, òî ñêîðåå âñåãî ïðîáëåìà â îòñóòâèè áèáëèîòåê äëÿ ðàáîòû ñêðèïòà
   èëè êîíôëèêòîâàíèå ñî ñòîðîííèìè ïëàãèíàìè/ñêðèïòàìè, ëèáî æå ñî âñåé ñáîðêîé â öåëîì
 
 - Åñëè îøèáêà âîçíèêëà ïðè èñïîëüçîâàíèè ñêðèïòà, íàñòîÿòåëüíî ðåêîìåíäóåòñÿ ñîîáùèòü î íåé ðàçðàáîò÷èêó, 
   ïðèëîæèâ ñêðèíøîò ýòîãî îêíà, à òàê æå, ïî âçîìæíîñòè ôàéëà moonloader.log
   Ïîëíûé ïóòü: {FFFF00}%s{E0BF23}
 
{ACFF00}Ñâçÿçü ñ ðàçðàáî÷èêîì:
{FFFFFF}ÂÊîíòàêòå: {00C235}%s
{FFFFFF}Discord: {00C235}%s
{FFFFFF}Telegram: {00C235}%s

{ACFF00}%s]], 
date, ver, moon,
libs[1], libs[2], libs[3], libs[4],
log,
getGameDirectory()..'\\moonloader\\moonloader.log',
devLink['VK'], devLink['DS'], devLink['TG'],
rall and 'Ïåðåçàïóñòèòü âñå ñêðèïòû: {E0BF23}CTRL + R' or 'Ïåðåçàéäèòå â èãðó äëÿ ïîâòîðíîãî çàïóñêà'
), mc..'Ïîíÿòíî', '', 0)
    end
end

function apply_custom_style()
    imgui.SwitchContext()
    local style = imgui.GetStyle()
    local colors = style.Colors
    local clr = imgui.Col
    local ImVec4 = imgui.ImVec4
    local ImVec2 = imgui.ImVec2
 
     style.WindowPadding = ImVec2(15, 15)
     style.WindowRounding = 15.0
     style.FramePadding = ImVec2(5, 5)
     style.ItemSpacing = ImVec2(12, 8)
     style.ItemInnerSpacing = ImVec2(8, 6)
     style.IndentSpacing = 25.0
     style.ScrollbarSize = 15.0
     style.ScrollbarRounding = 15.0
     style.GrabMinSize = 15.0
     style.GrabRounding = 7.0
     style.ChildWindowRounding = 8.0
     style.FrameRounding = 6.0
   
 
       colors[clr.Text] = ImVec4(0.95, 0.96, 0.98, 1.00)
       colors[clr.TextDisabled] = ImVec4(0.36, 0.42, 0.47, 1.00)
       colors[clr.WindowBg] = ImVec4(0.11, 0.15, 0.17, 1.00)
       colors[clr.ChildWindowBg] = ImVec4(0.15, 0.18, 0.22, 1.00)
       colors[clr.PopupBg] = ImVec4(0.08, 0.08, 0.08, 0.94)
       colors[clr.Border] = ImVec4(0.43, 0.43, 0.50, 0.50)
       colors[clr.BorderShadow] = ImVec4(0.00, 0.00, 0.00, 0.00)
       colors[clr.FrameBg] = ImVec4(0.20, 0.25, 0.29, 1.00)
       colors[clr.FrameBgHovered] = ImVec4(0.12, 0.20, 0.28, 1.00)
       colors[clr.FrameBgActive] = ImVec4(0.09, 0.12, 0.14, 1.00)
       colors[clr.TitleBg] = ImVec4(0.09, 0.12, 0.14, 0.65)
       colors[clr.TitleBgCollapsed] = ImVec4(0.00, 0.00, 0.00, 0.51)
       colors[clr.TitleBgActive] = ImVec4(0.08, 0.10, 0.12, 1.00)
       colors[clr.MenuBarBg] = ImVec4(0.15, 0.18, 0.22, 1.00)
       colors[clr.ScrollbarBg] = ImVec4(0.02, 0.02, 0.02, 0.39)
       colors[clr.ScrollbarGrab] = ImVec4(0.20, 0.25, 0.29, 1.00)
       colors[clr.ScrollbarGrabHovered] = ImVec4(0.18, 0.22, 0.25, 1.00)
       colors[clr.ScrollbarGrabActive] = ImVec4(0.09, 0.21, 0.31, 1.00)
       colors[clr.ComboBg] = ImVec4(0.20, 0.25, 0.29, 1.00)
       colors[clr.CheckMark] = ImVec4(0.28, 0.56, 1.00, 1.00)
       colors[clr.SliderGrab] = ImVec4(0.28, 0.56, 1.00, 1.00)
       colors[clr.SliderGrabActive] = ImVec4(0.37, 0.61, 1.00, 1.00)
       colors[clr.Button] = ImVec4(0.20, 0.25, 0.29, 1.00)
       colors[clr.ButtonHovered] = ImVec4(0.28, 0.56, 1.00, 1.00)
       colors[clr.ButtonActive] = ImVec4(0.06, 0.53, 0.98, 1.00)
       colors[clr.Header] = ImVec4(0.20, 0.25, 0.29, 0.55)
       colors[clr.HeaderHovered] = ImVec4(0.26, 0.59, 0.98, 0.80)
       colors[clr.HeaderActive] = ImVec4(0.26, 0.59, 0.98, 1.00)
       colors[clr.ResizeGrip] = ImVec4(0.26, 0.59, 0.98, 0.25)
       colors[clr.ResizeGripHovered] = ImVec4(0.26, 0.59, 0.98, 0.67)
       colors[clr.ResizeGripActive] = ImVec4(0.06, 0.05, 0.07, 1.00)
       colors[clr.CloseButton] = ImVec4(0.40, 0.39, 0.38, 0.16)
       colors[clr.CloseButtonHovered] = ImVec4(0.40, 0.39, 0.38, 0.39)
       colors[clr.CloseButtonActive] = ImVec4(0.40, 0.39, 0.38, 1.00)
       colors[clr.PlotLines] = ImVec4(0.61, 0.61, 0.61, 1.00)
       colors[clr.PlotLinesHovered] = ImVec4(1.00, 0.43, 0.35, 1.00)
       colors[clr.PlotHistogram] = ImVec4(0.90, 0.70, 0.00, 1.00)
       colors[clr.PlotHistogramHovered] = ImVec4(1.00, 0.60, 0.00, 1.00)
       colors[clr.TextSelectedBg] = ImVec4(0.25, 1.00, 0.00, 0.43)
       colors[clr.ModalWindowDarkening] = ImVec4(1.00, 0.98, 0.95, 0.73)
 end
 apply_custom_style()

 changelog = {
    [0] = {
        ['date'] = '9.1.2021',
        ['ver'] = '1.1.0',
        ['info'] = {
            'Ïîëíîñòü äîðàáîòàííà ðàáîòà ñ ïðîöåíòàìè',
            'Äîáàâëåí ChangeLog (Äàííîå îêíî)'
        },
        ['patches'] = {
            ['show'] = false,
            ['info'] = {
                'Äîáàâëåíà ïðîâåðêà ïðîöåíòîâ',
            }
        }
    }

}
