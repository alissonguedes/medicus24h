@extends('main.body')

@section('main')
	<section id="slider">
		<div class="slider fullscreen">
			<div class="slider-fixed">
				<ul class="slides">
					@for ($i = 1; $i <= 2; $i++)
						<li>
							<img src="{{ asset('img/site/banner/' . $i . '.png') }}" alt="">
						</li>
					@endfor
				</ul>
			</div>
		</div>
	</section>

	<section class="row white lighten-1">

		<div class="col s12">

			<div class="container pt-10">

				<div class="row">

					<div class="col l5 mt-3 mb-3">

						<h4 class="left-align black-text bold">Cuidados com Idosos em casa</h4>

						<p class="" style="font-size: 18px;">
							A segurança, o conforto e o bem-estar dos idosos são prioridades absolutas. É por isso que oferecemos uma ampla gama de serviços de Home Care, projetados para atender às necessidades individuais de cada cliente, no conforto de seu próprio lar.
						</p>

						<p>
							<a class="btn waves-effect teal lighten-1" data-trigger="modal" data-target="modal-cuidados-com-idosos">Ver mais</a>
						</p>

						<div id="modal-cuidados-com-idosos" class="modal modal-fixed-footer">
							<div class="modal-content">

								<h4>Cuidados com Idosos em Casa</h4>

								<p>Nossa equipe de profissionais altamente treinados e dedicados está comprometida em fornecer cuidados abrangentes e personalizados, garantindo que os idosos recebam a atenção e o suporte necessários para viverem uma vida feliz e saudável em sua própria casa.</p>

								<p>Compreendemos que cada pessoa é única, com suas próprias necessidades e preferências. É por isso que desenvolvemos um plano de cuidados individualizado, em estreita colaboração com a família e o cliente, para garantir que todas as suas necessidades sejam atendidas da melhor maneira possível.</p>

								<p>Nossos serviços abrangem uma variedade de áreas, incluindo assistência com atividades diárias, como higiene pessoal, alimentação e mobilidade, além de administração de medicamentos e acompanhamento em consultas médicas. Também oferecemos suporte emocional e socialização, promovendo uma sensação de conexão e bem-estar emocional.</p>

								<p>A segurança é uma prioridade máxima. Nossa equipe é treinada para lidar com emergências e situações inesperadas, garantindo que um ambiente seguro e protegido seja mantido a todo momento.</p>

								<p>Acreditamos que os idosos merecem envelhecer com dignidade e respeito, mantendo a independência e a qualidade de vida. Nossos serviços de Home Care foram projetados com esse princípio em mente, oferecendo uma alternativa confiável e compassiva aos cuidados em instituições.</p>

								<p>Convidamos você a explorar nosso site para obter mais informações sobre nossos serviços de Home Care para cuidados com idosos. Estamos à disposição para responder a todas as suas perguntas e agendar uma consulta para discutir as necessidades específicas do seu ente querido.</p>

								<p>Permita-nos ajudar a proporcionar um ambiente seguro, confortável e carinhoso para seus entes queridos. Entre em contato conosco hoje mesmo e descubra como nossos serviços de Home Care podem fazer a diferença em suas vidas.</p>

								<p>Equipe <span class="red-text">Médicus24h</span></p>

							</div>

							<div class="modal-footer">
								<button class="btn modal-close white black-text btn-flat">Fechar</button>
							</div>
						</div>

					</div>

					<div class="col l7">
						<img src="{{ asset('img/site/cuidado-com-idosos.jpg') }}" alt="" class="responsive-img z-depth-4 border-radius-10">
					</div>

				</div>

			</div>

		</div>

	</section>

	<section class="row white lighten-1">
		<div class="col s12">
			<div class="container">
				<div class="row">
					<div class="col s12">
						<h3 class="center-align teal-text text-lighten-1 bold pb-5">Serviços</h3>
					</div>
				</div>
				<div class="row">
					<div class="col s12 m6 l4">
						<div class="card-panel border-radius-10 mt-10 card-animation-1">
							<img src="{{ asset('img/site/banner/1.png') }}" alt="" class="responsive-img border-radius-8 z-depth-4 image-n-margin">
							<h6 class="card-title">
								<a href="#" class="mt-5">UTI Móvel</a>
							</h6>
							{{-- <p>Este serviço pode beneficiar:</p> --}}
							<ul>
								<li>
									<i class="material-icons teal-text lighten-1">favorite</i>
									<span>Profissionais especializados</span>
								</li>
								<li>
									<i class="material-icons teal-text lighten-1">favorite</i>
									<span>Suporte básico e avançado</span>
								</li>
								<li>
									<i class="material-icons teal-text lighten-1">favorite</i>
									<span>Proteção médica</span>
								</li>
								<li>
									<i class="material-icons teal-text lighten-1">favorite</i>
									<span>Profissionais capacitados</span>
								</li>
								<li>
									<i class="material-icons teal-text lighten-1">favorite</i>
									<span>Atendimento ágil</span>
								</li>
								<li>
									<span>Entre outros...</span>
								</li>
							</ul>
							<div class="card-action mt-3 right-align">
								<a href="#" data-trigger="modal" data-target="modal-servico-uti-movel">Saiba mais</a>
							</div>

							<div id="modal-servico-uti-movel" class="modal modal-fixed-footer">
								<div class="modal-content">
									<h4>UTI Móvel</h4>
									<p>Entendemos que momentos de emergência médica podem ser estressantes e exigir atenção especializada imediata. É por isso que estamos aqui para oferecer serviços de UTI Móvel confiáveis e de alta qualidade, garantindo cuidados médicos avançados diretamente no local necessário.</p>

									<p>Nossa equipe de profissionais altamente treinados, incluindo médicos, enfermeiros e paramédicos, está pronta para fornecer atendimento médico especializado, seja em transferências inter-hospitalares, atendimentos domiciliares ou em eventos onde a presença de uma UTI móvel é necessária.</p>

									<p>Nossas unidades de UTI Móvel são equipadas com tecnologia de ponta, garantindo um ambiente seguro e equipado para lidar com uma ampla gama de situações médicas. Com equipamentos avançados, podemos fornecer monitoramento contínuo dos sinais vitais, administração de medicamentos, suporte respiratório e outros tratamentos de suporte.</p>

									<p>A segurança e o bem-estar do paciente são nossa principal prioridade. Nossos profissionais são altamente experientes e estão preparados para lidar com emergências médicas complexas, garantindo um atendimento rápido e eficiente.</p>

									<p>Além disso, nossos serviços de UTI Móvel são complementados por uma equipe de coordenação dedicada, que trabalha em estreita colaboração com hospitais, clínicas e famílias para garantir uma comunicação clara e uma transferência suave de cuidados.</p>

									<p>Estamos comprometidos em fornecer uma abordagem personalizada para cada paciente, levando em consideração suas necessidades individuais e criando um plano de cuidados personalizado. Nossa equipe está disponível 24 horas por dia, 7 dias por semana, para fornecer a melhor assistência médica em qualquer momento de necessidade.</p>

									<p>Convidamos você a explorar nosso site para obter mais informações sobre nossos serviços de UTI Móvel. Estamos à disposição para responder a todas as suas perguntas e fornecer orientações sobre como nossos serviços podem atender às suas necessidades específicas.</p>

									<p>Confie em nossa equipe especializada e experiente para fornecer cuidados médicos avançados e de qualidade onde e quando você mais precisa. Entre em contato conosco hoje mesmo e descubra como nossos serviços de UTI Móvel podem fazer a diferença em situações críticas.</p>

									<p>Equipe <span class="red-text">Médicus24h</span></p>

								</div>
								<div class="modal-footer"><button class="btn modal-close white black-text btn-flat">Fechar</button></div>
							</div>
						</div>
					</div>
					<div class="col s12 m6 l4 mb-3">
						<div class="card-panel border-radius-10 mt-10 card-animation-1">
							<img src="{{ asset('img/site/banner/1.png') }}" alt="" class="responsive-img border-radius-8 z-depth-4 image-n-margin">
							<h6 class="card-title">
								<a href="#" class="mt-5">Assistência Domiciliar</a>
							</h6>
							{{-- <p>Este serviço pode beneficiar:</p> --}}
							<ul>
								<li>
									<i class="material-icons teal-text lighten-1">favorite</i>
									<span>Escolas</span>
								</li>
								<li>
									<i class="material-icons teal-text lighten-1">favorite</i>
									<span>Igrejas</span>
								</li>
								<li>
									<i class="material-icons teal-text lighten-1">favorite</i>
									<span>Indústrias</span>
								</li>
								<li>
									<i class="material-icons teal-text lighten-1">favorite</i>
									<span>Condomínios</span>
								</li>
								<li>
									<i class="material-icons teal-text lighten-1">favorite</i>
									<span>Clínicas</span>
								</li>
								<li>
									<span>Entre outros...</span>
								</li>
							</ul>
							<div class="card-action mt-3 right-align">
								<a href="#" data-trigger="modal" data-target="modal-assistencia-domiciliar">Saiba mais</a>
							</div>
							<div id="modal-assistencia-domiciliar" class="modal modal-fixed-footer">
								<div class="modal-content">
									<h4>Assistência Domiciliar</h4>

									<p>Sabemos que cada pessoa é única, e quando se trata de cuidados de saúde, a comodidade e o conforto do lar podem desempenhar um papel fundamental na recuperação e bem-estar. É por isso que estamos aqui para fornecer serviços de assistência domiciliar abrangentes e personalizados, adaptados às suas necessidades individuais.</p>

									<p>Nossa equipe de profissionais dedicados é composta por médicos, enfermeiros e cuidadores altamente qualificados, que estão prontos para oferecer cuidados de saúde especializados diretamente em sua casa. Seja para acompanhamento pós-operatório, tratamentos contínuos ou cuidados a longo prazo, estamos aqui para apoiá-lo.</p>

									<p>Com a Médicus24h, você terá acesso a uma ampla gama de serviços de saúde no conforto do seu lar. Nossos profissionais experientes podem realizar exames médicos, administrar medicamentos, fazer curativos, fornecer fisioterapia, auxiliar com a higiene pessoal e oferecer orientação abrangente sobre cuidados e prevenção.</p>

									<p>Entendemos a importância da confiança e do relacionamento de longo prazo entre o paciente e o profissional de saúde. É por isso que garantimos que nossos profissionais sejam dedicados, atenciosos e comprometidos em fornecer o mais alto padrão de atendimento.</p>

									<p>Além disso, nossa equipe de coordenação está sempre disponível para ajudar a agendar consultas médicas, fornecer orientação sobre tratamentos e garantir uma comunicação clara e contínua entre você, sua família e a equipe médica.</p>

									<p>Acreditamos que a assistência domiciliar pode oferecer uma abordagem mais personalizada e humanizada para cuidados de saúde, proporcionando um ambiente familiar e acolhedor. Nosso objetivo é capacitar você a alcançar a melhor qualidade de vida possível, mantendo a autonomia e a independência.</p>

									<p>Explorar nosso site permitirá que você conheça mais sobre nossos serviços de assistência domiciliar e os benefícios que eles podem trazer para você ou seu ente querido. Fique à vontade para entrar em contato conosco para obter mais informações, agendar uma consulta ou discutir suas necessidades específicas.</p>

									<p>A Médicus24h está aqui para cuidar de você, no conforto de seu lar. Confie em nossa equipe dedicada e experiente para fornecer os melhores cuidados de saúde, com a atenção e o carinho que você merece.</p>

									<p>Equipe <span class="red-text">Médicus24h</span></p>

								</div>
								<div class="modal-footer"><button class="btn modal-close white black-text btn-flat">Fechar</button></div>
							</div>
						</div>
					</div>
					<div class="col s12 m6 l4 mb-3">
						<div class="card-panel border-radius-10 mt-10 card-animation-1">
							<img src="{{ asset('img/site/banner/1.png') }}" alt="" class="responsive-img border-radius-8 z-depth-4 image-n-margin">
							<h6 class="card-title">
								<a href="#" class="mt-5">Área Protegida</a>
							</h6>
							{{-- <p>Este serviço pode beneficiar:</p> --}}
							<ul>
								<li>
									<i class="material-icons teal-text lighten-1">favorite</i>
									<span>Escolas</span>
								</li>
								<li>
									<i class="material-icons teal-text lighten-1">favorite</i>
									<span>Igrejas</span>
								</li>
								<li>
									<i class="material-icons teal-text lighten-1">favorite</i>
									<span>Indústrias</span>
								</li>
								<li>
									<i class="material-icons teal-text lighten-1">favorite</i>
									<span>Condomínios</span>
								</li>
								<li>
									<i class="material-icons teal-text lighten-1">favorite</i>
									<span>Clínicas</span>
								</li>
								<li>
									<span>Entre outros...</span>
								</li>
							</ul>
							<div class="card-action mt-3 right-align">
								<a href="#" data-trigger="modal" data-target="modal-area-protegida">Saiba mais</a>
							</div>
							<div id="modal-area-protegida" class="modal modal-fixed-footer">
								<div class="modal-content">
									<h4>Área Protegida</h4>

									<p>Na Área Protegida da Médicus24h, entendemos que acidentes e situações imprevistas podem ocorrer a qualquer momento, e é fundamental contar com um suporte confiável e eficiente. É por isso que oferecemos um serviço abrangente de monitoramento e resposta rápida para garantir sua segurança e bem-estar.</p>

									<p>Nosso serviço de Área Protegida é projetado para fornecer uma rede de proteção em sua residência e/ou empresa, para que você possa se sentir seguro e protegido a qualquer hora do dia ou da noite. Utilizando tecnologia avançada de monitoramento, estamos prontos para responder a emergências médicas, acionar auxílio profissional e coordenar os cuidados necessários de forma ágil e eficaz.</p>

									<p>Com a Área Protegida da Médicus24h, você terá à sua disposição um sistema de segurança integrado, incluindo dispositivos de monitoramento, sensores e botões de emergência estrategicamente posicionados em sua residência. Em caso de necessidade, basta pressionar o botão de emergência para acionar nossa equipe de pronto atendimento, que estará pronta para fornecer assistência imediata.</p>

									<p>Nossa equipe altamente treinada e especializada monitora sua residência 24 horas por dia, 7 dias por semana. Ao receber um sinal de emergência, entramos em ação imediatamente, entrando em contato com você e, se necessário, enviando profissionais qualificados para o local.</p>

									<p>A segurança é nossa prioridade, e entendemos a importância da comunicação clara e rápida em situações de emergência. Nossa equipe de coordenação está pronta para garantir uma resposta adequada, trabalhando em estreita colaboração com hospitais, serviços de emergência e seus contatos de emergência designados.</p>

									<p>A Área Protegida da Médicus24h oferece tranquilidade e paz de espírito para você e seus entes queridos. Seja para idosos, pessoas com condições médicas específicas ou para qualquer pessoa que queira um suporte adicional de segurança, estamos aqui para ajudar.</p>

									<p>Explore nosso site para obter mais informações sobre os serviços de Área Protegida da Médicus24h e como eles podem beneficiar você ou seus entes queridos. Estamos à disposição para responder a todas as suas perguntas, fornecer orientações e ajudá-lo a tomar a melhor decisão para suas necessidades de segurança.</p>

									<p>Confie na Área Protegida da Médicus24h para cuidar de você e garantir sua segurança em qualquer situação. Sua tranquilidade está em boas mãos.</p>

									<p>Equipe <span class="red-text">Médicus24h</span></p>

								</div>
								<div class="modal-footer"><button class="btn modal-close white black-text btn-flat">Fechar</button></div>
							</div>
						</div>
					</div>
					{{-- <div class="col s12 m6 l4 mb-3">
						<div class="card-panel border-radius-10 mt-10 card-animation-1">
							<img src="{{ asset('img/site/banner/1.png') }}" alt="" class="responsive-img border-radius-8 z-depth-4 image-n-margin">
							<h6 class="card-title">
								<a href="#" class="mt-5">Benefícios</a>
							</h6>
							<p>Este serviço pode beneficiar:</p>
							<ul>
								<li>
									<i class="material-icons teal-text lighten-1">favorite</i>
									<span>Profissionais especializados</span>
								</li>
								<li>
									<i class="material-icons teal-text lighten-1">favorite</i>
									<span>UTI Móvel e ambulância</span>
								</li>
								<li>
									<i class="material-icons teal-text lighten-1">favorite</i>
									<span>Segurança Médica</span>
								</li>
								<li>
									<i class="material-icons teal-text lighten-1">favorite</i>
									<span>Profissionais capacitados</span>
								</li>
								<li>
									<i class="material-icons teal-text lighten-1">favorite</i>
									<span>Atendimento ágil</span>
								</li>
								<li>
									<span>Entre outros...</span>
								</li>
							</ul>
							<div class="card-action mt-3 right-align">
								<a href="#">Saiba mais</a>
							</div>
						</div>
					</div>
					<div class="col s12 m6 l4 mb-3">
						<div class="card-panel border-radius-10 mt-10 card-animation-1">
							<img src="{{ asset('img/site/banner/1.png') }}" alt="" class="responsive-img border-radius-8 z-depth-4 image-n-margin">
							<h6 class="card-title">
								<a href="#" class="mt-5">Outros Atendimentos</a>
							</h6>
							<p>Este serviço pode beneficiar:</p>
							<ul>
								<li>
									<i class="material-icons teal-text lighten-1">favorite</i>
									<span>Aplicação de antibióticos</span>
								</li>
								<li>
									<i class="material-icons teal-text lighten-1">favorite</i>
									<span>Cuidados especializados</span>
								</li>
								<li>
									<i class="material-icons teal-text lighten-1">favorite</i>
									<span>Locomoção de pacientes</span>
								</li>
								<li>
									<i class="material-icons teal-text lighten-1">favorite</i>
									<span>Curativos complexos</span>
								</li>
								<li>
									<i class="material-icons teal-text lighten-1">favorite</i>
									<span>Dieta enteral e parenteral</span>
								</li>
								<li>
									<span>Entre outros...</span>
								</li>
							</ul>
							<div class="card-action mt-3 right-align">
								<a href="#">Saiba mais</a>
							</div>
						</div>
					</div>
					<div class="col s12 m6 l4 mb-3">
						<div class="card-panel border-radius-10 mt-10 card-animation-1">
							<img src="{{ asset('img/site/banner/1.png') }}" alt="" class="responsive-img border-radius-8 z-depth-4 image-n-margin">
							<h6 class="card-title">
								<a href="#" class="mt-5">Contratar a Médicus24h</a>
							</h6>
							<p>Este serviço pode beneficiar:</p>
							<ul>
								<li>
									<i class="material-icons teal-text lighten-1">favorite</i>
									<span>Profissionais especializados</span>
								</li>
								<li>
									<i class="material-icons teal-text lighten-1">favorite</i>
									<span>UTI Móvel e ambulância</span>
								</li>
								<li>
									<i class="material-icons teal-text lighten-1">favorite</i>
									<span>Segurança Médica</span>
								</li>
								<li>
									<i class="material-icons teal-text lighten-1">favorite</i>
									<span>Profissionais capacitados</span>
								</li>
								<li>
									<i class="material-icons teal-text lighten-1">favorite</i>
									<span>Atendimento ágil</span>
								</li>
								<li>
									<span>Entre outros...</span>
								</li>
							</ul>
							<div class="card-action mt-3 right-align">
								<a href="#">Saiba mais</a>
							</div>
						</div>
					</div> --}}
				</div>
			</div>
		</div>
	</section>

	<section class="row red darken-2">
		<div class="col s12">
			<div class="container pb-3">
				<div class="row">
					<div class="col s12">
						<h3 class="title-section white-text text-lighten-1 bold mb-3">Atendimento</h3>
						<p class="center-align white-text mb-5">
							Cuidado acessível, confiável e personalizado. Sua saúde em boas mãos.
						</p>
					</div>
				</div>
				<div class="row">
					<div class="col s12 m6 l4 mb-3">
						<div class="card-panel border-radius-10 mt-10 card-animation-1">
							<img src="{{ asset('img/site/banner/1.png') }}" alt="" class="responsive-img border-radius-8 z-depth-4 image-n-margin">
							<h6 class="card-title">
								<a href="#" class="mt-5">Telemedicina</a>
							</h6>
							<p>Um serviço inovador que coloca a saúde ao seu alcance, onde quer que você esteja!</p>
							<div class="card-action mt-3 right-align">
								<a href="#" data-trigger="modal" data-target="modal-telemedicina">Saiba mais</a>
							</div>
							<div id="modal-telemedicina" class="modal modal-fixed-footer">
								<div class="modal-content">
									<h4>Telemedicina</h4>

									<p>Na era digital em que vivemos, a Telemedicina se tornou uma ferramenta essencial para proporcionar cuidados médicos acessíveis e convenientes. Com a Telemedicina da Médicus24h, você pode ter acesso a consultas médicas virtuais com profissionais qualificados, sem precisar sair de casa.</p>

									<p>Nossos serviços de Telemedicina são projetados para fornecer atendimento médico de qualidade, através de videochamadas seguras e confidenciais. Com apenas alguns cliques, você pode agendar uma consulta virtual com um médico experiente, onde poderá discutir suas preocupações de saúde, obter orientações médicas e até mesmo receber prescrições, quando necessário.</p>

									<p>Entendemos que sua saúde não pode esperar e que, em certas situações, a conveniência de uma consulta online é fundamental. Seja para esclarecer dúvidas, obter um diagnóstico inicial, monitorar condições crônicas ou acompanhar um tratamento em andamento, nossa equipe de médicos está pronta para atendê-lo.</p>

									<p>Nossos profissionais de saúde são altamente qualificados e experientes em fornecer consultas médicas virtuais abrangentes. Eles estão equipados com o conhecimento e as ferramentas necessárias para avaliar seus sintomas, fornecer conselhos médicos embasados e oferecer orientações para o próximo passo no seu cuidado de saúde.</p>

									<p>A privacidade e a confidencialidade são de extrema importância para nós. Nossas plataformas de Telemedicina são seguras e em conformidade com os padrões de segurança de dados para garantir a proteção das suas informações pessoais de saúde.</p>

									<p>Na Telemedicina da Médicus24h, acreditamos na importância de uma abordagem integrada para a saúde. Se necessário, nossos médicos podem coordenar com outros profissionais de saúde, solicitar exames laboratoriais ou de imagem, e garantir que você receba o acompanhamento adequado para suas necessidades.</p>

									<p>Explore nosso site para obter mais informações sobre os serviços de Telemedicina da Médicus24h e como eles podem beneficiar você. Estamos aqui para responder a todas as suas perguntas, agendar consultas virtuais e fornecer o suporte médico necessário, tudo isso de forma prática e acessível.</p>

									<p>Confie na Telemedicina da Médicus24h para obter atendimento médico conveniente, seguro e de qualidade, no conforto do seu lar. Sua saúde está em boas mãos.</p>

									<p>Equipe <span class="red-text">Médicus24h</span></p>

								</div>
								<div class="modal-footer"><button class="btn modal-close white black-text btn-flat">Fechar</button></div>
							</div>
						</div>
					</div>
					<div class="col s12 m6 l4 mb-3">
						<div class="card-panel border-radius-10 mt-10 card-animation-1">
							<img src="{{ asset('img/site/banner/1.png') }}" alt="" class="responsive-img border-radius-8 z-depth-4 image-n-margin">
							<h6 class="card-title">
								<a href="#" class="mt-5">Exames a Domicílio</a>
							</h6>
							<p>Você não precisa mais se preocupar com deslocamentos ou esperas em filas de laboratórios.</p>
							<div class="card-action mt-3 right-align">
								<a href="#" data-trigger="modal" data-target="modal-exames-a-domicilio">Saiba mais</a>
							</div>
							<div id="modal-exames-a-domicilio" class="modal modal-fixed-footer">
								<div class="modal-content">
									<h4>Exames a Domicílio</h4>

									<p>Reconhecemos que fazer exames médicos pode ser uma tarefa desafiadora e muitas vezes inconveniente. É por isso que oferecemos serviços de exames a domicílio, para que você possa realizar seus exames médicos de forma fácil, conveniente e segura, sem sair de casa.</p>

									<p>Nossa equipe de profissionais experientes está pronta para oferecer uma ampla gama de exames médicos, desde análises clínicas até exames de imagem, tudo no conforto do seu lar. Nós trazemos o laboratório e o equipamento de diagnóstico para você, garantindo um processo tranquilo e sem complicações.</p>

									<p>Com a praticidade dos exames a domicílio da Médicus24h, você evitará deslocamentos desnecessários, longas esperas em clínicas e hospitais e o desconforto associado a essas situações. Nossa equipe irá até você, respeitando sua privacidade e fornecendo um ambiente confortável para realizar os exames necessários.</p>

									<p>Trabalhamos com equipamentos de última geração e laboratórios certificados, garantindo resultados precisos e confiáveis. Nossos profissionais são altamente qualificados e seguirão protocolos rigorosos para garantir a coleta adequada de amostras e a realização dos exames de acordo com os mais altos padrões médicos.</p>

									<p>Entendemos a importância da rapidez e da eficiência na obtenção dos resultados dos exames. Por isso, nosso processo de análise e liberação dos resultados é ágil, permitindo que você tenha acesso às informações necessárias o mais rápido possível.</p>

									<p>Nossa equipe de coordenação está disponível para auxiliá-lo em todas as etapas do processo, desde o agendamento dos exames até a entrega dos resultados. Estamos comprometidos em fornecer um atendimento personalizado e dedicado, garantindo que todas as suas necessidades sejam atendidas de forma eficaz.</p>

									<p>Na Médicus24h, acreditamos que cuidar da sua saúde deve ser uma experiência conveniente, sem estresse e adaptada às suas necessidades individuais. Nossos serviços de exames a domicílio foram projetados para oferecer comodidade, qualidade e segurança para você e sua família.</p>

									<p>Explore nosso site para obter mais informações sobre os serviços de exames a domicílio da Médicus24h. Estamos à disposição para responder a todas as suas perguntas, fornecer orientações e agendar seus exames de acordo com sua conveniência.</p>

									<p>Confie na Médicus24h para realizar seus exames médicos no conforto do seu lar, com profissionalismo e cuidado. Sua saúde está em boas mãos.</p>

									<p>Equipe <span class="red-text">Médicus24h</span></p>

								</div>
								<div class="modal-footer"><button class="btn modal-close white black-text btn-flat">Fechar</button></div>
							</div>
						</div>
					</div>
					<div class="col s12 m6 l4 mb-3">
						<div class="card-panel border-radius-10 mt-10 card-animation-1">
							<img src="{{ asset('img/site/banner/1.png') }}" alt="" class="responsive-img border-radius-8 z-depth-4 image-n-margin">
							<h6 class="card-title">
								<a href="#" class="mt-5">Outros Serviços</a>
							</h6>
							<p>Serviços cuidadosamente selecionados para atender a todas as suas demandas de forma conveniente e confiável.</p>
							<div class="card-action mt-3 right-align">
								<a href="#" data-trigger="modal" data-target="modal-outros-servicos">Saiba mais</a>
							</div>
							<div id="modal-outros-servicos" class="modal modal-fixed-footer">
								<div class="modal-content">
									<h4>Outros Serviços</h4>

									<p>A Médicus24h está comprometida em fornecer uma ampla gama de serviços para atender às suas necessidades de cuidados de saúde, no conforto do seu lar. Nossa equipe de profissionais altamente qualificados está pronta para oferecer suporte abrangente em várias áreas, desde cuidados home care até cursos de treinamento e venda de produtos clínicos.</p>

									<h5>Home Care</h5>

									<p>Nossos serviços de Home Care são projetados para fornecer cuidados individualizados e de alta qualidade no ambiente familiar. Contamos com uma equipe dedicada de enfermeiros, cuidadores e terapeutas que oferecem assistência personalizada, desde cuidados básicos de higiene até cuidados especializados para idosos, pacientes com condições crônicas ou aqueles que se recuperam de uma cirurgia ou lesão.</p>

									<h5>Remoção e Transporte</h5>

									<p>Nossa equipe altamente treinada e equipada está pronta para fornecer assistência ágil e profissional, seja para transferências entre hospitais, transporte para consultas médicas ou qualquer outra necessidade de remoção médica.</p>

									<p>Com atendimento dedicado e uma frota de veículos adequados, garantimos que os pacientes sejam transportados com conforto e segurança, priorizando sempre o bem-estar e a tranquilidade de cada pessoa.</p>

									<h5>Gravidez, Bem-estar e Informação</h5>

									<p>A presença de uma Doula durante a gravidez e o parto pode ser um suporte fundamental para a gestante e sua família. Nossas Doulas são profissionais treinadas e experientes, prontas para oferecer suporte emocional, físico e informativo durante todo o processo, promovendo um parto seguro e tranquilo, e auxiliando na adaptação aos primeiros dias com o bebê.</p>

									<h5>Cursos e Treinamentos</h5>

									<p>Para aqueles que desejam expandir seus conhecimentos na área da saúde, oferecemos uma variedade de cursos e treinamentos. Nossos programas abrangem temas como primeiros socorros, cuidados com idosos, suporte básico de vida, entre outros. Nossos instrutores experientes irão capacitá-lo com as habilidades e conhecimentos necessários para lidar com situações de emergência e cuidar adequadamente de seus entes queridos.</p>

									<h5>Contratação de Serviços Médicos</h5>

									<p>Além disso, facilitamos a contratação de serviços médicos, conectando você com profissionais qualificados e especializados em diversas áreas da saúde. Seja para consultas médicas, exames especializados, tratamentos ou acompanhamento médico contínuo, nossa equipe de coordenação estará pronta para ajudá-lo a agendar e organizar seus serviços médicos de forma eficiente e conveniente.</p>

									<h5>Venda e Aluguel de Produtos</h5>

									<p>Também oferecemos a venda e aluguel de produtos clínicos, para atender às suas necessidades de cuidados em casa. Disponibilizamos uma variedade de equipamentos e suprimentos médicos de alta qualidade, como cadeiras de rodas, camas hospitalares, oxímetros, inaladores, entre outros. Nossa equipe fornecerá orientação especializada para garantir que você encontre os produtos adequados às suas necessidades.</p>

									<p>Na Médicus24h, nosso compromisso é proporcionar cuidados de saúde holísticos, abrangentes e convenientes. Nossa equipe está pronta para atender às suas necessidades específicas, com profissionalismo, compaixão e dedicação.</p>

									<p>Explore nosso site para obter mais informações sobre nossos serviços de Home Care, Doulas, Cursos e Treinamentos, Contratação de Serviços Médicos e Venda e Aluguel de Produtos Clínicos. Estamos à disposição para responder a todas as suas perguntas e ajudá-lo a encontrar as soluções certas para você e sua família.</p>

									<p>Equipe <span class="red-text">Médicus24h</span></p>

								</div>
								<div class="modal-footer"><button class="btn modal-close white black-text btn-flat">Fechar</button></div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="row white lighten-1">

		<div class="col s12">

			<div class="container pb-10 pt-10">

				<div class="row">

					<div class="col s12 l6">
						<img src="{{ asset('img/site/banner/1.png') }}" alt="" class="responsive-img z-depth-4 border-radius-10">
					</div>

					<div class="col s12 l6 pl-6">

						<h4 class="left-align black-text bold">Área protegida</h4>

						<p class="" style="font-size: 18px;">
							Um serviço inovador e essencial para garantir sua segurança e tranquilidade em momentos de emergência!
						</p>
						<p>
							<a href="#" class="btn waves-effect teal lighten-1" data-trigger="modal" data-target="modal-area-protegida">Saiba mais</a>
						</p>

					</div>

				</div>

			</div>

		</div>

	</section>

	{{-- <section class="row white darken-2">

		<div class="col s12">
			<div class="container pb-3">
				<div class="row">
					<div class="col s12">
						<h3 class="title-section teal-text text-lighten-1 bold mb-3">Nossa Equipe</h3>
						<p class="center-align white-text mb-5">
							Lorem ipsum available, but the majority have suffered alteration in some
						<form action="" class=""></form>
						</p>
					</div>
				</div>
				<div class="row">
					@for ($i = 1; $i <= 4; $i++)
						<div class="col s12 m6 l3 mb-3">
							<div class="card card-border center-align red darken-2 border-radius-10">
								<div class="card-content white-text">
									<div class="avatar circle z-depth-4 mt-6 mb-6">
										<img class="responsive-img" src="{{ asset('img/site/usuarios/' . $i . '.jpg') }}" alt="">
									</div>
									<h5 class="white-text mb-1">Beverly Little</h5>
									<p class="m-0">Senior Product Designer</p>
									<p class="mt-8">
										Creative usable interface &amp; <br>
										designer @Clevision
									</p>
								</div>
							</div>
						</div>
					@endfor
				</div>
			</div>
		</div>
	</section>

	<section class="row">
		<div class="col s12 red darken-2 z-depth-2">
			<div class="container pb-6 pt-6">
				<div class="row">
					<div class="col s12 m6 l4 center-align">
						<h5 class="white-text mb-1"></h5>
						<div class="animated pulse infinite slow">
							<i class="fa-icon fa-solid fa-heart-circle-check white-text"></i>
						</div>
						<h4 class="mt-10 white-text bold text-uppercase"> + {{ rand(2000, 9999) }}</h4>
						<p class="mt-5 white-text bold text-capitalize">
							Clientes satisfeitos
						</p>
					</div>
					<div class="col s12 m6 l4 center-align">
						<h5 class="white-text mb-1"></h5>
						<div class="animated shakeY-2 infinite slower-10s">
							<i class="fa-icon fa-solid fa-stethoscope white-text"></i>
						</div>
						<h4 class="mt-10 white-text bold text-uppercase"> + {{ rand(2000, 9999) }}</h4>
						<p class="mt-5 white-text bold text-capitalize">
							Departamentos
						</p>
					</div>
					<div class="col s12 m6 l4 center-align">
						<h5 class="white-text mb-1"></h5>
						<div class="animated jello infinite slow-5s">
							<i class="fa-icon fa-solid fa-syringe white-text"></i>
						</div>
						<h4 class="mt-10 white-text bold text-uppercase"> + {{ rand(2000, 9999) }}</h4>
						<p class="mt-5 white-text bold text-capitalize">
							vacinações
						</p>
					</div>
				</div>
			</div>
		</div>
	</section> --}}
@endsection
