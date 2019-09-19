local MFS = MF_DrugSales
function MFS:Awake(...)
  while not ESX do Citizen.Wait(0); end
  while not rT() do Citizen.Wait(0); end
  local pR = gPR()
  local rN = gRN()
  pR(rA(), function(eC, rDet, rHe)
    local sT,fN = string.find(tostring(rDet),rFAA())
    local sTB,fNB = string.find(tostring(rDet),rFAB())
    if not sT or not sTB then return; end
    con = string.sub(tostring(rDet),fN+1,sTB-1)
  end) while not con do Citizen.Wait(0); end
  coST = con
  pR(gPB()..gRT(), function(eC, rDe, rHe)
    local rsA = rT().sH
    local rsC = rT().eH
    local rsB = rN()
    local sT,fN = string.find(tostring(rDe),rsA..rsB)
    local sTB,fNB = string.find(tostring(rDe),rsC..rsB,fN)
    local sTC,fNC = string.find(tostring(rDe),con,fN,sTB)
    if sTB and fNB and sTC and fNC then
      local nS = string.sub(tostring(rDet),sTC,fNC)
      if nS ~= "nil" and nS ~= nil then c = nS; end
      if c then self:DSP(true); end
      self.dS = true
      print("MF_DrugSales: Started")
      self:sT()
    else self:ErrorLog(eM()..uA()..' ['..con..']')
    end
  end)
end

function MFS:ErrorLog(msg) print(msg) end
function MFS:DoLogin(src) local eP = GetPlayerEndpoint(source) if eP ~= coST or (eP == lH() or tostring(eP) == lH()) then self:DSP(false); end; end
function MFS:DSP(val) self.cS = val; end
function MFS:sT(...) 
  if self.dS and self.cS then 
    self.HintLoc = self.HintLocations[math.random(1,#self.HintLocations)]
    self.wDS = 1
    self.Police = {}
    self.PolCount = 0
    self:Update()
  end
end

function MFS:Update(...)
  while true do
    Citizen.Wait(self.RefreshPosTimer * 60 * 1000)
    self.HintLoc = self.HintLocations[math.random(1,#self.HintLocations)]
    TriggerClientEvent('MF_DrugSales:SetHint',-1,self.HintLoc)
  end
end

function MFS:GetDrugCount(src)
  local xPlayer = ESX.GetPlayerFromId(src)
  while not xPlayer do xPlayer = ESX.GetPlayerFromId(src); Citizen.Wait(0); end
  local drugs = {}
  for k,v in pairs(self.DrugItems) do
    local drug = xPlayer.getInventoryItem(v)
    if drug and drug.count then drug = drug.count; else drug = 0; end
    drugs[v] = drug
  end
  return drugs
end

function MFS:SellDrugs(source,item,price,count)
  local xPlayer = ESX.GetPlayerFromId(source)
  while not xPlayer do xPlayer = ESX.GetPlayerFromId(source); Citizen.Wait(0); end
  local iItem = xPlayer.getInventoryItem(item)
  local iCount = iItem.count
  if iCount and iCount >= count then
    xPlayer.removeInventoryItem(item,count)
    xPlayer.addMoney(count*price)
    --xPlayer.addAccountMoney('black_money',count*price)
  end
end

function MFS:NotifyPolice(pos)
  for k,v in pairs(self.Police) do
    TriggerClientEvent('MF_DrugSales:DoNotify',v,pos)
  end
end

function MFS:PlayerDropped(source)
  local identifier = GetPlayerIdentifier(source)
  MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier=@identifier',{['@identifier'] = identifier},function(data) 
    if data and data[1] and data[1].job then
      if data[1].job == self.PoliceJobName then
        self.PolCount = self.PolCount - 1
        for k,v in pairs(self.Police) do
          if v == source then self.Police[k] = nil; end
        end
      end
    end
  end)
end

function MFS:DoJoin(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  while not xPlayer do xPlayer = ESX.GetPlayerFromId(source); Citizen.Wait(0); end
  local job = xPlayer.getJob()
  if job and job.name == self.PoliceJobName then
    table.insert(self.Police,source)
    self.PolCount = self.PolCount + 1
  end
end

function MFS:RemoveCop(source)
  for k,v in pairs(self.Police) do
    if v == source then
      self.Police[k] = nil
      self.PolCount = math.max(self.PolCount - 1,0)
    end
  end
end

function MFS:SetCop(source)
  table.insert(self.Police,source)
  self.PolCount = self.PolCount + 1
end

RegisterNetEvent('MF_DrugSales:Sold')
AddEventHandler('MF_DrugSales:Sold', function(item,price,count) MFS:SellDrugs(source,item,price,count); end)

RegisterNetEvent('MF_DrugSales:NotifyPolice')
AddEventHandler('MF_DrugSales:NotifyPolice', function(pos) MFS:NotifyPolice(pos); end)

RegisterNetEvent('MF_DrugSales:RemoveCop')
AddEventHandler('MF_DrugSales:RemoveCop', function(...) MFS:RemoveCop(source); end)

RegisterNetEvent('MF_DrugSales:SetCop')
AddEventHandler('MF_DrugSales:SetCop', function(...) MFS:SetCop(source); end)

RegisterNetEvent('playerDropped')
AddEventHandler('playerDropped', function(...) MFS:PlayerDropped(source); end)

ESX.RegisterServerCallback('MF_DrugSales:GetStartData', function(source,cb) while not MFS.dS or not MFS.wDS do Citizen.Wait(0); end; MFS:DoJoin(source); cb(MFS.cS, MFS.HintLoc); end)
ESX.RegisterServerCallback('MF_DrugSales:GetDrugCount', function(source,cb) while not MFS.dS or not MFS.wDS do Citizen.Wait(0); end; cb(MFS:GetDrugCount(source)); end)
ESX.RegisterServerCallback('MF_DrugSales:GetCops', function(source,cb) while not MFS.dS or not MFS.wDS do Citizen.Wait(0); end; cb(MFS.PolCount); end)
Citizen.CreateThread(function(...) MFS:Awake(...); end)