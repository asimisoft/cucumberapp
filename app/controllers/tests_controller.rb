class TestsController < ApplicationController
  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(params.require(:test).permit!)
    if @test.save
      redirect_to root_path, notice: 'Success'
    else
      render :new
    end
  end
end
