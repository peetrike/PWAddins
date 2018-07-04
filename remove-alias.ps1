# function: remove-alias - remove an alias from the shell
function remove-alias
{
  param ($Name = $null)
  if ($Name)
  {
    if (test-path Alias:$Name)
    {
      remove-item alias:$Name
    }
    else
    {
      write-warning -Message "Alias $Name does not exist."
    }
  }
}
