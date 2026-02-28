class CreateWebsiteContacts < ActiveRecord::Migration[7.2]
  def change
    create_table :website_contacts do |t|
      t.string :name
      t.string :contact_no
      t.string :whatsapp_no
      t.string :website_name

      t.timestamps
    end
  end
end
