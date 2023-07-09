<?php

namespace App\Http\Middleware {

	use App\Models\ModuloModel;
	use Closure;
	use Illuminate\Http\Request;
	use Illuminate\Support\Facades\Route;
	use Illuminate\Support\Facades\Session;

	class CheckSession
	{

		public function handle(Request $request, Closure $redirector)
		{

			$modulo = new ModuloModel();

			// $current_url = explode('/', request()->getPathInfo());

			// if (count($current_url) > 0) {
			// 	foreach ($current_url as $ind => $val) {
			// 		if (!empty($current_url[$ind])) {
			// 			$current_url = $current_url[$ind];
			// 			break;
			// 		}
			// 	}
			// }

			$current_url = request()->path();

			// 	$current_route = Route::currentRouteAction();
			// $current_route = explode('@', $current_route);
			// $name          = Route::currentRouteName();
			// $modulo_path   = request()->path();
			// $current_url   = str_replace('/', '%2F', $modulo_path);
			// $path        = explode('/', $modulo_path);
			// $path_modulo = '/' . $path[0];
			// $controller  = $current_route[0];
			// $action      = $current_route[1];
			// $current_url = $path_modulo;

			// $is_restrict_module     = $modulo->getIsRestrictModulo($path_modulo);
			// $is_restrict_controller = $modulo->getIsRestrictController($controller);
			// $is_restrict_route      = $modulo->getIsRestrictRoute($controller, $action, $name);

			// if (!Session::exists('userdata')) {

			// 	if ($is_restrict_module || $is_restrict_controller || $is_restrict_route) {

			// 		// return redirect()->route('account.auth.login')->with('url', $current_url);
			// 		return redirect()->route('account.auth.login', $current_url);

			// 	}

			$current_route = Route::currentRouteAction();
			$current_route = explode('@', $current_route);
			$controller    = $current_route[0];
			$action        = $current_route[1];
			$name          = Route::currentRouteName();
			$request_path  = request()->path();
			$path          = explode('/', $request_path);
			$path          = '/' . $path[0];

			$is_restrict_module     = $modulo->getIsRestrictModulo($path);
			$is_restrict_controller = $modulo->getIsRestrictController($controller);
			$is_restrict_route      = $modulo->getIsRestrictRoute($controller, $action, $name);

			if (!Session::exists('userdata')) {

				if ($is_restrict_module || $is_restrict_controller || $is_restrict_route) {

					$url = limpa_string($current_url, '-');
					return redirect()->route('account.auth.login', $url);

				}

			} else {

				if ($is_restrict_module) {

					if (session()->exists('userdata') && session()->exists('app_session')) {

						$id_grupo = session()->get('userdata')[session()->get('app_session')]['id_grupo'];
						$modulo   = $modulo->getModuloById($path);
						$status   = isset($modulo) ? $modulo->status : null;

						$is_active = $status === '1' || $id_grupo === 1;

						if (!$is_active) {
							abort(403);
						}

					}

				}
				Session::forget('curl');

			}

			return $redirector($request);

		}

	}

}
