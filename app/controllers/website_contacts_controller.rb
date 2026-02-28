class WebsiteContactsController < ApplicationController

    def index
      @website_contact = WebsiteContact.last
    end
  
    def new
      @website_contact = WebsiteContact.new
    end
  
    def create
      @website_contact = WebsiteContact.new(website_contact_params)
  
      if @website_contact.save
        redirect_to website_contacts_path, notice: "Contact created successfully"
      else
        render :new
      end
    end
  
    private
  
    def website_contact_params
      params.require(:website_contact).permit(
        :name,
        :contact_no,
        :whatsapp_no,
        :website_name,
        :website_image
      )
    end
  
  end