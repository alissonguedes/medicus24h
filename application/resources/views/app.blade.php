<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">

	@section('site-title', 'Médicus24h - Soluções em Saúde')
	<title>@yield('site-title')</title>

	@section('styles')
		@include('styles')
	@show

</head>

<body>

	<div class="progress">
		<div class="indeterminate blue accent-1"></div>
	</div>

	<div id="loading"></div>

	<div id="page">

		@yield('body')

		@section('scripts_defines')
			<meta name="csrf-token" content="{{ csrf_token() }}">
			<script>
				var BASE_URL = "{{ base_url() }}";
				var BASE_PATH = "{{ asset('/') }}";
				var SITE_URL = "{{ site_url() }}";
				var SITE_KEY = "{{ env('INVISIBLE_RECAPTCHA_SITEKEY') }}";
			</script>
		@show

	</div>

	<div class="row" style="position: fixed; z-index: 999999; top: 0;">
		<div class="col s4">
			<div id="alerts" class="modal">
				<div class="modal-content">
					<h5 class="title"></h5>
					<br>
					<p class="info"></p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn blue lighten-1 modal-close">Ok</button>
				</div>
			</div>
		</div>
	</div>

	@section('privacity')
		@if (!session()->exists('privacity'))
			<!-- Modal Structure -->
			<div id="privacidade" class="modal bottom-sheet">
				<div class="modal-content center-align">
					<h4>Utilização de Cookies</h4>
					<p>
						Este site não utiliza cookies para recolhimento de dados pessoais. Mas, pode utilizar alguns cookies para melhor experiência de navegação, tais como:
					<ul>
						<li>Configuração de idioma;</li>
						<li>Configuração de página;</li>
						<li>Configuração de usuário,</li>
						<li>entre outras.</li>
					</ul>
					</p>
				</div>
				<div class="modal-footer center-align">
					<button type="button" class="btn white black-text lighten-1 modal-close" id="rejected">Rejeitar</button>
					<button type="button" class="btn blue lighten-1" id="accepted">Aceitar</button>
				</div>
			</div>

			<style>
				.modal#privacidade {
					z-index: 99999999 !important;
					max-height: 60% !important;
					height: 60% !important;
				}

				.modal#privacidade~.modal-overlay {
					z-index: 99999998 !important;
				}
			</style>
		@endif
	@show

	@section('right-sidebar')
		<aside id="right-sidebar" class="sidenav rightside-navigation grey lighten-3">
			<a href="#" class="sidenav-close right black-text" style="position: fixed; top: 0px; right: 7px; z-index: 10">
				<span class="material-symbols-outlined">close</span>
			</a>
			<div id="right-sidebar-content"></div>
		</aside>
	@show

	@section('scripts')
		@include('scripts')
	@show

</body>

</html>
