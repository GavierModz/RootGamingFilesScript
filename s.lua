--lib--
local memFrom, memTo, lib, num, lim, results, src, ok = 0, -1, nil, 0, 32, {}, nil, false  function fox(n) if lib ~= n then lib = n local ranges = gg.getRangesList(lib) if #ranges == 0 then else memFrom = ranges[1].start memTo = ranges[#ranges]["end"] end end end function hex2tbl(hex) local ret = {} hex:gsub("%S%S", function(ch) ret[#ret + 1] = ch return "" end)  return ret  end  function foxcra(orig)  local tbl = hex2tbl(orig) local len = #tbl if len == 0 then return end local used = len if len > lim then used = lim end local s = "" for i = 1, used do if i ~= 1 then s = s .. ";" end local v = tbl[i] if v == "??" or v == "**" then v = "0~~0" end s = s .. v .. "r" end s = s .. "::" .. used gg.searchNumber(s, gg.TYPE_BYTE, false, gg.SIGN_EQUAL, memFrom, memTo) if len > used then for i = used + 1, len do local v = tbl[i] if v == "??" or v == "**" then v = 256 else v = ("0x" .. v) + 0 if v > 127 then v = v - 256 end end tbl[i] = v end end local found = gg.getResultCount() results = {} local count = 0 local checked = 0 while not (found <= checked) do local all = gg.getResults(8) local total = #all local start = checked if total < checked + used then break end for i, v in ipairs(all) do v.address = v.address + foxcr end  gg.loadResults(all) while total > start do local good = true local offset = all[1 + start].address - 1 if len > used then local get = {} for i = lim + 1, len do get[i - lim] = { address = offset + i, flags = gg.TYPE_BYTE, value = 0 } end get = gg.getValues(get) for i = lim + 1, len do local ch = tbl[i] if ch ~= 256 and get[i - lim].value ~= ch then good = false break end end end if good then count = count + 1 results[count] = offset checked = checked + used else local del = {} for i = 1, used do del[i] = all[i + start] end gg.removeResults(del) end start = start + used end end end function foxcrack(repl) num = num + 1 local tbl = hex2tbl(repl) if src ~= nil then local source = hex2tbl(src) for i, v in ipairs(tbl) do if v ~= "??" and v ~= "**" and v == source[i] then tbl[i] = "**" end end src = nil end local cnt = #tbl local set = {} local s = 0 for _, addr in ipairs(results) do for i, v in ipairs(tbl) do if v ~= "??" and v ~= "**" then s = s + 1 set[s] = { address = addr + i, value = v .. "r", flags = gg.TYPE_BYTE } end end end if s ~= 0 then gg.setValues(set) end ok = true end function FoxCrack(a,b,c) gg.setRanges(0x4000) fox('lib'..a..'.so') foxcr=b foxcra("7F 45 4C 46 01 01 01 00") foxcrack(c) gg.clearResults() end
---menu 1--



function rtgmg()
  Menu = gg.choice({
    "(1) ঔৣ͜͡➳AIMFOV 180 [Partida]",
    "(2) ঔৣ͜͡➳ᴀɴтᴇɴᴀ cᴀʙᴇzᴀ [ʟoԍιɴ]",
    "(3) ঔৣ͜͡➳ᴀɴтᴇɴᴀ мᴀɴo [ʟoԍιɴ]",
    "(4) ঔৣ͜͡➳REGEDIT 100%[LOGIN]",
    "(5) ঔৣ͜͡➳SENSIBILIDAD",
    "✅sᴀʟιʀ ᴅᴇʟ scʀιᴘт ",
  },nil,(os.date(" ROOTGAMING 1.93.X | ➨ Online  ×  Successful ")))
  if Menu == nil then  end
  if Menu == 1 then Pc() end
  if Menu == 2 then MAS9() end
  if Menu == 3 then mano() end
  if Menu == 4 then regeditx2() end
  if Menu == 5 then sensi() end
  if Menu == 6 then LOBBY() end
  end

-----W--
function regeditx2()
  gg.setRanges(gg.REGION_C_ALLOC)
gg.searchNumber("h 62 6F 6E 65 5F 48 69 70 73", gg.TYPE_BYTE)
gg.getResults(2000)
gg.editAll("h 62 6F 6E 65 5F 4E 65 63 6B", gg.TYPE_BYTE)
gg.clearResults()
gg.toast(" 💡Hs Metadata⚙️️💡")
end

