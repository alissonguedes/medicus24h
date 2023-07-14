@if ($paginate->total() > 0)

	@foreach ($paginate as $i => $row)
		<div class="email-brief-info collection-item animate fadeUp slower delay-{{ $i * 4 }}">
			<div class="list-left">
				<label>
					<input type="checkbox" name="id[]" class="filled-in" value="{{ $row->id }}" data-status="{{ $row->status }}">
					<span></span>
				</label>
				<div class="favorite">
					{{-- <i class="material-icons">star_border</i> --}}
					@if (isset($row->priority))
						@php
							$priority = $row->priority;
							$color = $row->priority_color;
						@endphp
					@endif
					<a data-tooltip="Prioridade {{ $priority ?? 'Baixa' }}">
						<i class="material-symbols-outlined" style="">flag</i>
					</a>
				</div>
				<div class="email-label">
					<i class="material-icons">label_outline</i>
				</div>
			</div>
			<div class="list-content" data-href="{{ route('core.tickets.edit', $row->number) }}">
				<div class="list-title-area">
					<div class="user-media">
						{{-- <img src="../../../app-assets/images/user/2.jpg" alt="" class="circle z-depth-2 responsive-img avtar"> --}}
						<div class="list-title">{{ $row->subject }}</div>
					</div>
					<div class="title-right">
						<span class="attach-file">
							<i class="material-icons">attach_file</i>
						</span>
						<span class="badge grey lighten-3">
							<i class="purple-text material-icons small-icons mr-2"> fiber_manual_record </i>
							Note
						</span>
					</div>
				</div>
				<div class="list-desc">
					Usuário: <b>Alisson Guedes</b> · Departamento: <b>{{ $row->department }}</b>
					{{-- {{ $row->lastupdate }}
					{{ $row->status }} --}}
				</div>
				{{-- <div class="list-desc">There are many variations of passages of Lorem Ipsum available, but the majority
					have suffered alteration in some form, by injected humour, or randomised words which don't look even
					slightly believable. If you are going to use a passage of Lorem Ipsum</div> --}}
			</div>
			<div class="list-right">
				<div class="list-date"> 2:03 PM </div>
			</div>
		</div>

	@endforeach
@else
	<div class="grid-row no-results">
		<div class="grid-col">
			Nenhum registro encontrado.
		</div>
	</div>

@endif
