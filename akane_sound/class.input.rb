class Input
  attr_accessor :up, :down, :quit
  def initialize
    @up = 0
    @down = 0
    @quit = 0
    @accept = 0
    @toggle_shuffle = 0
    @toggle_repeat = 0
    @toggle_next = 0
    @toggle_mute = 0
    @vol_up = 0
    @vol_down = 0
    @stop = 0
    @next = 0
    @refresh = 0
  end

  def handle_event(event)
    case event
    when SDL2::Event::Quit
      @quit += 1
    when SDL2::Event::KeyDown
      if event.sym == SDL2::Key::ESCAPE
        @quit += 1
      else
        @quit = 0
      end
      if event.sym == SDL2::Key::RETURN
        @accept += 1
      else
        @accept = 0
      end
      if event.sym == SDL2::Key::SPACE
        @accept += 1
      else
        @accept = 0
      end
      if event.sym == SDL2::Key::J
        @down += 1
      else
        @down = 0
      end
      if event.sym == SDL2::Key::K
        @up += 1
        Util.p "up"
      else
        @up = 0
      end

      if event.sym == SDL2::Key::S
        if event.mod.bit?(SDL2::Key::Mod::SHIFT)
          @toggle_shuffle += 1        
          @stop = 0
        else
          @toggle_shuffle = 0        
          @stop =+ 1
        end
      else
        @toggle_shuffle = 0        
        @stop = 0        
      end

      if event.sym == SDL2::Key::N
        if event.mod.bit?(SDL2::Key::Mod::SHIFT)
          @toggle_next += 1        
          @next = 0
        else
          @toggle_next = 0        
          @next =+ 1
        end
      else
        @toggle_next = 0        
        @next = 0        
      end
      
      if event.sym == SDL2::Key::R
        if event.mod.bit?(SDL2::Key::Mod::SHIFT)
          @toggle_repeat += 1        
          @refresh = 0
        else
          @toggle_repeat = 0        
          @refresh =+ 1
        end
      else
        @toggle_repeat = 0        
        @refresh = 0        
      end

      if event.sym == SDL2::Key::PERIOD
        if event.mod.bit?(SDL2::Key::Mod::SHIFT)
          @vol_up += 1        
        else
          @vol_up = 0        
        end
      else
        @vol_up = 0        
      end

      if event.sym == SDL2::Key::COMMA
        if event.mod.bit?(SDL2::Key::Mod::SHIFT)
          @vol_down += 1        
          Util.p "vol down"
        else
          @vol_down = 0        
        end
      else
        @vol_down = 0        
      end

    end
  end
end
