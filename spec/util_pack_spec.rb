require 'spec_helper'

using UtilPack

describe UtilPack do
  class Engine
    attr_accessor :ignition
    attr_accessor :temperature
  end

  class Car
    attr_accessor :engine

    delegate :ignition, :temperature, to: :engine
  end

  it 'should delegate methods' do
    engine = Engine.new
    engine.ignition = true
    engine.temperature = 50
    car = Car.new
    car.engine = engine

    expect(car.ignition).to eq(true)
    expect(car.temperature).to eq(50)
  end
end
