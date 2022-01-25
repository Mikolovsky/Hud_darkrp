surface.CreateFont("health", {
    font = "Roboto",
    extended = true,
    size = 40,
    weight = 800,
    blursize = 0,
    scanlines = 0,
    antialias = true,
    underline = false,
    italic = false,
    strikeout = true,
    symbol = false,
    rotary = false,
    shadow = true,
    additive = false,
    outline = false,
})

surface.CreateFont("hud.ammo", {
    font = "Tahoma",
    extended = true,
    size = 30 / 1920 * ScrW(),
    weight = 100
})


surface.CreateFont("nick", {
    font = "Roboto",
    extended = true,
    size = 18,
    weight = 600,
    blursize = 0,
    scanlines = 0,
    antialias = true,
    underline = false,
    italic = false,
    strikeout = true,
    symbol = false,
    rotary = false,
    shadow = true,
    additive = false,
    outline = false,
})

surface.CreateFont("not", {
    font = "Roboto",
    extended = true,
    size = 27,
    weight = 600,
    blursize = 0,
    scanlines = 0,
    antialias = true,
    underline = false,
    italic = false,
    strikeout = true,
    symbol = false,
    rotary = false,
    shadow = true,
    additive = false,
    outline = false,
})

surface.CreateFont("money", {
    font = "Roboto",
    extended = true,
    size = 22,
    weight = 600,
    blursize = 0,
    scanlines = 0,
    antialias = true,
    underline = false,
    italic = false,
    strikeout = true,
    symbol = false,
    rotary = false,
    shadow = true,
    additive = false,
    outline = false,
})

local Elements = {
    ["CHudAmmo"] = true,
    ["CHudBattery"] = true,
    ["CHudHealth"] = true,
    ["CHudSecondaryAmmo"] = true,
    ["CHudSuitPower"] = true,
    ["CHudCrosshair"] = true,
}

local function hudHideElements(name)
    if Elements[name] then return false end
end

hook.Add("HUDShouldDraw", "hudHideElements", hudHideElements)

