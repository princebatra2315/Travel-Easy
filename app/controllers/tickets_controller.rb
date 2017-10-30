class TicketsController < ApplicationController

	def create

     @ticket = Ticket.create(ticket_params)

     if @ticket.save
       journeydate=@ticket.journeydate
       price=@ticket.price
       origin=@ticket.origin
       destination=@ticket.destination
       @microposts=Micropost.where('startdate<=?', journeydate ).where( 'enddate>=?', journeydate ).where( 'budget>=?',price ).where( 'destination = ?',destination).where('origin = ?',origin)
       @microposts.each do |micropost|
         SampleMailer.sample_mail(micropost.user).deliver
       end

       flash[:success] = @microposts.length
      # flash[:success] = "ticket created!"
      redirect_to ticket_url
    else
      render 'static_pages/adminhome'
    end
	end

   def new
   	@ticket=Ticket.new
   end

   def index
   	@ticket=ticket.all
    end
    
	private

	 def ticket_params
       params.require(:ticket).permit(:origin, :destination, :price, :journeydate )
          end
end
