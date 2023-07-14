@extends('core.body')

@section('main')
	<div class="container no-padding">
		<!-- Sidebar Area Starts -->
		<div class="sidebar-left sidebar-fixed" style="position: fixed; margin: 0; padding: 0px;">
			<div class="sidebar">
				<div class="sidebar-content">
					<div class="sidebar-header">
						<div class="sidebar-details">
							<h5 class="m-0 sidebar-title"><i class="material-icons app-header-icon text-top">mail_outline</i> Meus Tickets</h5>
							{{-- <div class="row valign-wrapper mt-10 pt-2">
								<div class="col s3 media-image">
									<img src="../../../app-assets/images/user/2.jpg" alt="" class="circle z-depth-2 responsive-img">
									<!-- notice the "circle" class -->
								</div>
								<div class="col s9">
									<p class="m-0 subtitle font-weight-700">Lawrence Collins</p>
									<p class="m-0 text-muted">lawrence.collins@xyz.com</p>
								</div>
							</div> --}}
						</div>
					</div>
					<div id="sidebar-list" class="sidebar-menu list-group position-relative">
						<div class="sidebar-list-padding app-sidebar sidenav" id="email-sidenav">
							<ul class="email-list display-grid">
								<li class="tab active">
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
							{{-- <ul class="email-list display-grid">
										<li class="sidebar-title">Folders</li>
										<li class="active"><a href="#!" class="text-sub"><i class="material-icons mr-2"> mail_outline </i> Inbox</a>
										</li>
										<li><a href="#!" class="text-sub"><i class="material-icons mr-2"> send </i> Sent</a></li>
										<li><a href="#!" class="text-sub"><i class="material-icons mr-2"> description </i> Draft</a></li>
										<li><a href="#!" class="text-sub"><i class="material-icons mr-2"> info_outline </i> Span</a></li>
										<li><a href="#!" class="text-sub"><i class="material-icons mr-2"> delete </i> Trash</a></li>
										<li class="sidebar-title">Filters</li>
										<li><a href="#!" class="text-sub"><i class="material-icons mr-2"> star_border </i> Starred</a></li>
										<li><a href="#!" class="text-sub"><i class="material-icons mr-2"> label_outline </i> Important</a></li>
										<li class="sidebar-title">Labels</li>
										<li><a href="#!" class="text-sub"><i class="purple-text material-icons small-icons mr-2">
													fiber_manual_record </i> Note</a></li>
										<li><a href="#!" class="text-sub"><i class="amber-text material-icons small-icons mr-2">
													fiber_manual_record </i> Paypal</a></li>
										<li><a href="#!" class="text-sub"><i class="light-green-text material-icons small-icons mr-2">
													fiber_manual_record </i> Invoice</a></li>
									</ul> --}}
						</div>
					</div>
					<a href="#" data-target="email-sidenav" class="sidenav-trigger hide-on-large-only"><i class="material-icons">menu</i></a>
				</div>
			</div>
		</div>
		<!-- Sidebar Area Ends -->
		<div class="row">
			<div class="col s12">
				@yield('app-mail')
			</div>
		</div>
	</div>
@endsection
