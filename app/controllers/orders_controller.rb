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
    if @order.type = 2
      render 'orders/edit_proc'
    else
      render 'orders/edit_else'
    end
  end
  
  def update
    order = Order.find(params[:id])
    order.update_attributes(params[:order])
    if order.type = 1
      Story.create(subject: "#{order.style} decreed", body: "The Governor in Council, acting on the advice of #{order.member.main_role}, has decreed order #{order.style}.", category: 5)
    elsif order.type = 2
      Story.create(subject: "#{order.style} proclaimed", body: "The Governor in Council, acting on the advice of #{order.member.main_role}, has issued a proclamation pursuant to order #{order.style}, declaring #{order.bills.first.long_title} into effect on #{order.enacting_date.strftime("%B %d, %Y")}.", category: 5)
    end
    redirect_to order
  end
  
  def show
    @order = Order.find(params[:id])
  end

end
