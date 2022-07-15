class ApplicationController < ActionController::Base

    def current_order
        if current_user
            # order = Order.where(user_id: current_user.id).where(state: 0).first
            order = Order.find_by(user_id: current_user, state: 0)
            if order.nil?
                order = Order.create(user: current_user, state: 0)
            end

            return order
        end

        nil
    end
end
