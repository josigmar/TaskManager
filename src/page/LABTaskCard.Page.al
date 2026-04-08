page 50303 "LAB Task Card"
{
    Caption = 'Tarea';
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "LAB Tasks Table";
    
    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    NotBlank = true;
                    ShowMandatory = true;
                }
                field(Name; Rec.Name) { }
                field("Duration"; Rec.Duration) { }
                field("Total Assig.Users"; Rec."Total Assig.Users") { }
                field(Status; Rec.Status) { }
                field(Ending; Rec.Ending) { }
            }

            part(Usuarios; "LAB Task List Part")
            {
                SubPageLink = "Task No." = field("No.");
                UpdatePropagation = Both;
            }
        }        
    }

    trigger OnAfterGetRecord()
    var
        ReminderNotification: Notification;
        Msg: Label '¡Atención! Ha vencido la fecha de finalización de esta tarea.';
        ActionMsg: Label 'Marcar como completada ahora';
        
    begin
        ReminderNotification.Id := 'CDEF7890-ABCD-0123-1234-567890ABCDEF';
        ReminderNotification.Recall();

        if (Rec.Ending <> 0DT) and (Rec.Status <> Rec.Status::Completed) then
            if Rec.Ending < CurrentDateTime() then begin
                ReminderNotification.Message(Msg);
                ReminderNotification.Scope := NotificationScope::LocalScope;
                ReminderNotification.AddAction(ActionMsg,  Codeunit::"LAB Task Management", 'MarkTaskAsCompletedFromNotification');
                ReminderNotification.SetData('TaskNo', Rec."No.");
                ReminderNotification.Send();
            end;
    end;
}