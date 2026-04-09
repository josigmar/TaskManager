namespace Laberit.TaskManager;

codeunit 50300 "LAB Task Management"
{
    procedure MarkTaskAsCompleted(var TaskData: Record "LAB Tasks Table")
    begin
        TaskData.CalcFields("Total Assig.Users");
         
        if TaskData."Total Assig.Users" = 0 then
            Error('No se puede completar una tarea que no tiene usuarios asignados.');
        
        TaskData.Status := TaskData.Status::Completed;

        TaskData.Modify();

        if GuiAllowed then
            Message('La tarea %1 ha sido marcada como completada', TaskData.Name);       
    end;

    procedure MarkTaskAsCompletedFromNotification(ReminderNotification: Notification)
    var
        TaskData: Record "LAB Tasks Table";
    begin
        if TaskData.Get(ReminderNotification.GetData('TaskNo')) then
            MarkTaskAsCompleted(TaskData);       
    end;
}