function Get-Accelerator {
    [psobject].Assembly.GetType("System.Management.Automation.TypeAccelerators")::Get
}
