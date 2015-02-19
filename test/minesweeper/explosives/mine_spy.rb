module Minesweeper
    module Explosives
        class MineSpy
            attr_reader :trigger_called

            def trigger
                @trigger_called = true
            end
        end
    end
end
