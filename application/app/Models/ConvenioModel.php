<?php

namespace App\Models{

	use Illuminate\Foundation\Auth\User as Authenticatable;

	class ConvenioModel extends Authenticatable
	{

		// use HasApiTokens, HasFactory, Notifiable;

		protected $table = 'tb_convenio';

		/**
		 * The attributes that are mass assignable.
		 *
		 * @var array<int, string>
		 */
		protected $fillable = [
			'name',
			'email',
			'password',
		];

		/**
		 * The attributes that should be hidden for serialization.
		 *
		 * @var array<int, string>
		 */
		protected $hidden = [
			'password',
			'remember_token',
		];

		/**
		 * The attributes that should be cast.
		 *
		 * @var array<string, string>
		 */
		protected $casts = [
			'email_verified_at' => 'datetime',
		];

		public $timestamps = false;

		public function getConvenio($id = null)
		{

			$get = $this->select('*');

			if (!is_array($id)) {
				if (!is_null($id)) {
					return $get->where('id', $id)
						->get()
						->first();
				}
			} else {

				foreach ($id as $ind => $val) {
					if (is_array($val)) {
						foreach ($val as $i => $v) {
							$get->where($ind, $i, $v);
						}
					}
				}

			}

			// if (!is_null($id)) {
			// 	$get = $get->where('id', $id);
			// }
			// $get = $get->whereNull('id_parent');

			return $get->get();

		}

		public function getTipoConvenio($id = null, $id_convenio = null)
		{

			$get = $this->select('*');

			$get->from('tb_convenio_planos');

			if (!is_null($id)) {
				$get->where('id', $id);
			}

			if (!is_null($id_convenio)) {
				$get->where('id_convenio', $id_convenio);
			}

			return $get->get();
		}

		public function getAcomodacao($id = null)
		{

			$get = $this->select('*')
				->from('tb_acomodacao');

			if (!is_null($id)) {
				$get = $get->where('id', $id);
			}

			return $get->get();

		}

	}

}
