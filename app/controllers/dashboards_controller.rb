class DashboardsController < InheritedResources::Base

  def index
    @bookings     = Booking.count
    @customers    = Customer.count


  end


end
