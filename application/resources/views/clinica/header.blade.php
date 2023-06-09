@if (session()->has('userdata'))
	<header id="header" class="page-topbar">

		<div class="navbar navbar-fixed">

			<nav class="navbar-main navbar-color navbar-collapsible blue lighten-1">

				<div class="nav-wrapper">

					{{-- <div class="brand-sidebar" style="display: block !important">

						<a class="navbar-toggler btn-floating btn-flat transparent grey-text text-darken-1 waves-effect">
							<i class="material-icons">menu</i>
						</a>

						<h1 class="logo-wrapper">

							<div class="text-logo">
								<h5>Clinic</h5>
								<h2>Cloud</h2>
							</div>

						</h1>

					</div> --}}

					@section('header')
						<div class="page-title" style="display: inline-block;">
							<div class="flex flex-center">
							@section('back-button')
								<button class="btn btn-flat btn-floating btn-small waves-effect" data-href="@yield('prev-url')">
									<span class="material-icons">arrow_back</span>
								</button>
							@show
							<h5 class="title">
								@yield('title')
							</h5>
						</div>
					</div>
				@show

				@section('navbar-header')
					<ul class="navbar-list right">
						{{-- {? $idiomas = new App\Models\LanguageModel(); ?}
							@if ($idiomas->getIdioma()->count() > 0)
							<li class="dropdown-language">
								<a class="waves-effect waves-block waves-light translation-button" href="#" data-target="translation-dropdown">
									<span class="flag-icon flag-icon-{{ $_COOKIE['idioma'] ?? get_config('language') }}"></span>
						</a>
						<ul class="dropdown-content" id="translation-dropdown"  data-url-lang="{{ url('api/translate/' . ($_COOKIE['idioma'] ?? get_config('language'))) }}">
							@foreach ($idiomas->getIdioma() as $lang)
								@if ((isset($_COOKIE['idioma']) && $_COOKIE['idioma'] == $lang->sigla) || (!isset($_COOKIE['idioma']) && get_config('language') == $lang->sigla))
									{? $class = 'active'; ?}
								@else
									{? $class = null; ?}
								@endif
								<li class="dropdown-item {{ $class }}" >
									<button data-url="{{ url('api/translate/' . $lang->sigla) }}" id="{{ $lang->sigla }}" class="grey-text text-darken-1" data-language="{{ $lang->sigla }}">
										<i class="flag-icon flag-icon-{{ $lang->sigla }}"></i>
										{{ $lang->descricao }}
									</button>
								</li>
								<style>
									.flag-icon- {
											{
											%24lang-%3Esigla
										}
									}

										{
										background-image: url({{asset(%26%2339%3Bassets%2Fimages%2Ficons%2Flanguages%2F%26%2339%3B%20.%20%24lang-%3Esigla%20.%20%26%2339%3B.svg%26%2339%3B)
									}
									}

									);
									}
								</style>
							@endforeach
						</ul>
						</li>
						@endif --}}
						{{-- <li class="hide-on-med-and-down">
							<a class="waves-effect waves-block waves-light" href="javascript:void(0);" data-url="{{ route('tickets.notificacoes.index') }}" data-trigger="right-sidebar" data-target="notificacoes" data-tooltip="Notificações">
								<i class="material-symbols-outlined">notifications</i>
								<span class="badge">1</span>
							</a>
						</li> --}}
						<li>
							<a class="waves-effect waves-block waves-light dropdown-trigger" href="javascript:void(0);" data-target="notifications-dropdown" data-tooltip="Notificações" data-cover-trigger="true" data-align="right">
								<i class="material-icons">notifications_none
									<small class="notification-badge">5</small>
								</i>
							</a>
							<ul class="dropdown-content" id="notifications-dropdown">
								<li>
									<h6>
										NOTIFICAÇÕES
										<span class="new badge">5</span>
									</h6>
								</li>
								<li class="divider"></li>
								<li>
									<a class="black-text" href="#!">
										<span class="material-icons icon-bg-circle cyan small">add_shopping_cart</span>
										A new order has been placed!
									</a>
									<time class="media-meta grey-text darken-2" datetime="2015-06-12T20:50:48+08:00">2 hours ago</time>
								</li>
								<li>
									<a class="black-text" href="#!">
										<span class="material-icons icon-bg-circle red small">stars</span>
										Completed the task
									</a>
									<time class="media-meta grey-text darken-2" datetime="2015-06-12T20:50:48+08:00">3 days ago</time>
								</li>
								<li>
									<a class="black-text" href="#!">
										<span class="material-icons icon-bg-circle teal small">settings</span>
										Settings updated
									</a>
									<time class="media-meta grey-text darken-2" datetime="2015-06-12T20:50:48+08:00">4 days ago</time>
								</li>
								<li>
									<a class="black-text" href="#!">
										<span class="material-icons icon-bg-circle deep-orange small">today</span>
										Director meeting started
									</a>
									<time class="media-meta grey-text darken-2" datetime="2015-06-12T20:50:48+08:00">6 days ago</time>
								</li>
								<li>
									<a class="black-text" href="#!">
										<span class="material-icons icon-bg-circle amber small">trending_up</span>
										Generate monthly report
									</a>
									<time class="media-meta grey-text darken-2" datetime="2015-06-12T20:50:48+08:00">1 week ago</time>
								</li>
							</ul>
						</li>
						<li class="hide-on-med-and-down">
							<a class="waves-effect waves-block waves-light" href="javascript:void(0);" data-url="{{ route('clinica.recursosmedicos.agenda.calendario') }}" data-trigger="right-sidebar" data-target="agenda_medica" data-tooltip="Calendário" data-function="calendar_mini">
								<i class="material-symbols-outlined">calendar_month</i>
							</a>
						</li>
						<li class="hide-on-med-and-down">
							<a class="waves-effect waves-block waves-light toggle-fullscreen" href="javascript:void(0);">
								<i class="material-icons">settings_overscan</i>
							</a>
						</li>
						<li class="hide-on-large-only search-input-wrapper">
							<a class="waves-effect waves-block waves-light search-button" href="javascript:void(0);">
								<i class="material-icons">search</i>
							</a>
						</li>
						<li>
							<a href="javascript:void(0);" class="waves-effect waves-block waves-light dropdown-trigger" data-cover-trigger="true" data-align="right" data-target="profile-dropdown">
								<span class="avatar-status avatar-online">
									<img src="{{ asset('img/avatar/icon.png') }}" alt="avatar">
									<i></i>
								</span>
							</a>
							<ul class="dropdown-content" id="profile-dropdown">
								<li id="user-profile">
									<a href="#" class="black-text">
										<i class="material-icons">person_outline</i>
										<span class="nome">{{ session()->get('userdata')[session()->get('app_session')]['nome'] }}</span>
										<span class="funcao">Perfil: {{ session()->get('userdata')[session()->get('app_session')]['grupo'] }}</span>
									</a>
								</li>
								{{-- <li >
									<a class="grey-text text-darken-1" href="user-profile-page.html">
										<i class="material-icons">person_outline</i>
										Profile
									</a>
								</li> --}}
								{{-- <li >
										<a class="grey-text text-darken-1" href="app-chat.html">
											<i class="material-icons">chat_bubble_outline</i>
											Chat</a>
									</li>
									<li >
										<a class="grey-text text-darken-1" href="page-faq.html">
											<i class="material-icons">help_outline</i>
											Help
										</a>
									</li>
									<li class="divider" ></li>
									<li >
										<a class="grey-text text-darken-1" href="user-lock-screen.html"><i class="material-icons">lock_outline</i>
											Lock
										</a>
									</li> --}}
								<li>
									<a href="{{ go('account.auth.logout') }}" class="grey-text text-darken-1">
										<i class="material-icons">logout</i>
										Logout
									</a>
								</li>
							</ul>
						</li>
						{{-- <li>
								<a class="waves-effect waves-block waves-light sidenav-trigger" href="#" data-target="slide-out-right">
									<i class="material-icons">format_indent_increase</i>
								</a>
							</li> --}}
					</ul>
				@show

			</div>

		</nav>

	</div>

</header>
@endif