hook.Add("HUDPaint", "MiHUD", function()
    local x, y = 42, ScrH() - 78
    local Scrw, Scrh = ScrW(), ScrH()
    local hp = Material("vgui/health.png", "smooth mips")
    local armor = Material("vgui/armor.png", "smooth mips")
    local job = Material("vgui/job.png", "smooth mips")
    local money = Material("vgui/money.png", "smooth mips")
    local logo = Material("vgui/infinity.png", "smooth mips")
    local ammo = Material("vgui/ammo.png", "smooth mips")
    local Health = LocalPlayer():Health()

    if LocalPlayer():Alive() then
        if LocalPlayer():Health() > 100 then
            draw.RoundedBox(15 / 1920 * ScrW(), x + 1 / 1920 * ScrW(), y + 20 / 1920 * ScrW(), 130 / 1920 * ScrW(), 42 / 1920 * ScrW(), Color(0, 0, 0, 200))
            surface.SetMaterial(hp)
            surface.SetDrawColor(255, 255, 255)
            surface.DrawTexturedRect(x + 10 / 1920 * ScrH(), y + 20 / 1920 * ScrW(), 34, 40)
            draw.SimpleText(">100", "health", x + 50 / 1920 * ScrW(), y + 20 / 1920 * ScrW(), Color(255, 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
            draw.RoundedBox(25 / 1920 * ScrW(), x + 1 / 1920 * ScrW(), y + 20 / 1920 * ScrW(), 390 / 1920 * ScrW(), 420 / 1920 * ScrW(), Color(0, 0, 0, 0))
            surface.SetMaterial(logo)
            surface.SetDrawColor(0, 0, 0)
            surface.DrawTexturedRect(x + 3050 / 1920 * ScrH(), y - 970 / 1920 * ScrW(), 109, 110)
        else
            draw.RoundedBox(25 / 1920 * ScrW(), x + 1 / 1920 * ScrW(), y + 20 / 1920 * ScrW(), 390 / 1920 * ScrW(), 420 / 1920 * ScrW(), Color(0, 0, 0, 0))
            surface.SetMaterial(logo)
            surface.SetDrawColor(0, 0, 0)
            surface.DrawTexturedRect(x + 3050 / 1920 * ScrH(), y - 970 / 1920 * ScrW(), 109, 110)
            draw.RoundedBox(25 / 1920 * ScrW(), x + 1 / 1920 * ScrW(), y + 20 / 1920 * ScrW(), 130 / 1920 * ScrW(), 42 / 1920 * ScrW(), Color(0, 0, 0, 200))
            surface.SetMaterial(hp)
            surface.SetDrawColor(255, 255, 255)
            surface.DrawTexturedRect(x + 10 / 1920 * ScrH(), y + 20 / 1920 * ScrW(), 34, 40)
            draw.SimpleText(Health, "health", x + 50 / 1920 * ScrW(), y + 20 / 1920 * ScrW(), Color(255, 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
        end
    end

    if LocalPlayer():Alive() then
        draw.RoundedBox(25 / 1920 * ScrW(), x + 1 / 1920 * ScrW(), y - 80 / 1920 * ScrW(), 280 / 1920 * ScrW(), 42 / 1920 * ScrW(), Color(0, 0, 0, 200))
        surface.SetMaterial(job)
        surface.SetDrawColor(255, 255, 255)
        surface.DrawTexturedRect(x + 15 / 1920 * ScrH(), y - 80 / 1920 * ScrW(), 34, 40)
        draw.SimpleText(LocalPlayer():Nick() .. " / " .. LocalPlayer().DarkRPVars.job, "nick", x + 50 / 1920 * ScrW(), y - 70 / 1920 * ScrW(), Color(255, 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)

        if LocalPlayer():Alive() then
            draw.RoundedBox(25 / 1920 * ScrW(), x + 1 / 1920 * ScrW(), y - 30 / 1920 * ScrW(), 280 / 1920 * ScrW(), 42 / 1920 * ScrW(), Color(0, 0, 0, 200))
            surface.SetMaterial(money)
            surface.SetDrawColor(255, 255, 255)
            surface.DrawTexturedRect(x + 15 / 1920 * ScrH(), y - 30 / 1920 * ScrW(), 34, 40)
            draw.SimpleText(DarkRP.formatMoney(LocalPlayer().DarkRPVars.money), "money", x + 50 / 1920 * ScrW(), y - 20 / 1920 * ScrW(), Color(255, 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)

            if LocalPlayer():Alive() then
                if LocalPlayer():Armor() > 100 then
                    draw.RoundedBox(25 / 1920 * ScrW(), x + 150 / 1920 * ScrW(), y + 20 / 1920 * ScrW(), 130 / 1920 * ScrW(), 42 / 1920 * ScrW(), Color(0, 0, 0, 200))
                    surface.SetMaterial(armor)
                    surface.SetDrawColor(255, 255, 255)
                    surface.DrawTexturedRect(x + 280 / 1920 * ScrH(), y + 20 / 1920 * ScrW(), 34, 40)
                    draw.SimpleText(">100", "health", x + 120 / 1920 * ScrW(), y + 20 / 1920 * ScrW(), Color(255, 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
                else
                    draw.RoundedBox(25 / 1920 * ScrW(), x + 150 / 1920 * ScrW(), y + 20 / 1920 * ScrW(), 130 / 1920 * ScrW(), 42 / 1920 * ScrW(), Color(0, 0, 0, 200))
                    surface.SetMaterial(armor)
                    surface.SetDrawColor(255, 255, 255)
                    surface.DrawTexturedRect(x + 280 / 1920 * ScrH(), y + 20 / 1920 * ScrW(), 34, 40)
                    draw.SimpleText(LocalPlayer():Armor(), "health", x + 200 / 1920 * ScrW(), y + 20 / 1920 * ScrW(), Color(255, 255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
                end
            end
        end

        local notifies = {
            {
                color = Color(255, 61, 77),
                outline_color = Color(175, 42, 53),
                text = "Внимание! Сейчас идет комендантский час, пройдите домой!",
                canShow = function(ply) return GetGlobalBool("DarkRP_LockDown") end
            }
        }

        local disablefeed = true

        hook.Add("DrawDeathNotice", "DisableKills", function()
            if disablefeed then return 0, 0 end
        end)

        local x, y = 42 / 1920 * ScrW(), 289 / 1920 * ScrW()

        for k, v in pairs(notifies) do
            if (not v.canShow(ply)) then continue end
            draw.SimpleTextOutlined(v.text, "not", x + 16 / 1920 * ScrW(), y - 210 / 1920 * ScrW(), Color(355, 355, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER, 1 / 1920 * ScrW(), Color(30, 30, 0, 100))
            y = y + 32 / 1920 * ScrW()
        end

        local wep = LocalPlayer():GetActiveWeapon()
        local clip = LocalPlayer():GetActiveWeapon():Clip1()
        local reserve = LocalPlayer():GetAmmoCount(wep:GetPrimaryAmmoType())

        if LocalPlayer():Alive() then
            if IsValid(wep) and clip > 0 then
                local x1, y1 = draw.SimpleText(clip .. "/" .. reserve, "hud.ammo", ScrW() - 50 / 1920 * ScrW(), ScrH() - 39 / 1920 * ScrW(), Color(255, 255, 255), TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM)
                draw.SimpleText(clip .. "/" .. reserve, "hud.ammo", ScrW() - 50 / 1920 * ScrW(), ScrH() - 39 / 1920 * ScrW(), Color(255, 255, 255), TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM)
                draw.RoundedBox(25 / 1920 * ScrW(), x + 10 / 1920 * ScrW(), y + 50 / 1920 * ScrW(), 390 / 1920 * ScrW(), 420 / 1920 * ScrW(), Color(0, 0, 0, 0))
                surface.SetMaterial(ammo)
                surface.SetDrawColor(255, 255, 255)
                surface.DrawTexturedRect(x + 3000 / 1920 * ScrH(), y + 700 / 1920 * ScrW(), 57, 65)
            else
            end
        end
    end
end)