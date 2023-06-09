@extends('core.tickets.mail_layout')

@section('app-mail')
	<!-- Content Area Starts -->
	<div class="app-email">
		<div class="content-area content-right">
			<div class="app-wrapper">
				<div class="app-search">
					<i class="material-icons mr-2 search-icon">search</i>
					<input type="text" placeholder="Search Mail" class="app-filter" id="email_filter">
				</div>
				<div class="card card card-default scrollspy border-radius-6 fixed-width">
					<div class="card-content p-0 pb-2">
						<div class="email-header">
							<div class="left-icons">
								<span class="header-checkbox">
									<label>
										<input type="checkbox" name="check-all" class="filled-in">
										<span></span>
									</label>
								</span>
								<span class="action-icons">
									<i class="material-icons">refresh</i>
									<i class="material-icons">mail_outline</i>
									<i class="material-icons">label_outline</i>
									<i class="material-icons">folder_open</i>
									<i class="material-icons">info_outline</i>
									<i class="material-icons delete-mails">delete</i>
								</span>
							</div>
							<div class="list-content"></div>
							<div class="email-action">
								<span class="email-options"><i class="material-icons grey-text">more_vert</i></span>
							</div>
						</div>
						<div id="open" data-url="{{ route('core.tickets.status', 'open') }}" data-target="email-collection">
							<div class="collection email-collection">
								<div class="email-brief-info collection-item animate fadeUp delay-2">
									<div class="list-left">
										<label>
											<input type="checkbox" name="check-all" class="filled-in">
											<span></span>
										</label>
										<div class="favorite">
											<i class="material-icons">star_border</i>
										</div>
										<div class="email-label">
											<i class="material-icons">label_outline</i>
										</div>
									</div>
									<a class="list-content" href="{{ route('core.tickets.edit', 2) }}">
										<div class="list-title-area">
											<div class="user-media">
												<img src="../../../app-assets/images/user/10.jpg" alt="" class="circle z-depth-2 responsive-img avtar">
												<div class="list-title">Pari Kalin</div>
											</div>
											<div class="title-right">
												<span class="attach-file">
													<i class="material-icons">attach_file</i>
												</span>
												<span class="badge grey lighten-3"><i class="amber-text material-icons small-icons mr-2">
														fiber_manual_record </i>Paypal</span>
											</div>
										</div>
										<div class="list-desc">There are many variations of passages of Lorem Ipsum available, but the majority
											have suffered alteration in some form, by injected humour, or randomised words which don't look even
											slightly believable. If you are going to use a passage of Lorem Ipsum</div>
									</a>
									<div class="list-right">
										<div class="list-date"> 12:47 PM </div>
									</div>
								</div>
								<div class="email-brief-info collection-item animate fadeUp delay-3">
									<div class="list-left">
										<label>
											<input type="checkbox" name="foo" />
											<span></span>
										</label>
										<div class="favorite">
											<i class="material-icons">star_border</i>
										</div>
										<div class="email-label">
											<i class="material-icons">label_outline</i>
										</div>
									</div>
									<a class="list-content" href="app-email-content.html">
										<div class="list-title-area">
											<div class="user-media">
												<img src="../../../app-assets/images/user/4.jpg" alt="" class="circle z-depth-2 responsive-img avtar">
												<div class="list-title">Alin Kystal</div>
											</div>
											<div class="title-right">
												<span class="attach-file">
													<i class="material-icons">attach_file</i>
												</span>
												<span class="badge grey lighten-3"><i class="purple-text material-icons small-icons mr-2">
														fiber_manual_record </i>Note</span>
											</div>
										</div>
										<div class="list-desc">There are many variations of passages of Lorem Ipsum available, but the majority
											have suffered alteration in some form, by injected humour, or randomised words which don't look even
											slightly believable. If you are going to use a passage of Lorem Ipsum</div>
									</a>
									<div class="list-right">
										<div class="list-date"> 8:18 AM </div>
									</div>
								</div>
								<div class="email-brief-info collection-item animate fadeUp delay-4">
									<div class="list-left">
										<label>
											<input type="checkbox" name="foo" />
											<span></span>
										</label>
										<div class="favorite">
											<i class="material-icons">star_border</i>
										</div>
										<div class="email-label">
											<i class="material-icons">label_outline</i>
										</div>
									</div>
									<a class="list-content" href="app-email-content.html">
										<div class="list-title-area">
											<div class="user-media">
												<img src="../../../app-assets/images/user/8.jpg" alt="" class="circle z-depth-2 responsive-img avtar">
												<div class="list-title">Amy berry</div>
											</div>
											<div class="title-right">
												<span class="attach-file">
													<i class="material-icons">attach_file</i>
												</span>
												<span class="badge grey lighten-3"><i class="light-green-text material-icons small-icons mr-2">
														fiber_manual_record </i>Invoice</span>
											</div>
										</div>
										<div class="list-desc">There are many variations of passages of Lorem Ipsum available, but the majority
											have suffered alteration in some form, by injected humour, or randomised words which don't look even
											slightly believable. If you are going to use a passage of Lorem Ipsum</div>
									</a>
									<div class="list-right">
										<div class="list-date"> Yesterday </div>
									</div>
								</div>
								<div class="email-brief-info collection-item animate fadeUp delay-5">
									<div class="list-left">
										<label>
											<input type="checkbox" name="foo" />
											<span></span>
										</label>
										<div class="favorite">
											<i class="material-icons">star_border</i>
										</div>
										<div class="email-label">
											<i class="material-icons">label_outline</i>
										</div>
									</div>
									<a class="list-content" href="app-email-content.html">
										<div class="list-title-area">
											<div class="user-media">
												<img src="../../../app-assets/images/user/1.jpg" alt="" class="circle z-depth-2 responsive-img avtar">
												<div class="list-title">John Doe</div>
											</div>
											<div class="title-right">
												<span class="attach-file">
													<i class="material-icons">attach_file</i>
												</span>
												<span class="badge grey lighten-3"><i class="amber-text material-icons small-icons mr-2">
														fiber_manual_record </i>Paypal</span>
											</div>
										</div>
										<div class="list-desc">There are many variations of passages of Lorem Ipsum available, but the majority
											have suffered alteration in some form, by injected humour, or randomised words which don't look even
											slightly believable. If you are going to use a passage of Lorem Ipsum</div>
									</a>
									<div class="list-right">
										<div class="list-date"> Yesterday </div>
									</div>
								</div>
								<div class="email-brief-info collection-item animate fadeUp delay-6">
									<div class="list-left">
										<label>
											<input type="checkbox" name="foo" />
											<span></span>
										</label>
										<div class="favorite">
											<i class="material-icons">star_border</i>
										</div>
										<div class="email-label">
											<i class="material-icons">label_outline</i>
										</div>
									</div>
									<a class="list-content" href="app-email-content.html">
										<div class="list-title-area">
											<div class="user-media">
												<img src="../../../app-assets/images/user/9.jpg" alt="" class="circle z-depth-2 responsive-img avtar">
												<div class="list-title">Kellin Blue</div>
											</div>
											<div class="title-right">
												<span class="attach-file">
													<i class="material-icons">attach_file</i>
												</span>
												<span class="badge grey lighten-3"><i class="amber-text material-icons small-icons mr-2">
														fiber_manual_record </i>Paypal</span>
											</div>
										</div>
										<div class="list-desc">There are many variations of passages of Lorem Ipsum available, but the majority
											have suffered alteration in some form, by injected humour, or randomised words which don't look even
											slightly believable. If you are going to use a passage of Lorem Ipsum</div>
									</a>
									<div class="list-right">
										<div class="list-date"> Yesterday </div>
									</div>
								</div>
								<div class="email-brief-info collection-item animate fadeUp">
									<div class="list-left">
										<label>
											<input type="checkbox" name="foo" />
											<span></span>
										</label>
										<div class="favorite">
											<i class="material-icons">star_border</i>
										</div>
										<div class="email-label">
											<i class="material-icons">label_outline</i>
										</div>
									</div>
									<a class="list-content" href="app-email-content.html">
										<div class="list-title-area">
											<div class="user-media">
												<img src="../../../app-assets/images/user/5.jpg" alt="" class="circle z-depth-2 responsive-img avtar">
												<div class="list-title">Albert Henry</div>
											</div>
											<div class="title-right">
												<span class="attach-file">
													<i class="material-icons">attach_file</i>
												</span>
												<span class="badge grey lighten-3"><i class="purple-text material-icons small-icons mr-2">
														fiber_manual_record </i>Note</span>
											</div>
										</div>
										<div class="list-desc">There are many variations of passages of Lorem Ipsum available, but the majority
											have suffered alteration in some form, by injected humour, or randomised words which don't look even
											slightly believable. If you are going to use a passage of Lorem Ipsum</div>
									</a>
									<div class="list-right">
										<div class="list-date"> 25 Jan </div>
									</div>
								</div>
								<div class="email-brief-info collection-item animate fadeUp">
									<div class="list-left">
										<label>
											<input type="checkbox" name="foo" />
											<span></span>
										</label>
										<div class="favorite">
											<i class="material-icons">star_border</i>
										</div>
										<div class="email-label">
											<i class="material-icons">label_outline</i>
										</div>
									</div>
									<a class="list-content" href="app-email-content.html">
										<div class="list-title-area">
											<div class="user-media">
												<img src="../../../app-assets/images/user/11.jpg" alt="" class="circle z-depth-2 responsive-img avtar">
												<div class="list-title">Kim Catty</div>
											</div>
											<div class="title-right">
												<span class="attach-file">
													<i class="material-icons">attach_file</i>
												</span>
												<span class="badge grey lighten-3"><i class="light-green-text material-icons small-icons mr-2">
														fiber_manual_record </i>Invoice</span>
											</div>
										</div>
										<div class="list-desc">There are many variations of passages of Lorem Ipsum available, but the majority
											have suffered alteration in some form, by injected humour, or randomised words which don't look even
											slightly believable. If you are going to use a passage of Lorem Ipsum</div>
									</a>
									<div class="list-right">
										<div class="list-date"> 25 Jan </div>
									</div>
								</div>
								<div class="email-brief-info collection-item animate fadeUp">
									<div class="list-left">
										<label>
											<input type="checkbox" name="foo" />
											<span></span>
										</label>
										<div class="favorite">
											<i class="material-icons">star_border</i>
										</div>
										<div class="email-label">
											<i class="material-icons">label_outline</i>
										</div>
									</div>
									<a class="list-content" href="app-email-content.html">
										<div class="list-title-area">
											<div class="user-media">
												<img src="../../../app-assets/images/user/7.jpg" alt="" class="circle z-depth-2 responsive-img avtar">
												<div class="list-title">Lina Shalin</div>
											</div>
											<div class="title-right">
												<span class="attach-file">
													<i class="material-icons">attach_file</i>
												</span>
												<span class="badge grey lighten-3"><i class="light-green-text material-icons small-icons mr-2">
														fiber_manual_record </i>Invoice</span>
											</div>
										</div>
										<div class="list-desc">There are many variations of passages of Lorem Ipsum available, but the majority
											have suffered alteration in some form, by injected humour, or randomised words which don't look even
											slightly believable. If you are going to use a passage of Lorem Ipsum</div>
									</a>
									<div class="list-right">
										<div class="list-date"> 17 Jan </div>
									</div>
								</div>
								<div class="email-brief-info collection-item animate fadeUp">
									<div class="list-left">
										<label>
											<input type="checkbox" name="foo" />
											<span></span>
										</label>
										<div class="favorite">
											<i class="material-icons">star_border</i>
										</div>
										<div class="email-label">
											<i class="material-icons">label_outline</i>
										</div>
									</div>
									<a class="list-content" href="app-email-content.html">
										<div class="list-title-area">
											<div class="user-media">
												<img src="../../../app-assets/images/user/3.jpg" alt="" class="circle z-depth-2 responsive-img avtar">
												<div class="list-title">Peter Patric</div>
											</div>
											<div class="title-right">
												<span class="attach-file">
													<i class="material-icons">attach_file</i>
												</span>
												<span class="badge grey lighten-3"><i class="purple-text material-icons small-icons mr-2">
														fiber_manual_record </i>Note</span>
											</div>
										</div>
										<div class="list-desc">There are many variations of passages of Lorem Ipsum available, but the majority
											have suffered alteration in some form, by injected humour, or randomised words which don't look even
											slightly believable. If you are going to use a passage of Lorem Ipsum</div>
									</a>
									<div class="list-right">
										<div class="list-date"> 14 Jan </div>
									</div>
								</div>
								<div class="email-brief-info collection-item animate fadeUp">
									<div class="list-left">
										<label>
											<input type="checkbox" name="foo" />
											<span></span>
										</label>
										<div class="favorite">
											<i class="material-icons">star_border</i>
										</div>
										<div class="email-label">
											<i class="material-icons">label_outline</i>
										</div>
									</div>
									<a class="list-content" href="app-email-content.html">
										<div class="list-title-area">
											<div class="user-media">
												<img src="../../../app-assets/images/user/12.jpg" alt="" class="circle z-depth-2 responsive-img avtar">
												<div class="list-title">Colin Phelin</div>
											</div>
											<div class="title-right">
												<span class="attach-file">
													<i class="material-icons">attach_file</i>
												</span>
												<span class="badge grey lighten-3"><i class="light-green-text material-icons small-icons mr-2">
														fiber_manual_record </i>Invoice</span>
											</div>
										</div>
										<div class="list-desc">There are many variations of passages of Lorem Ipsum available, but the majority
											have suffered alteration in some form, by injected humour, or randomised words which don't look even
											slightly believable. If you are going to use a passage of Lorem Ipsum</div>
									</a>
									<div class="list-right">
										<div class="list-date"> 9 Jan </div>
									</div>
								</div>
								<div class="email-brief-info collection-item animate fadeUp">
									<div class="list-left">
										<label>
											<input type="checkbox" name="foo" />
											<span></span>
										</label>
										<div class="favorite">
											<i class="material-icons">star_border</i>
										</div>
										<div class="email-label">
											<i class="material-icons">label_outline</i>
										</div>
									</div>
									<a class="list-content" href="app-email-content.html">
										<div class="list-title-area">
											<div class="user-media">
												<img src="../../../app-assets/images/user/6.jpg" alt="" class="circle z-depth-2 responsive-img avtar">
												<div class="list-title">Jack Hawk</div>
											</div>
											<div class="title-right">
												<span class="attach-file">
													<i class="material-icons">attach_file</i>
												</span>
												<span class="badge grey lighten-3"><i class="amber-text material-icons small-icons mr-2">
														fiber_manual_record </i>Paypal</span>
											</div>
										</div>
										<div class="list-desc">There are many variations of passages of Lorem Ipsum available, but the majority
											have suffered alteration in some form, by injected humour, or randomised words which don't look even
											slightly believable. If you are going to use a passage of Lorem Ipsum</div>
									</a>
									<div class="list-right">
										<div class="list-date"> 30 Dec </div>
									</div>
								</div>
								<div class="no-data-found collection-item">
									<h6 class="center-align font-weight-500">No Results Found</h6>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Content Area Ends -->

	{{-- <div class="container no-padding">

		<div class="row animated delay-5 fadeInRight slow" data-animation="fadeOutLeft">
			<div class="col s12">
				<h3 class="mt-0">Meus Tickets</h3>
			</div>
		</div>

		<div class="row animated delay-10 fadeInRight slow" data-animation="fadeOutLeft">
			<div class="col s12">
				<ul class="tabs">
					<li class="tab">
						<a href="#open">Abertos</a>
					</li>
					<li class="tab">
						<a href="#in-progress">Em Análise</a>
					</li>
					<li class="tab">
						<a href="#awaiting-client-response">Respondidos</a>
					</li>
					<li class="tab">
						<a href="#closed">Concluídos</a>
					</li>
				</ul>
			</div>
		</div>

		<div class="row animated delay-15 fadeInRight slow" data-animation="fadeOutLeft">
			<div class="col s12">

				<div class="card" data-target="card-content">
					<div class="card-content">
						<div class="card-body">
							<div id="open" data-url="{{ route('core.tickets.status', 'open') }}" data-target="grid-body" class="table grid bordered">
								<div class="grid-head">
									<div class="grid grid-row">
										<div class="grid-col center-align" data-order="asc" data-width="20fr" data-orderable="false" data-disabled="true">
											<span class="direction">#</span>
										</div>
										<div class="grid-col center-align" data-width="20fr" data-orderable="false">
											<span class="direction"></span>
										</div>
										<div class="grid-col left-align" data-width="100fr">
											<span class="direction">Assunto</span>
										</div>
										<div class="grid-col left-align" data-width="100fr">
											<span class="direction">Departamento</span>
										</div>
										<div class="grid-col left-align" data-width="100fr">
											<span class="direction">Última Atualização</span>
										</div>
										<div class="grid-col left-align" data-width="60fr">
											<span class="direction">Status</span>
										</div>
									</div>
								</div>
								<div class="grid grid-body"></div>
							</div>
							<div id="in-progress" data-url="{{ route('core.tickets.status', 'in-progress') }}" data-target="grid-body" class="table grid bordered">
								<div class="grid-head">
									<div class="grid grid-row">
										<div class="grid-col center-align" data-order="asc" data-width="20fr" data-orderable="false" data-disabled="true">
											<span class="direction">#</span>
										</div>
										<div class="grid-col center-align" data-width="20fr" data-orderable="false">
											<span class="direction"></span>
										</div>
										<div class="grid-col left-align" data-width="100fr">
											<span class="direction">Assunto</span>
										</div>
										<div class="grid-col left-align" data-width="100fr">
											<span class="direction">Departamento</span>
										</div>
										<div class="grid-col left-align" data-width="100fr">
											<span class="direction">Última Atualização</span>
										</div>
										<div class="grid-col left-align" data-width="60fr">
											<span class="direction">Status</span>
										</div>
									</div>
								</div>
								<div class="grid grid-body"></div>
							</div>
							<div id="awaiting-client-response" data-url="{{ route('core.tickets.status', 'awaiting-client-response') }}" data-target="grid-body" class="table grid bordered">
								<div class="grid-head">
									<div class="grid grid-row">
										<div class="grid-col center-align" data-order="asc" data-width="20fr" data-orderable="false" data-disabled="true">
											<span class="direction">#</span>
										</div>
										<div class="grid-col center-align" data-width="20fr" data-orderable="false">
											<span class="direction"></span>
										</div>
										<div class="grid-col left-align" data-width="100fr">
											<span class="direction">Assunto</span>
										</div>
										<div class="grid-col left-align" data-width="100fr">
											<span class="direction">Departamento</span>
										</div>
										<div class="grid-col left-align" data-width="100fr">
											<span class="direction">Última Atualização</span>
										</div>
										<div class="grid-col left-align" data-width="60fr">
											<span class="direction">Status</span>
										</div>
									</div>
								</div>
								<div class="grid grid-body"></div>
							</div>
							<div id="closed" data-url="{{ route('core.tickets.status', 'closed') }}" data-target="grid-body" class="table grid bordered">
								<div class="grid-head">
									<div class="grid grid-row">
										<div class="grid-col center-align" data-order="asc" data-width="20fr" data-orderable="false" data-disabled="true">
											<span class="direction">#</span>
										</div>
										<div class="grid-col center-align" data-width="20fr" data-orderable="false">
											<span class="direction"></span>
										</div>
										<div class="grid-col left-align" data-width="100fr">
											<span class="direction">Assunto</span>
										</div>
										<div class="grid-col left-align" data-width="100fr">
											<span class="direction">Departamento</span>
										</div>
										<div class="grid-col left-align" data-width="100fr">
											<span class="direction">Última Atualização</span>
										</div>
										<div class="grid-col left-align" data-width="60fr">
											<span class="direction">Status</span>
										</div>
									</div>
								</div>
								<div class="grid grid-body"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div> --}}
@endsection

@section('left-sidebar')
	@include('clinica.agendamentos.form')
@endsection

@section('right-sidebar')
	@include('clinica.atendimentos.datelhes_atendimento')
	{{-- @include('clinica.atendimentos.form') --}}
@endsection
