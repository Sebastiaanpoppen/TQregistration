module AdminsHelper

  def create_admin
    if :super_admin
      link_to "CREATE ADMIN", new_admin_registration_path, class: "btn btn-create"
    end
  end

  def destroy_admin
    if :super_admin
      link_to "", admin_destroy_path, class: "glyphicon glyphicon-remove-circle"
    end
  end

  def super_admin
    if @admin.super_admin
      link_to "SUPER ADMIN", admin_superadmin_path, class: "btn btn-create"
    end
  end

  def show_admins
    if @admin.super_admin
      link_to "SHOW ADMINS", admin_manage_admins_path(@admin.id), class: "btn btn-create"
    end
  end
end
