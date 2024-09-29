class ContactNonprofitsController < ApplicationController
  def new
    @nonprofits = Nonprofit.where(id: params[:ids])
  end

  def create
    # Do something with the data, e.g., register the request, send emails, etc.

    redirect_to search_path,
      notice: "An email has been sent to the selected nonprofits. "\
        "You will get the copy of all the messages to the provided email address."
  end
end
