<?php #if (!defined('PmWiki')) exit();

/**
 * Use Markdown Markup in PmWiki
 *
 * @author Sebastian Siedentopf <schlaefer@macnews.de>
 * @version 2021-06-07
 * @link http://www.pmwiki.org/wiki/Cookbook/MarkdownMarkupExtension
 * @copyright by the respective authors 2006
 * @license http://www.gnu.org/copyleft/gpl.html GNU General Public License
 * @package markdown
 *
 * Version 0.2 and later by Said Achmiz
 * Parsedown version by Sasha Epona
 */

$RecipeInfo['Markdown Markup Extension']['Version'] = '2021-06-07';

Markup("markdown", '<include', "/\(:markdown:\)(.*?)[\n]?\(:markdownend:\)/s", "MarkdownMarkupConversion");

function MarkdownMarkupConversion($m) {
	$text = $m[1];

	$astr = array (
			"<:vspace>" => "\n\n",
			"(:nl:)" => "\n",
			"&gt;" => ">",
			"&lt;" => "<",
		);
	$pstr = array(
 			"/<p>/" => "<p class='vspace'>",
			"/&amp;(.*?);/" => "&\\1;",
		);

	$text = str_replace(array_keys($astr), $astr, $text);

	include_once("parsedown.php");

	$parser = new Parsedown();
	$parser->setSafeMode(true);

	$text = $parser->text($text);
	$text = preg_replace(array_keys($pstr), $pstr, $text);

	return Keep($text);
}
