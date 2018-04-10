require "./spec_helper"

describe WaitGroup do
  it "works" do
    wg = WaitGroup.new
    wg2 = WaitGroup.new
    counter = 0

    wg.add 2
    wg2.add

    spawn do
      sleep 1
      counter += 1
      wg.done
    end

    spawn do
      counter += 1
      wg.done
    end

    spawn do
      wg.wait
      counter += 1
      wg2.done
    end

    wg2.wait

    counter.should eq(3)
  end

  it "raises on negative counter" do
    wg = WaitGroup.new
    wg.add
    wg.done
    
    expect_raises(WaitGroup::NegativeCounterError) do
      wg.done
    end
  end
end
