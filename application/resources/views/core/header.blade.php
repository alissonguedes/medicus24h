<header>

	<div class="nav-fixed">

		<nav class="teal">

			<div class="nav-wrapper">

				@php
					$name = Route::currentRouteName();
					$current_route = $name;
				@endphp

				<a href="{{ route('core.index') }}" class="brand-logo ml-2">HelpDesk</a>

				<ul id="nav-mobile" class="navbar-list right hide-on-med-and-down">
					<li>
					<a href="{{ route('core.tickets.index') }}">Tickets</a></li>
					<li>
						@if ($current_route != 'core.tickets.add' && $current_route != 'core.tickets.edit')
							<a href="{{ route('core.tickets.add') }}">Novo Ticket</a>
						@else
							{{-- <a href="{{ route('core.tickets.index') }}">Cancelar</a> --}}
						@endif
					</li>
					<li>
						<a href="javascript:void(0);" class="waves-effect waves-block waves-light dropdown-trigger" data-cover-trigger="true" data-align="right" data-target="profile-dropdown">
							<span class="avatar-status avatar-online">
								<img src="{{ asset('img/avatar/icon.png') }}" alt="avatar">
								<i></i>
							</span>
						</a>
						<ul class="dropdown-content" id="profile-dropdown" data-edge="left">
							<li id="user-profile">
								<a href="#" class="black-text">
									<i class="material-icons">person_outline</i>
									<span class="nome">Alisson Guedes</span>
									<span class="funcao">Perfil: Super Administrador</span>
								</a>
							</li>
							<li>
								<a href="{{ route('account.auth.logout') }}" class="grey-text text-darken-1">
									<i class="material-icons">logout</i>
									Logout
								</a>
							</li>
						</ul>

					</li>
				</ul>

			</div>

		</nav>

		@php
			$breadcrumb = explode('/', request()->path());
			$url = '';
		@endphp

		<nav class="breadcrumb-container">
			<div class="breadcrumb-content">
				<a href="{{ route('core.index') }}" class="breadcrumb">
					<i class="material-icons">home</i>
				</a>
				@foreach ($breadcrumb as $ind => $b)
					@php
						$url .= '/' . $b;
						$limit = $current_route == 'core.tickets.edit' ? 2 : 1;
					@endphp
					@if ($ind < count($breadcrumb) - $limit)
						<a href="{{ url($url) }}" class="breadcrumb">{{ $b }}</a>
					@else
						<span class="breadcrumb grey-text lighten-3">{{ $b }}</span>
					@endif
				@endforeach
			</div>

			@if ($current_route != route('core.tickets.add'))
				<div class="input-field search no-margin">
					<label for="search_tickets">Pesquisar ticket</label>
					<input type="text" id="search_tickets" class="white no-margin border-radius">
				</div>
			@endif
		</nav>

	</div>

</header>
