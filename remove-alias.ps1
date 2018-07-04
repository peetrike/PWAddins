# function: remove-alias - remove an alias from the shell
function remove-alias
{
  param ($AliasToRemove = $null)
  if ($AliasToRemove) 
  {
    if (test-path Alias:$AliasToRemove)
    {
      remove-item alias:$AliasToRemove
    }
    else
    {
      "Alias $AliasToRemove does not exist."
    }
  }
}