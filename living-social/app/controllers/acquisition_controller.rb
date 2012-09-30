class AcquisitionController < ApplicationController

  def new
  end

  def create
    uploaded_io = params[:company]
    if uploaded_io
      @total = 0.0
      FCSV.new(uploaded_io.tempfile, {:headers => true, :col_sep => "\t"}).each do |row|
        i = Item.find_or_initialize_by_description(row.field("item description"),
                                                   :price => row.field("item price"))
        m = Merchant.find_or_initialize_by_name(row.field("merchant name"),
                                               :address => row.field("merchant address"))
        o = Order.create(:purchaser_name => row.field("purchaser name"),
                  :purchase_count => row.field("purchase count"),
                  :item => i,
                  :merchant => m)
        if o.errors.any?
          @errors = ["File upload failed on line: #{row}"]
          render :new
          return
        end

        @total += (o.purchase_count * i.price)
      end

      redirect_to :action => :revenue, :revenue => @total
    else
      @errors = ["Please provide a file"]
      render :new
    end
  end

  def revenue
  end

end
