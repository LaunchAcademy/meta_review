class HandlerController < ApplicationController
  def index
    binding.pry
    message = params[:message]
    customId = params[:customid]
    id = params[:id]
    filename = params[:filename]
    format = params[:format]

    grabzItClient = GrabzIt::Client.new("NDMxNGIxNThkZTUyNGU2ZThlOGFhYTExNDEzYzAzNGY=", "Pz9uaz8/cgUkOT8EPz8/WD8/Pz86P1c/VT8/MDY/Pz8=")
    result = grabzItClient.get_result(id)

    if result == nil
            return
    end
    binding.pry
    # Ensure that the application has the correct rights for this directory.
    screenshot = File.new("public/screenshots/"+filename, "wb")
    screenshot.write(result)
    screenshot.close
    binding.pry
  end
end
