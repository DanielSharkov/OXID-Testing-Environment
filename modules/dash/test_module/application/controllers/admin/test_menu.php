<?php

class test_menu extends oxAdminView {
	protected $_sThisTemplate  = 'own_admin_page.tpl';

	public function run() {
		// $data = json_decode(
		// 	file_get_contents('php://input'),
		// 	true,
		// );
		// $code = $data['code'];
		
		// $cfg = oxRegistry::getConfig();
		// $me = $user = $cfg->getUser();
		// $session = $user->getSession();
		// $aOrders = $user->getOrders( 1 )->getArray();
		// $order = $aOrders[0];
		// $basket = $user->getSession()->getBasket();
		// $basket->load();
		// $basket->setPayment("oxidpayadvance");
		// $basket->calculateBasket();

		// $fnc = function ($code) use ($cfg, $me, $session, $order, $basket) {
		// 	return eval($code);
		// };

		// ob_start();
		// echo json_encode([
		// 	'error' => $fnc($code),
		// 	'output' => ob_get_clean(),
		// ]);
		exit;
	}
}