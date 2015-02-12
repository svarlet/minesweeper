module Minesweeper
    module Map
        class MineSpy
            attr_reader :trigger_called

            def trigger
                @trigger_called = true
            end
        end
    end
end
