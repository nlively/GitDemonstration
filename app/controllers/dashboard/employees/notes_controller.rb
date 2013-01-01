module Dashboard::Employees
  class NotesController < Dashboard::EmployeesController

    before_filter do
      @employee = User.find params[:id]
    end

    def index
      @notes = @employee.notes.order('created_at desc')
      @photos = @employee.photos.order('created_at desc')
    end

    def show
      @note = Note.where('id = ? and user_id = ?', params[:note_id], params[:id]).first
    end

  end
end
