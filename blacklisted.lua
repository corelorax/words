repeat task.wait() until game:IsLoaded()

words = {
    ['gay'] = 'Bullying',
    ['lesbian'] = 'Bullying',
    ['retard'] = 'Bullying',
    ['noob'] = 'Bullying',
    ['clown'] = 'Bullying',
    ['get a life'] = 'Bullying',
    ['getalife'] = 'Bullying',
    ['no life'] = 'Bullying',
    ['nolife'] = 'Bullying',
    ['your mom'] = 'Bullying',
    ['ur mom'] = 'Bullying',
    ['mom'] = 'Bullying',
    ['your dad'] = 'Bullying',
    ['ur dad'] = 'Bullying',
    ['dad'] = 'Bullying',
    ['sure'] = 'Bullying',
    ['surely'] = 'Bullying',
    ['mad'] = 'Bullying',
    ['shut up'] = 'Bullying',
    ['nobody asked'] = 'Bullying',
    ['no one asked'] = 'Bullying',
    ['who cares'] = 'Bullying',
    ['upset'] = 'Bullying',
    ['bud'] = 'Bullying',
    ['buddy'] = 'Bullying',
    ['lol'] = 'Bullying',
    ['haha'] = 'Bullying',
    ['Imaoo'] = 'Bullying',
    ['wizard'] = 'Bullying',
    ['reports'] = 'Bullying',
    ['reported'] = 'Bullying',
    ['father'] = 'Bullying',
    ['fatherless'] = 'Bullying',
    ['mother'] = 'Bullying',
    ['motherless'] = 'Bullying',
    ['monkey'] = 'Bullying',
    ['gorilla'] = 'Bullying',
    ['dumb'] = 'Bullying',
    ['weird'] = 'Bullying',
    ['odd'] = 'Bullying',
    ['stupid'] = 'Bullying',
    ['idiot'] = 'Bullying',
    ['cringe'] = 'Bullying',
    ['skill issue'] = 'Bullying',
    ['parent'] = 'Bullying',
    ['kid'] = 'Bullying',
    ['ugly'] = 'Bullying',
    ['child'] = 'Bullying',
    ['trash'] = 'Bullying',
    ['garbage'] = 'Bullying',
    ['bozo'] = 'Bullying',
    ['kys'] = 'Bullying',
    ['die'] = 'Bullying',
    ['killyou'] = 'Bullying',
    ['loser'] = 'Bullying',
    ['asian'] = 'Bullying',
    ['black'] = 'Bullying',
    [' white '] = 'Bullying',
    ['ez l'] = 'Bullying',
    ['l ez'] = 'Bullying',
    ['l'] = 'Bullying',
    ['negro'] = 'Bullying',
    ['nivver'] = 'Bullying',
    ['negar'] = 'Bullying',
    ['bad'] = 'Bullying',
    ['worst'] = 'Bullying',
    ['fat'] = 'Bullying',
    ['obese'] = 'Bullying',
    ['hack'] = 'Scamming',
    ['hacker'] = 'Scamming',
    ['exploit'] = 'Scamming',
    ['cheat'] = 'Scamming',
    ['cheater'] = 'Scamming',
    ['8'] = 'Scamming',
    ['download'] = 'Offsite Links',
    ['youtube'] = 'Offsite Links',
    ['dizzy'] = 'Offsite Links',
    ['dis'] = 'Offsite Links',
}

if not game:GetService('ReplicatedStorage'):FindFirstChild('DefaultChatSystemChatEvents') or not game:GetService('ReplicatedStorage'):FindFirstChild('DefaultChatSystemChatEvents'):FindFirstChild('OnMessageDoneFiltering') then return end
DCSCE = game:GetService('ReplicatedStorage'):FindFirstChild('DefaultChatSystemChatEvents')

if setfflag then
	setfflag("AbuseReportScreenshotPercentage", 0)
	setfflag("DFFlagAbuseReportScreenshot", "False") 
end

if not autoreportcfg then
getgenv().autoreportcfg = {
    Webhook = '', 
    autoMessage = {
       enabled = true,
       Message = 'so sad you got autoreported :(',
    },
}
end

local players = game:GetService("Players")
local notifs = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()

function notify(title, text)
    notifs:MakeNotification({
        Name = title,
        Content = text,
        Time = 5
    });
end;


if syn then
   notify("Autoreport",'this DOESNT WORK ON SYNAPSE!')
   notify('Autoreport','3ds disabled ReportAbuse so yea')
   return
end

function handler(msg,speaker)
   for i,v in next, words do
      if string.match(string.lower(msg),i) then
         players:ReportAbuse(players[speaker],'Text Chat',v,'He is breaking roblox TOS')
         task.wait(1.5)
         players:ReportAbuse(players[speaker],'Text Chat',v,'He is breaking roblox TOS')
         if autoreportcfg.Webhook ~= nil and autoreportcfg.Webhook ~= '' and autoreportcfg.Webhook ~= ' ' then
         local data = 
         {
             ["embeds"] = {{
                 ["title"] = "**" .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name .. "**",
                 ["description"] = "Auto-reported a player",
                 ["type"] = "rich",
                 ["color"] = tonumber(0x00aff4),
                 ["url"] = "https://www.roblox.com/games/" .. game.PlaceId,
                 ["fields"] = {
                     {
                         ["name"] = "Name",
                         ["value"] = "[" .. players[speaker].Name .. "](https://www.roblox.com/users/" .. players[speaker].UserId .. ")",
                         ["inline"] = true
                     },
                     {
                         ["name"] = "Message",
                         ["value"] = msg,
                         ["inline"] = true
                     },
                     {
                        ["name"] = "Offensive Part",
                        ["value"] = i,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Reported For",
                        ["value"] = v,
                        ["inline"] = true
                    },
                 },
                 ["footer"] = {
                     ["text"] = "\nIf you think this is a mistake: stfu"
                 },
                 ["author"] = {
                     ["name"] = "Auto Report"
                 }
             }}
         }
     local newdata = (game:GetService("HttpService")):JSONEncode(data);
     local request = http_request or request or HttpPost or http.request or syn.request;
     local abcdef = {
         Url = autoreportcfg.Webhook,
         Body = newdata,
         Method = "POST",
         Headers = {
             ["content-type"] = "application/json"
         }
     };
     request(abcdef);
    else
        notify('Autoreport','Autoreported ' .. speaker .. ' | offensive part: ' .. i)
    end
    if DCSCE:FindFirstChild('SayMessageRequest') and autoreportcfg.autoMessage.enabled == true then
       DCSCE.SayMessageRequest:FireServer('/w ' .. speaker .. ' ' .. autoreportcfg.autoMessage.Message,'All')
    end
      end
   end
end

msg = DCSCE:FindFirstChild('OnMessageDoneFiltering')
msg.OnClientEvent:Connect(function(msgdata)
    if tostring(msgdata.FromSpeaker) ~= players.LocalPlayer.Name then
       handler(tostring(msgdata.Message),tostring(msgdata.FromSpeaker))
    end
end)
