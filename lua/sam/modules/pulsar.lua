Lyth_Pulsar = Lyth_Pulsar or {}
Lyth_Pulsar.DB = Lyth_Pulsar.DB  or {}
Lyth_Pulsar.Lang = Lyth_Pulsar.Lang or {}
local lang = Lyth_Pulsar.Lang

if SAM_LOADED then return end

sam.command.set_category("Pulsar")

sam.command.new("givecredits")
  :SetPermission("givecredits", "superadmin")
  :SetCategory("Pulsar")
  :Help("Give credits to a player")

  :AddArg("player", {
    hint = "Player to give credits to",
    single_target = true,
    allow_higher_target = true,
  })

  :AddArg("number", {
    hint = "Number of credits to give",
    round = true
  })

  :OnExecute(function(calling_ply, player, number)
    if SERVER then
      Lyth_Pulsar.GiveCredits(calling_ply, player, number)
    end
    sam.player.send_message(nil, "{A} gave {T} {V} Credits", {
        A = calling_ply, T = player, V = number
    })
  end)
:End()

sam.command.new("removecredits")
  :SetPermission("removecredits", "superadmin")
  :SetCategory("Pulsar")
  :Help("Remove credits from a player")

  :AddArg("player", {
    hint = "Player to remove credits from",
    single_target = true,
    allow_higher_target = true,
  })

  :AddArg("number", {
    hint = "Number of credits to remove",
    round = true
  })

  :OnExecute(function(calling_ply, player, number)
    if SERVER then
      Lyth_Pulsar.RemoveCredits(calling_ply, player, number)
    end
    sam.player.send_message(nil, "{A} removed {V} credits from {T}", {
        A = calling_ply, T = player, V = number
    })
  end)
:End()

sam.command.new("setcredits")
  :SetPermission("setcredits", "superadmin")
  :SetCategory("Pulsar")
  :Help("Sets a players credits")

  :AddArg("player", {
    hint = "Player to set credits",
    single_target = true,
    allow_higher_target = true,
  })

  :AddArg("number", {
    hint = "Number of credits to set",
    round = true
  })

  :OnExecute(function(calling_ply, player, number)
    if SERVER then
      Lyth_Pulsar.SetCredits(calling_ply, player, number)
    end
    sam.player.send_message(nil, "{A} set {T} Credits to {V}", {
        A = calling_ply, T = player, V = number
    })
  end)
:End()