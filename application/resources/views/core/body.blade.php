@extends('app')

@section('styles')
	@include('core.styles')
@endsection

@section('body')

	@include('core.header')
	{{-- @include('core.sidebar') --}}

	<div id="main" class="no-padding">

		<div class="container">

			<div class="row">

				<div class="col s12">

					<div id="telemedicina"></div>

					@yield('main')

				</div>

			</div>

		</div>

	</div>

@endsection
