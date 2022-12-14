{extends file='main.tpl'}

{block name=content}

<div class="panel-body">
	<h3 class="thin text-center">Register</h3>
	<p class="text-center text-muted">Register to enjoy functionalities of our platform.</p>
	<hr>

	<form action="{$conf->action_url}registration" method="post">
		<div class="top-margin">
			<label>Login\Username <span class="text-danger">*</span></label>
			<input type="text" class="form-control" name="login">
		</div>
		<div class="top-margin">
			<label>Password <span class="text-danger">*</span></label>
			<input type="password" class="form-control" name="pass1">
		</div>
		<div class="top-margin">
			<label>Repeat password <span class="text-danger">*</span></label>
			<input type="password" class="form-control" name="pass2">
		</div>
		<div class="top-margin">
			<label>Email <span class="text-danger">*</span></label>
			<input type="text" class="form-control" name="email">
		</div>
		<div class="top-margin">
			<label>Contact number </label>
			<input type="text" class="form-control" name="number">
		</div>
		<hr>

		<div class="row">
			<p style="color: rgb(255,0,0)">If you forgot your credentials, contact with us.</p>
			<div class="col-lg-4 text-right">
				<button class="btn btn-action" type="submit">Register</button>
			</div>
		</div>
	</form>
</div>

{/block}