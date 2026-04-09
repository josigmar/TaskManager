namespace Laberit.TaskManager;

page 50302 "LAB Task List"
{
    Caption = 'Tareas';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "LAB Tasks Table";
    RefreshOnActivate = true;
    CardPageId = "LAB Task Card";
    Editable = true;
    
    layout
    {
        area(Content)
        {
            repeater(Tareas)
            {
                field("No."; Rec."No.")
                {
                    Editable = false;
                }
                field(Name; Rec.Name)
                {
                    Editable = false;
                }
                field("Duration"; Rec.Duration) { }
                field(Ending; Rec.Ending)
                {
                    Editable = false;
                }
                field("Total Assig.Users"; Rec."Total Assig.Users")
                {
                    Editable = false;
                }
                field(Status; Rec.Status) { }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(MarkAsCompleted)
            {
                Caption = 'Completar tarea';
                ToolTip = 'Cambia el estado de la tarea a completada.';
                Image = Check;

                trigger OnAction()
                var
                    TaskMgmtCodeunit: Codeunit "LAB Task Management";
                begin
                    TaskMgmtCodeunit.MarkTaskAsCompleted(Rec);
                end;
            }
        }  

        area(Promoted)
        {
            actionref(MarkAsCompleted_Promoted; MarkAsCompleted) {}
        }      
    }
}