@extends('_layouts.body')

@section('main-menu-type', get_config('main-menu-type') == 'collapsed' ? 'main-full' : null)

@section('search', '')

@section('styles')
	@include('admin.styles')
@endsection

@section('body')

	<div class="horizontal-layout @yield('main-menu-type')">

		@include('clinica.header')
		@include('clinica.sidebar')

		<div id="main" class="@yield('main-menu-type')">

			<div id="telemedicina"></div>

			@yield('main')

		</div>

	</div>


	<aside id="right-sidebar" class="sidenav rightside-navigation grey lighten-3">

		<a href="#" class="sidenav-close right black-text" style="position: fixed; top: 0px; right: 7px; z-index: 10">
			<span class="material-symbols-outlined">close</span>
		</a>

		<div id="right-sidebar-content"></div>

	</aside>

@endsection
