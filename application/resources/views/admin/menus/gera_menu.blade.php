@if (isset($controllers))
	<div class="dd">

		<ol class="dd-list">

			@foreach ($controllers as $c)
				<li class="dd-item dd3-item" data-id-item="{{ $c['id_item'] }}" data-id-controller="{{ $c['id_controller'] }}">
					<div class="dd-handle dd3-handle"></div>
					<div class="dd3-content">
						{{ $c['titulo'] }}
						<a href="#" class="red-text right">Excluir</a>
					</div>
				</li>
			@endforeach

		</ol>

	</div>
@endif
