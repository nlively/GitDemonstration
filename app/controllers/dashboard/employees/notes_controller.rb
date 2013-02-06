module Dashboard::Employees
  class NotesController < Dashboard::EmployeesController

    def index
      @page_title = @employee.full_name + ' - Notes'

      @notes = @employee.notes.order('created_at desc')
      @photos = @employee.photos.order('created_at desc')
    end

    def show
      @note = Note.where('id = ? and user_id = ?', params[:note_id], params[:id]).first
    end

  end
end
