{assign var=inRoleAdmin value=\core\RoleUtils::inRole('admin') nocache}
{assign var=inRoleUser value=\core\RoleUtils::inRole('user') nocache}

<div class="navbar-collapse collapse">
	<ul class="nav navbar-nav pull-right">    
        <li class="active"><a href="#">Top page</a></li>
        <li class="active"><a href="{$conf->action_url}homeShow">Home</a></li>

        {if !$inRoleAdmin}
            <li class="active"><a href="{$conf->action_url}searchShow">Search...</a></li>
        {/if}

        {if $inRoleUser or $inRoleAdmin}
            {if $inRoleAdmin}
                <li class="active"><a href="{$conf->action_url}manageAccountsShow">Manage users</a></li>
                <li class="active"><a href="{$conf->action_url}manageProductsShow">Manage products</a></li>
            {else}
                <li class="active"><a href="{$conf->action_url}reservationsShow">Reservations</a></li>
                <li class="active"><a href="{$conf->action_url}accountShow">Account settings</a></li>
		    {/if}

            <li><a class="btn" href="{$conf->action_url}logout">LOG OUT</a></li>
        {else}
			<li class="active"><a href="{$conf->action_url}registrationShow">Register</a></li>
    		<li><a class="btn" href="{$conf->action_url}loginShow">LOG IN</a></li>
		{/if}		
	</ul>
</div>