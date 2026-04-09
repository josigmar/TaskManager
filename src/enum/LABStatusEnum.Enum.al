namespace Laberit.TaskManager;

enum 50300 "LAB Status Enum"
{
    Extensible = true;
    
    value(0; NotAllocated)
    {
        Caption = 'Sin asignar';
    }
    value(1; Allocated)
    {
        Caption = 'Asignada';
    }
    value(2; InProgress)
    {
        Caption = 'En proceso';
    }
    value(3; Completed)
    {
        Caption = 'Completada';
    }
}