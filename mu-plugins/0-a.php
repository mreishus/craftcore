<?php
function ll($msg) {
	$log_dir = '/var/www/html/tmp/logs';
	if (!is_dir($log_dir)) {
		return;
	}
	/* if (!is_dir($log_dir)) { */
	/* 	mkdir($log_dir, 0777, true); */
	/* } */
	$log_file = $log_dir . '/1.log';

	$max_size = 1048576; // 1MB in bytes

	if (file_exists($log_file) && filesize($log_file) > $max_size) {
		file_put_contents($log_file, '');
	}

	$formatted_msg = '[' . date('Y-m-d H:i:s') . '] ' . print_r($msg, true) . PHP_EOL;
	file_put_contents($log_file, $formatted_msg, FILE_APPEND);
}

ll('This is a test message.');
