repeat task.wait() until game:IsLoaded()

words = {
    ['gay'] = 'Bullying',
    ['lesbian'] = 'Bullying',
    ['retard'] = 'Bullying',
    ['moron'] = 'Bullying',
    ['fetus'] = 'Bullying',
    ['nerd'] = 'Bullying',
    ['dummy'] = 'Bullying',
    ['baby'] = 'Bullying',
    ['salty'] = 'Bullying',
    ['noob'] = 'Bullying',
    ['clown'] = 'Bullying',
    ['get a life'] = 'Bullying',
    ['getalife'] = 'Bullying',
    ['no life'] = 'Bullying',
    ['nolife'] = 'Bullying',
    ['mom'] = 'Bullying',
    ['dad'] = 'Bullying',
    ['surely'] = 'Bullying',
    ['mad'] = 'Bullying',
    ['shut up'] = 'Bullying',
    ['nobody asked'] = 'Bullying',
    ['no one asked'] = 'Bullying',
    ['who cares'] = 'Bullying',
    ['upset'] = 'Bullying',
    ['bud'] = 'Bullying',
    ['haha'] = 'Bullying',
    ['wizard'] = 'Bullying',
    ['report'] = 'Bullying',
    ['dumb'] = 'Bullying',
    ['weird'] = 'Bullying',
    ['odd'] = 'Bullying',
    ['stupid'] = 'Bullying',
    ['idiot'] = 'Bullying',
    ['cringe'] = 'Bullying',
    ['cry'] = 'Bullying',
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
    ['ez'] = 'Bullying',
    ['bad'] = 'Bullying',
    ['worst'] = 'Bullying',
    ['fat'] = 'Bullying',
    ['imagine'] = 'Bullying',
    ['hack'] = 'Scamming',
    ['hacker'] = 'Scamming',
    ['exploit'] = 'Scamming',
    ['cheat'] = 'Scamming',
    ['cheater'] = 'Scamming',
    ['codes'] = 'Scamming',
    ['download'] = 'Offsite Links',
    ['youtube'] = 'Offsite Links',
    ['dizzy'] = 'Offsite Links',
    ['dis'] = 'Offsite Links',
    ['monkey'] = 'Discrimination',
    ['gorilla'] = 'Discrimination',
    ['chimp'] = 'Discrimination',
    ['white'] = 'Discrimination',
    ['black'] = 'Discrimination',
    ['asian'] = 'Discrimination',
    ['negar'] = 'Discrimination',
    ['nivver'] = 'Discrimination',
    ['negro'] = 'Discrimination',
    ['banned'] = 'Harassment',
    ['obese'] = 'Harassment',
    ['weak'] = 'Harassment',
    ['toxic'] = 'Harassment',
    ['sucker'] = 'Harassment',
    ['abuse'] = 'Harassment',
    ['abusing'] = 'Harassment',
    ['insulting'] = 'Harassment',
    ['argue'] = 'Harassment',
    ['large'] = 'Adult Content',
    ['big'] = 'Adult Content',
    ['small'] = 'Adult Content',
    ['record'] = 'Adult Content',
    ['8'] = 'Adult Content',
    ['freaking'] = 'Adult Content',
    ['sister'] = 'Adult Content',
    ['hell'] = 'Profanity',
    ['heck'] = 'Profanity',
    ['wth'] = 'Profanity',
    ['what the freak'] = 'Profanity',
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
