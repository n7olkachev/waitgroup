class WaitGroup
  class NegativeCounterError < Exception
    def initialize(msg = "WaitGroup has negative counter")
      super(msg)
    end
  end

  @counter = 0
  @waiters = Deque(Fiber).new

  def add(num : Int32 = 1)
    @counter += num

    if @counter == 0
      Scheduler.enqueue @waiters
      @waiters.clear
    elsif @counter < 0
      raise NegativeCounterError.new
    end
  end

  def done
    add(-1)
  end

  def wait
    if @counter > 0
      @waiters << Fiber.current
      Scheduler.reschedule
    end
  end
end

