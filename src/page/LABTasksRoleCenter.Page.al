namespace Laberit.TaskManager;

page 50305 "LAB Tasks Role Center"
{
    Caption = 'Aplicación de Tareas';
    PageType = RoleCenter;
    RefreshOnActivate = true;
    
    layout
    {
        area(RoleCenter)
        {
            part(Actividades;"LAB Task Activities")
            {
                ApplicationArea = All;
            }
        }        
    }
    
    actions
    {
        area(Sections)
        {
            group(Tasks)
            {
                Caption = 'Tareas';
                ToolTip = 'Accede al área para administrar las tareas.';
                Image = Setup;

                action(ShowTasksList)
                {
                    Caption = 'Lista de tareas';
                    ToolTip = 'Muestra la lista de tareas.';
                    RunObject = Page "LAB Task List";
                    ApplicationArea = All;
                }
            }

            group(Users)
            {
                Caption = 'Usuarios';
                ToolTip = 'Accede al área para administrar los usuarios de la aplicación.';
                Image = Setup;

                action(ShowUsersList)
                {
                    Caption = 'Lista de usuarios';
                    ToolTip = 'Muestra la lista de usuarios.';
                    RunObject = Page "LAB User List";
                    ApplicationArea = All;
                }
            }
        }
    }
}