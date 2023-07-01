@extends('main.body')

@section('page-title', 'Sobre nós')

@section('capa')
	<div class="nav-background z-depth-1">
		<div class="capa animated fadeIn teal lighten-4" style="background-image: url('{{ asset('img/site/banner/' . rand(1, 2) . '.png') }}');"></div>
		<div class="nav-header">
			<h1>@yield('page-title')</h1>
		</div>
	</div>
@endsection

@section('main')

	<div class="row">
		<div class="col s12">
			<div class="container mt-8 pt-6 pb-6">

				<h4 class="center-align red-text text-darken-2">Missão</h4>

				<p>A nossa missão é fornecer cuidados de saúde acessíveis e de qualidade, buscando constantemente a excelência em cada interação com nossos pacientes. Buscamos oferecer serviços médicos abrangentes, inovadores e personalizados, garantindo que você receba a atenção e os cuidados necessários para manter a sua saúde e bem-estar, e de quem você ama, em todas as fases da vida.</p>

				<h4 class="center-align red-text text-darken-2">Visão</h4>

				<p>Nossa visão é ser a referência em cuidados de saúde, fornecendo serviços de excelência que atendam às necessidades e expectativas de nossos pacientes. Buscamos liderar a transformação digital no setor de saúde, adotando tecnologias inovadoras para tornar os serviços médicos mais acessíveis, convenientes e eficientes. Queremos ser reconhecidos como um parceiro confiável e comprometido em promover a saúde e a qualidade de vida das pessoas.</p>

				<h4 class="center-align red-text text-darken-2">Valores</h4>

				<p><b>Qualidade:</b> Comprometemo-nos em fornecer cuidados de saúde com a mais alta qualidade, mantendo altos padrões de atendimento médico, diagnóstico preciso e tratamentos eficazes. Valorizamos a melhoria contínua e a atualização constante de conhecimentos e práticas para oferecer serviços excepcionais.</p>

				<p><b>Dedicação:</b> Estamos comprometidos em cuidar de você de maneira compassiva, atenciosa e dedicada. Nossa equipe médica e profissionais de saúde trabalham com empatia e respeito, colocando suas necessidades e bem-estar em primeiro lugar.</p>

				<p><b>Acessibilidade:</b> Acreditamos que cuidados de saúde de qualidade devem ser acessíveis a todos. Buscamos remover barreiras físicas e financeiras, oferecendo serviços acessíveis e soluções inovadoras, como a Telemedicina, para garantir que você receba o atendimento de que precisa, quando precisa.</p>

				<p><b>Ética:</b> Mantemos altos padrões éticos em todas as nossas interações. Respeitamos sua privacidade, confidencialidade e autonomia, aderindo aos princípios de ética médica e às regulamentações vigentes.</p>

				<p><b>Colaboração:</b> Valorizamos a colaboração com outros profissionais de saúde e trabalhamos em parceria com você para fornecer uma abordagem integrada e abrangente aos cuidados de saúde. Trabalhamos em conjunto, compartilhando conhecimentos e expertise, para alcançar os melhores resultados para sua saúde e bem-estar.</p>

				<p>Na Médicus24h, nossa missão, visão e valores orientam cada aspecto de nossos serviços. Estamos comprometidos em ser seu parceiro confiável, proporcionando cuidados de saúde excepcionais, em todas as circunstâncias, com dedicação, qualidade e excelência.</p>

				<h4 class="center-align bold red-text text-darken-2">Serviços e Atendimentos</h4>

				<p>
					A <a href="#" class="bold red-text darken-2">Médicus24h</a> possui uma frota completa
					de ambulâncias próprias equipeadas com UTI Móvel com assitência 24 horas.
				</p>
				<p>
					<a href="#" class="bold red-text darken-2">Médicus24h</a> é o programa de assistência domiciliar
					indicado para dar continuidade ao tratamento do paciente, iniciado no Hospital, diminuindo o tempo de permanência
					em ambiente hospitalar e, com isso, reduzindo os riscos de complicações causadas por uma internação prolongada,
					podendo o paciente concluir sua recuperação em seu domicílio.
				</p>

				<p>
					Contando com o atendimento de uma equipe multidisciplinar (Médicos, Enfermeiros, Fisioterapeutas, Fonoaudiólogos,
					Nutricionistas, entre outros), a <a href="#" class="bold red-text darken-2">Médicus24h</a> coloca à disposição de seus usuários.
				</p>
				<p>
					A <a href="#" class="bold red-text darken-2">Médicus24h</a> está disponível para toda Campina Grande
					e João Pessoa, além de diversas cidades do Estado da Paraíba.
				</p>

				<p>
					A assistência domiciliar foi criada como uma alternativa com uma
					forma de atendimento mais humanizado, uma vez que o paciente vai
					estar em seu domicílio, ao lado de seus familiares, recebendo carinho
					e o atendimento necessário ao seu tratamento e recuperação.
				</p>

				<h5 class="bold">Exemplos de Atendimento</h5>

				<p>Além de outros serviços, a <a href="#" class="bold red-text darken-2">Médicus24h</a> oferece, principalmente, os seguites serviços: </p>

				<p>
				<ul class="list-style-dotted">
					<li> Aplicação de antibióticos endovenosos;</li>
					<li> Pacientes que ficaram dependentes de aparelhos ou cuidados especializados;</li>
					<li> Impossibilidade de remoção em carro comum do paciente com necessidade de tratamento especializado;</li>
					<li> Curativos complexos (úlceras, feridas, escaras, etc.);</li>
					<li> Dieta enteral e parenteral orientação para o uso;</li>
					<li> Entre outros.</li>
				</ul>
				</p>

				<p>
					Esses atendimento são prestados através da solicitação do seu médico
					para o Plano de Saúde ou envio de relatório médico através do Hospital
					contendo todos os detalhes do quadro clínico do paciente.
				</p>
				<p>
					Estes pedidos, então, são analisados pelo o seu Plano de Saúde ou por empresas credenciadas
					para a assistência domiciliar e, portanto, caso se enquadre,
					a <a href="#" class="bold red-text darken-2">Médicus24h</a>
					providenciará o início do tratamento na residência da família ou local indicado pelo familiar.
				</p>

				<p>
					Para a implantação do SERVIÇO DE ASSISTÊNCIA DOMICILIAR (SAD), existe a necessidade
					de um cuidador, que é pessoa da família ou indicada por ela, que tenha um papel de grande
					importância no tratamento do paciente, pois ficará responsável pelos cuidados com o
					mesmo.
				</p>

				<p>
					Uma vez reabilitado ou recuperado do quadro agudo, o paciente recebe alta do programa.
					Os cuidados básicos passados para o cuidador ao longo do programa permitirão ao
					paciente uma melhor qualidade de vida.
				</p>

				<p>Confie na Médicus24h para cuidar de você e de sua família, sempre com o compromisso de oferecer o melhor em cuidados de saúde.</p>

				<p>Equipe Médicus24h - Cuidando de você, onde quer que esteja.</p>

			</div>
		</div>
	</div>

@endsection
