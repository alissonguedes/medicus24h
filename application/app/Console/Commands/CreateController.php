<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class CreateController extends Command
{
	/**
	 * The name and signature of the console command.
	 *
	 * @var string
	 */
	protected $signature = 'app:create-controller {controller}';

	/**
	 * The console command description.
	 *
	 * @var string
	 */
	protected $description = 'Command description';

	/**
	 * Execute the console command.
	 */
	public function handle()
	{
		//

		return 'make:controller ' . $this->argument('controller');
	}
}
