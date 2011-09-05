class OrdersController < ApplicationController

  def new
    @order = Order.new
    @departments = current_member.departments.order('name')
  end
  
  def create
    @order = Order.new(type: params[:order][:type], department_id: params[:order][:department], member_id: current_member)
    @order.grant_style
    if @order.save
      redirect_to :action => 'edit', :id => @order.id
    end
  end
  
  def edit
    @order = Order.find(params[:id])
  end
  
  def update
    order = Order.find(params[:id])
    order.update_attributes(params[:order])
    redirect_to order
  end
  
  def show
    @order = Order.find(params[:id])
  end

end
