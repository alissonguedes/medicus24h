@extends('app')

@section('styles')
	@include('clinica.styles')
@endsection

@section('main')
	Acesso não autorizado! Atualize a página para voltar para a <a href="{{ route('main.home') }}" target="_self">página inicial</a>.
@endsection

@section('body')
	@yield('main')
@endsection
