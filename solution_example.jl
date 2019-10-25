function maximum_value(maximum_weight, items)
# Brute force approach. Tests all 2ⁿ combinations
    valBest = 0
    codeMax = 2^length(items) - 1
    for code = 0 : codeMax
        weight = 0
        value = 0
        rem = code
        itemNum = 1
        while rem > 0  # while rem > 0 && weight ≤ maximum_weight   not as fast?
            if rem % 2 == 1
                # take item
                weight += items[itemNum]["weight"]
                value  += items[itemNum]["value"]
            end

            rem ÷= 2
            itemNum += 1
        end

        if weight ≤ maximum_weight  &&  value > valBest
            valBest = value
        end
    end

    return valBest
end 
