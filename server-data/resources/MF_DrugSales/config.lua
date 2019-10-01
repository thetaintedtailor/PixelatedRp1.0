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
MFS.ShowBlip = false
MFS.DrawTextDist = 1.5
MFS.NotificationTime = 5.0
MFS.RefreshPosTimer = 120.0 -- minutes

MFS.PoliceNotifyCountdown = 0.5 -- minutes from reaching dealer until police are notified.
MFS.NotifyPoliceTimer = 60
MFS.PoliceJobName = "police"
MFS.MinPoliceOnline = 1
MFS.CallCopsDistance = 30
MFS.CallCopsPercent = 80

MFS.MaxSellPerDealer = 50

-- The door.
MFS.HintLocations     =   {
  [1] = vector4(1269.05, -1711.31, 54.77, 212.02),
}

MFS.SalesLocations    =   {
  [1] = vector4(1372.69, 3617.62, 34.89, 198.17),
  [2] = vector4(2318.79, 2553.66, 47.69, 221.28),
  [3] = vector4(1510.11, 6326.52, 24.60, 40.02),
  [4] = vector4(33.86, 3666.52, 39.72, 227.70),
  [5] = vector4(-148.09, 953.48, 235.86, 310.94),
  [6] = vector4(-1934.68, 2063.44, 140.93, 259.45),
  [7] = vector4(-1128.86, 2698.00, 18.80, 131.00),
  [8] = vector4(402.53, 2635.20, 44.50, 23.48),
  [9] = vector4(1983.53, 3027.53, 47.06, 328.54),
  [10] = vector4(-333.37, 6302.94, 33.09, 44.97),
  [11] = vector4(-3109.67, 750.92, 24.70, 189.57),
  [12] = vector4(-619.78, 303.78, 82.25, 80.83),
  [13] = vector4(-700.24, -918.44, 19.01, 134.63),
  [14] = vector4(1537.27, 1702.63, 109.67, 81.27),
  [15] = vector4(-220.13, 5.55, 52.37, 90.09),
  [16] = vector4(-1115.48, -1576.76, 4.54, 33.25),
  [17] = vector4(34.43, 243.87, 107.95, 240.07),
  [18] = vector4(-1062.95, 386.36, 68.90, 31.47),
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