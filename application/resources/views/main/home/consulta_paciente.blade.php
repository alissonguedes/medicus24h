@extends('main.body')

@section('page-title', 'Contato')

@section('capa')
<div class="nav-background">
	<div class="capa animated fadeIn teal lighten-2"></div>
	<div class="nav-header">
		<h1>@yield('page-title')</h1>
	</div>
</div>
@endsection

@section('body')

<header>
	<nav class="nav-extended nav-fixed white">
		<div class="nav-wrapper container">
			<div class="menu-header">
				<a href="{{ route('main.home') }}" itemprop="url" class="brand-logo site-logo">
					<img src="{{ asset('img/site/logo/logo.png') }}" alt="" class="logo">
				</a>
			</div>
		</div>
	</nav>
</header>

<div class="container mt-8 pt-6 pb-6 center-align">

	<div class="row">

		@if(!session()->exists('message'))

			<div class="col s12 m12 l12">

				<div class="row">
					<div class="col s12 mb-3">
						<h3 class="mt-1">Consulta Situação</h3>
					</div>
				</div>

			</div>

			<div class="col s12 m12 l6 offset-l3">

				<form action="{{ route('main.cadastro.paciente') }}" method="post" enctype="multipart/form-data" novalidate="novalidate" autocomplete="off" data-autoinitialize="false">
					@csrf
					<div class="row">
						<div class="col s12">
							<div class="input-field bordered">
								<input type="text" name="matricula" placeholder="Número da carteira" autofocus>
								@if(session()->exists('errors'))
									<div class="error flex flex-center" style="font-size: 14px;">
										<i class="material-icons left">error</i>
										Informe o número da matrícula.
									</div>
								@endif
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col s12">
						</div>
					</div>
					<div class="row">
						<div class="col s12 mt-3">
							<button type="submit" class="btn right btn-large col s12 flex teal darken-1 waves-effect border-round" data-toggle="Salvar">
								<span class="mr-1">Consultar</span>
								<i class="material-icons">search</i>
							</button>
						</div>
					</div>
				</form>

			</div>

		@else

			<style>
				.alert {
					margin-top: 5px;
					padding: 20px;
					border-radius: 5px;
					text-align: center;
				}

				.alert.success {
					color: var(--green-darken-4);
					background-color: var(--green-lighten-1);
					border: 1px solid var(--green-lighten-2);
				}

				.alert.error {
					color: var(--red-darken-4);
					background-color: var(--red-lighten-5);
					border: 1px solid var(--red-lighten-4);
				}
			</style>

			@if(session()->get('message'))
				<div class="alert {{ session('status') ?? 'success' }}">
					<h3>{{ session()->get('title') }}</h3>
					<p>{{ session()->get('message') }}</p>
				</div>
			@endif

			<div class="row">
				<div class="col s12 mt-3">
					<a href="{{ go('main.cadastro.paciente') }}" class="btn btn-large waves-effect blue darken-2">Nova consulta</a>
				</div>
			</div>

		@endif

	</div>

</div>

@endsection
