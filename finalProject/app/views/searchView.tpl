{extends file='main.tpl'}

{block name=content}

<h3 class="thin text-center">Vinyls overwiev</h3>
<hr>

<form action="{$conf->action_url}processFiltering" method="post">
    {include file='searchBar.tpl'}
</form>

<div class="myContainer">
    <div class="myTable">
        <div class="myTable-header">
            {if \core\RoleUtils::inRole('admin')}
                <div class="header__item"><label>idVinyl</label></div>
            {/if}

            <div class="header__item"><label>Author</label></div>
            <div class="header__item"><label>Name</label></div>
            <div class="header__item"><label>Year</label></div>
            <div class="header__item"><label>Genre</label></div>

            {if \core\RoleUtils::inRole('admin')}
                <div class="header__item"><label>idRental</label></div>
                <form action="{$conf->action_url}addVinylShow" method="post">
                    <div class="header__item"><button class="btn btn-action" type="submit">+ New</button></div>
                </form>
            {/if}
            {if \core\RoleUtils::inRole('user')}
                <div class="header__item"><label>Status</label></div>
            {/if}
        </div>
        <div class="myTable-content">
            {if !empty($data)}
                {foreach $data as $vinyl}
                    <div class="myTable-row">
                        {foreach $vinyl as $param}
                            {if \core\RoleUtils::inRole('user') and (strcmp($param, $vinyl['idRental']) == 0)}
                            {else}
                                {if !empty($param)}
                                    <div class="myTable-data"><label>{$param}</label></div>
                                {else}
                                    <div class="myTable-data"><label>-</label></div>
                                {/if}
                            {/if}
                        {/foreach}

                        {if \core\RoleUtils::inRole('admin')}
                            {if !empty($vinyl['idRental'])}
                                <div div class="myTable-data">
                                    <form action="{$conf->action_url}returned" method="post">
                                        <button class="btn btn-action" name="buttonValue" type="submit"
                                            value={$vinyl['idRental']}>Returned</button>
                                    </form>
                                </div>
                            {else}
                                <div div class="myTable-data">
                                    <form action="{$conf->action_url}deleteVinyl" method="post">
                                        <button class="btn btn-action" name="buttonValue" type="submit"
                                            value={$vinyl['idVinyl']}>Delete</button>
                                    </form>
                                </div>
                            {/if}
                        {/if}
                        {if \core\RoleUtils::inRole('user')}
                            {if empty($vinyl['idRental'])}
                                <div div class="myTable-data">
                                    <form action="{$conf->action_url}processBooking" method="post">
                                        <button class="btn btn-action" name="buttonValue" type="submit"
                                            value={$vinyl['idRental']}>Book</button>
                                    </form>
                                </div>
                            {else}
                                <div class="myTable-data"><label>Already booked.</label></div>
                            {/if}
                        {/if}
                    </div>
                {/foreach}
            {else}
                <div class="myTable-data" style="padding: 10px"><label>No data to display.</label></div>
            {/if}
        </div>
    </div>
</div>

<hr>

{/block}