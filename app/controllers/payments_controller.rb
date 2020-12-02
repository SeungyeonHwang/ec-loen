class PaymentsController < ApplicationController
  def create
    order = Order.find(params[:order_id])

    if params[:details_id].present? && params[:resultFlg] == "000"

        order.update(
          name: params[:name],
          phone: params[:phone],
          email: params[:email],
          postal_code: params[:zipcode],
          address: params[:address1] + params[:adress2]
        )

        Payment.create(
          order: order,
          response: params[:response],
          payment_uid: params[:details_id],
          merchant_id: params[:merchant_id],
          payer_id: params[:payer_id],
          amount: params[:amount_value]
        )
        
        order.processing!

      elsif params[:resultFlg] == "001"
        order.before_payment!

      elsif params[:resultFlg] == "002"
        error_msg = params[:msg]
        order.order_failed!
      end

      redirect_to '/orders'

      # Ajax用のリダイレクト
      # respond_to do |format|
      #   format.js -> create.js.erb(payments直下)にデータを投げる
      # end
    end
end
