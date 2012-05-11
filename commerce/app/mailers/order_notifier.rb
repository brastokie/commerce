
class OrderNotifier < ActionMailer::Base
  default from: 'Order <km.masemola@gmail.com>'


  def received(order)
    @order = order

    mail to: order.email, subject: 'E-commerce Store Order Confirmation'
  end


  def shipped(order)
    @order = order

    mail to: order.email, subject: 'E-commerce Store Order Shipped'
  end
end
