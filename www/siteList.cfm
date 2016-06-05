<cfoutput>
  <cfif structCount( siteConfigs ) >
    <cfloop array="#sortedConfigs#" index="configPath">
      <cfset siteConfig = siteConfigs[ configPath ]>
      <cfif siteConfig.error>
        <tr>
          <td colspan="2">
            <div class="alert alert-danger" role="alert">
              <strong>Oh snap!</strong> Something went wrong configuring this site (#configPath#). Here's the details:<br>
              <cfdump var="#siteConfig.errorStruct#" expand="no">
            </div>
          </td>
        </tr>
      <cfelse>
        <tr>
          <td>
            #siteConfig.name#
          </td>
          <td>
            <cfif arrayLen( siteConfig.hosts) >
              <cfloop array="#siteConfig.hosts#" index="domain">
                <a href="http://#domain#" target="_blank">#domain#</a><br>
              </cfloop>
            </cfif>
          </td>
        </tr>
      </cfif>
    </cfloop>
  <cfelse>
    <tr>
      <td colspan="2">
        <div class="alert alert-warning" role="alert">
          <strong>Warning:</strong> There are no sites configured. Make sure they are checked out in the same folder as the Vagrant repo
          and have a "VagrantConfig" folder with one or more YAML files.
        </div>
      </td>
    </tr>
  </cfif>
</cfoutput>
