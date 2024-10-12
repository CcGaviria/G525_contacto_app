class ContactsController < ApplicationController
  before_action :set_contact, only: %i[ show edit update destroy ]

  # GET /contacts or /contacts.json
  def index
    @contacts = Contact.all
    @totals_by_city = Contact.group(:city).count
  end

  def index_json
    @contacts = Contact.all
    render json: @contacts
  end

  def export_pdf
    @contacts = Contact.all.group_by(&:city)

    respond_to do |format|
      format.pdf do
        pdf = Prawn::Document.new(page_size: 'TABLOID', page_layout: :landscape)

        pdf.text "Solicitudes de Contacto por Ciudad", size: 30, style: :bold
        pdf.move_down 20

        @contacts.each do |city, contacts|
          pdf.text "Ciudad: #{city}", size: 20, style: :bold
          pdf.move_down 10

          table_data = contact_data(contacts)
          pdf.table(table_data, header: true, width: pdf.bounds.width, cell_style: { inline_format: true }) do
            row(0).font_style = :bold
            row(0).background_color = 'cccccc'  # Cambia el color de fondo del encabezado si lo deseas
          end

          pdf.move_down 20  # Espacio entre tablas
        end

        send_data pdf.render, filename: "contactos.pdf", type: "application/pdf", disposition: "attachment"
      end
      format.html do
        redirect_to contacts_path, alert: 'Formato no soportado. Solo PDF disponible.'
      end
    end
  end

  # GET /contacts/1 or /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts or /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @contact, notice: "Contact was successfully created." }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1 or /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: "Contact was successfully updated." }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1 or /contacts/1.json
  def destroy
    @contact.destroy!

    respond_to do |format|
      format.html { redirect_to contacts_path, status: :see_other, notice: "Contact was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(:sex, :birth_date, :first_name, :last_name, :email, :address, :address_details, :country, :department, :city, :information)
    end

    def contact_data(contacts)
      [["Sexo", "Fecha de Nacimiento", "Nombre", "Apellido", "Email", "Dirección", "País", "Departamento", "Información"]] +
      contacts.map do |contact|
        [
          contact.sex,
          contact.birth_date.strftime("%d/%m/%Y"),  # Asegúrate de formatear la fecha
          contact.first_name,
          contact.last_name,
          contact.email,
          contact.address,
          contact.country,
          contact.department,
          contact.information
        ]
      end
    end
end