---------------------------------------------------------------------------------------------------------------------------------------
function Pc()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("1057048494;1054951342;1053273620", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1)
  gg.getResults(20000)
  gg.editAll("-20000", gg.TYPE_DWORD)
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("1120403456;1084227584;1075000115:9", gg.TYPE_DWORD, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.getResults(7)
  gg.editAll("-5", gg.TYPE_DWORD)
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("1.35000002384", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.getResults(1000)
  gg.editAll("100", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber("0.20000000298;1.68155816e-44;1", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
  gg.processResume()
  gg.refineNumber("0.20000000298", 16, false, 536870912, 0, -1, 0)
  gg.getResults(1000)
  gg.editAll("100", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("activado✅")
  gg.clearResults()
  gg.setVisible(false)
  end
  

---------------------------------------------------------------------------------------------------------------------------------------
function sensi()
  gg.setRanges(gg.REGION_CODE_APP)
  gg.searchNumber("300", gg.TYPE_FLOAT)
  gg.getResults(4)
  gg.editAll("250", gg.TYPE_FLOAT)
  gg.clearResults()
  gg.toast("activado✅")
  end
  
  
  -------------------------------------------------------------------------------------------------------------------------------------
  
  function MAS9()
  gg["setRanges"](gg["REGION_ANONYMOUS"])
      gg["searchNumber"]("0.487911999", gg["TYPE_FLOAT"])
      gg["getResults"](400)
      gg["editAll"]("-200", gg["TYPE_FLOAT"])
      gg["clearResults"]()
      gg["setRanges"](gg["REGION_ANONYMOUS"])
      gg["searchNumber"]("0.856113315", gg["TYPE_FLOAT"])
      gg["getResults"](400)
      gg["editAll"]("-250", gg["TYPE_FLOAT"])
      gg["clearResults"]()
      gg.toast("ᴀcтιvᴀᴅo ✅")
  end
  
  -------------------------------------------------------------------------------------------------------------------------------------
  
  function mano()
  gg.setRanges(gg.REGION_ANONYMOUS)
  gg.searchNumber(";῍보 㾀", gg.TYPE_WORD)
  gg.getResults(500)
  gg.editAll(";῍보 䎖", gg.TYPE_WORD)
  gg.clearResults()
  gg.searchNumber(";㐎㶹 㾀", gg.TYPE_WORD)
  gg.getResults(500)
  gg.editAll(";㐎㶹 䎖", gg.TYPE_WORD)
  gg.clearResults()
  gg.toast("ᴀcтιvᴀᴅo✅")
  end
  
  
  -----------------------------------------------------------------------------------------------------------------------------
    function speed()
    gg.setRanges(gg.REGION_ANONYMOUS)
      gg.searchNumber("2.80259693e-44F;1.20000004768F;0.18000000715F;1.40129846e-45F", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
      gg.refineNumber("1.20000004768", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1)
      gg.getResults(500, nil, nil, nil, nil, nil, nil, nil, nil)
      gg.editAll("1.780", gg.TYPE_FLOAT)
      gg.toast("activado ✅")
      gg.processResume()
      end
    --------------------------------------------------------------------------------------------------------------------------------------------
   function under()
          gg.setRanges(gg.REGION_CODE_APP)
          gg.searchNumber("0.0001", gg.TYPE_FLOAT, false, gg.SIGN_EQUAL, 0, -1, 0)
          gg.processResume()
          gg.getResults(30, nil, nil, nil, nil, nil, nil, nil, nil)
          gg.editAll("-2", gg.TYPE_FLOAT)
          gg.toast("activado✅")
          gg.processResume()
          end
          
   ------------------------------------------------------------ 
   function LOBBY()
   gg.toast('BYE MMG')
   os.exit() return end
   rtgmg()
   while(true)
   do
     while gg.isVisible(true)
       do
         gg.setVisible(false)
         rtgmg()
       end
   end
  -------------------------------------------------------------------------------------------------------------------------------------

-----W---
  rtgmg()
while(true)
do
while gg.isVisible(true)
do
  gg.setVisible(false)
  rtgmg()
end
end