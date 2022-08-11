extra_modifiers["MOLES_SOULS_SOULS_AS_MANA"] = function(recursion_level, iteration)
    draw_action_eem(true, true)
end

function take_souls(amount) 
    return true
end

function draw_action_eem(instant_reload_if_empty, use_souls)
    local action = nil
    state_cards_drawn = state_cards_drawn + 1
    if reflecting then return end
    if (#deck <= 0) then
        if instant_reload_if_empty then
            move_discarded_to_deck()
            order_deck()
            start_reload = true
        else
            reloading = true
            return true
        end
    end

    if #deck > 0 then
        action = deck[1]
        table.remove(deck, 1)
        if action.uses_remaining == 0 then
            table.insert(discarded, action)
            return false
        end

        local action_mana_required = action.mana
        if action.mana == nil then
            action_mana_required = ACTION_MANA_DRAIN_DEFAULT
        end

        if action_mana_required > mana and use_souls == false then
            OnNotEnoughManaForAction()
            table.insert(discarded, action)
            return false
        else
            if use_souls == true then
                local required = math.max(0.1, (action_mana_required / 10))
                if (take_souls(required) == false) then
                    OnNotEnoughManaForAction()
                    table.insert(discarded, action)
                    return false
                end
            else
                mana = mana - action_mana_required
            end
        end

    end

    if action ~= nil then
        play_action(action)
    end

    return true
end
