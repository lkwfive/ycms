<?php
class BaseCommand extends CConsoleCommand
{
    protected function println($message, $level = 'info')
    {
        echo '[', date('Y-m-d H:i:s'), ']', "[{$level}]", $message, PHP_EOL;
    }
}