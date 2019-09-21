MF_DrugSales = {}
local MFS = MF_DrugSales

MFS.Version = '1.0.13'

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end)

Citizen.CreateThread(function(...)
  while not ESX do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end)
    Citizen.Wait(0)
  end
end)

-- For the door.
MFS.ShowBlip = true
MFS.DrawTextDist = 10.0
MFS.NotificationTime = 5.0
MFS.RefreshPosTimer = 10.0 -- minutes

MFS.PoliceNotifyCountdown = 0.5 -- minutes from reaching dealer until police are notified.
MFS.NotifyPoliceTimer = 10
MFS.PoliceJobName = "police"
MFS.MinPoliceOnline = 1

MFS.MaxSellPerDealer = 50

-- The door.
MFS.HintLocations     =   {
  [1] = vector4(-1152.0,-1447.54,4.71, 36.74),
  [2] = vector4(85.83,-1959.58,21.12,224.34),
  [3] = vector4(896.35,-1036.33,35.11,180.00),
}

MFS.SalesLocations    =   {
  [1] = vector4(1372.69,3617.62,34.89,198.17),
  [2] = vector4(2318.79,2553.66,47.69,221.28),
  [3] = vector4(1510.11,6326.52,24.60,040.02),
  [4] = vector4(0033.86,3666.52,39.72,227.70),
}

MFS.TargetAverageSpeed = 60.0

MFS.DealerPed = 's_m_y_dealer_01'

MFS.DrugItems = {
  ['Meth'] = 'meth_pooch',
  ['Cocaine'] = 'coke_pooch',
  ['Weed'] = 'weed_pooch',
  ['Opium'] = 'opium_pooch'
}

MFS.DrugPrices = {
  ['meth_pooch'] = 100,
  ['coke_pooch'] = 150,
  ['weed_pooch'] = 50,
  ['opium_pooch'] = 250
}

MFS.MaxPriceVariance = 10.0 --%