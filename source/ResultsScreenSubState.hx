package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.addons.transition.FlxTransitionableState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

class ResultsScreenSubState extends MusicBeatSubstate {
	var background:FlxSprite;
	var resultsText:FlxText;
	var results:FlxText;
	var songNameText:FlxText;
	var difficultyNameTxt:FlxText;
	var judgementCounterTxt:FlxText;
	var pressEnterTxt:FlxText;
	var pressEnterTxtSine:Float = 0;

	public var iconPlayer1:HealthIcon;
	public var iconPlayer2:HealthIcon;

	public function new(daResults:Array<Int>, campaignScore:Int, songMisses:Int, ratingPercent:Float, ratingName:String) {
		super();

		background = new FlxSprite(-80).loadGraphic(Paths.image('menuDesat'));
		background.color = 0xFF353535;
		background.scrollFactor.set();
		background.updateHitbox();
		background.screenCenter();
		background.alpha = 0;
		background.antialiasing = ClientPrefs.globalAntialiasing;
		add(background);

		resultsText = new FlxText(5, 0, 0, 'RESULTADOS', 72);
		resultsText.scrollFactor.set();
		if (ClientPrefs.gameStyle == 'SB Engine') {
			resultsText.setFormat("Bahnschrift", 48, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		}

		if (ClientPrefs.gameStyle == 'Psych Engine') {
			resultsText.setFormat("VCR OSD Mono", 48, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		}

		if (ClientPrefs.gameStyle == 'Better UI') {
			resultsText.setFormat("VCR OSD Mono", 48, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		}

		resultsText.updateHitbox();
		add(resultsText);

		results = new FlxText(5, resultsText.height, FlxG.width, '', 48);
		if (ClientPrefs.gameStyle == 'SB Engine') {
			results.text = 'Sicks: ' + daResults[0] + '\nGoods: ' + daResults[1] + '\nBads: ' + daResults[2] + '\nFreaks: ' + daResults[3];
		}

		if (ClientPrefs.gameStyle == 'Psych Engine') {
			results.text = 'Sicks: ' + daResults[0] + '\nGoods: ' + daResults[1] + '\nBads: ' + daResults[2] + '\n####s: ' + daResults[3];
		}

		if (ClientPrefs.gameStyle == 'Better UI') {
			results.text = 'Sicks: ' + daResults[0] + '\nGoods: ' + daResults[1] + '\nBads: ' + daResults[2] + '\n####s: ' + daResults[3];
		}

		results.scrollFactor.set();
		if (ClientPrefs.gameStyle == 'SB Engine') {
			results.setFormat("Bahnschrift", 24, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		}

		if (ClientPrefs.gameStyle == 'Psych Engine') {
			results.setFormat("VCR OSD Mono", 24, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		}

		if (ClientPrefs.gameStyle == 'Better UI') {
			results.setFormat("VCR OSD Mono", 24, FlxColor.WHITE, LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		}

		results.updateHitbox();
		add(results);

		songNameText = new FlxText(0, 155, 0, '', 124);
		songNameText.text = "Song: " + PlayState.SONG.song;
		songNameText.scrollFactor.set();
		if (ClientPrefs.gameStyle == 'SB Engine') {
			songNameText.setFormat("Bahnschrift", 72, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		}

		if (ClientPrefs.gameStyle == 'Psych Engine') {
			songNameText.setFormat("VCR OSD Mono", 48, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		}

		if (ClientPrefs.gameStyle == 'Better UI') {
			songNameText.setFormat("VCR OSD Mono", 48, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		}

		songNameText.updateHitbox();
		songNameText.screenCenter(X);
		add(songNameText);

		difficultyNameTxt = new FlxText(0, 155 + songNameText.height, 0, '', 100);
		difficultyNameTxt.text = "Difficulty: " + CoolUtil.difficultyString();
		difficultyNameTxt.scrollFactor.set();
		if (ClientPrefs.gameStyle == 'SB Engine') {
			difficultyNameTxt.setFormat("Bahnschrift", 48, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		}

		if (ClientPrefs.gameStyle == 'Psych Engine') {
			difficultyNameTxt.setFormat("VCR OSD Mono", 48, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		}

		if (ClientPrefs.gameStyle == 'Better UI') {
			difficultyNameTxt.setFormat("VCR OSD Mono", 48, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		}

		difficultyNameTxt.updateHitbox();
		difficultyNameTxt.screenCenter(X);
		add(difficultyNameTxt);

		judgementCounterTxt = new FlxText(0, difficultyNameTxt.y + difficultyNameTxt.height + 45, FlxG.width, '', 86);
		judgementCounterTxt.text = 'Pontuação: ' + campaignScore + '\nErros: ' + songMisses + '\nPrecisão: ' + ratingPercent + '%\nAvaliação: ' + ratingName;
		judgementCounterTxt.scrollFactor.set();
		if (ClientPrefs.gameStyle == 'SB Engine') {
			judgementCounterTxt.setFormat("Bahnschrift", 36, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		}

		if (ClientPrefs.gameStyle == 'Psych Engine') {
			judgementCounterTxt.setFormat("VCR OSD Mono", 36, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		}

		if (ClientPrefs.gameStyle == 'Better UI') {
			judgementCounterTxt.setFormat("VCR OSD Mono", 36, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		}

		judgementCounterTxt.updateHitbox();
		judgementCounterTxt.screenCenter(X);
		add(judgementCounterTxt);

		#if android
		pressEnterTxt = new FlxText(400, 650, FlxG.width - 800, "[Tap on A button to continue]", 32);
		#else
		pressEnterTxt = new FlxText(400, 650, FlxG.width - 800, "[Press ENTER to continue]", 32);
		#end
		if (ClientPrefs.gameStyle == 'SB Engine') {
			pressEnterTxt.setFormat("Bahnschrift", 30, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		}

		if (ClientPrefs.gameStyle == 'Psych Engine') {
			pressEnterTxt.setFormat("VCR OSD Mono", 30, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		}

		if (ClientPrefs.gameStyle == 'Better UI') {
			pressEnterTxt.setFormat("VCR OSD Mono", 30, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		}

		pressEnterTxt.scrollFactor.set();
		pressEnterTxt.visible = true;
		add(pressEnterTxt);

		iconPlayer1 = new HealthIcon(PlayState.instance.boyfriend.healthIcon, true);
		iconPlayer1.setGraphicSize(Std.int(iconPlayer1.width * 1.2));
		iconPlayer1.updateHitbox();
		add(iconPlayer1);

		iconPlayer2 = new HealthIcon(PlayState.instance.dad.healthIcon, false);
		iconPlayer2.setGraphicSize(Std.int(iconPlayer2.width * 1.2));
		iconPlayer2.updateHitbox();
		add(iconPlayer2);

		resultsText.alpha = 0;
		results.alpha = 0;
		songNameText.alpha = 0;
		difficultyNameTxt.alpha = 0;
		judgementCounterTxt.alpha = 0;
		iconPlayer1.alpha = 0;
		iconPlayer2.alpha = 0;
		pressEnterTxt.alpha = 0;

		iconPlayer1.setPosition(FlxG.width - iconPlayer1.width - 10, FlxG.height - iconPlayer1.height - 15);
		iconPlayer2.setPosition(10, iconPlayer1.y);

		FlxTween.tween(background, {alpha: 1}, 0.4, {ease: FlxEase.quartInOut});
		FlxTween.tween(resultsText, {alpha: 1, y: 5}, 0.4, {ease: FlxEase.quartInOut, startDelay: 0.2});
		FlxTween.tween(songNameText, {alpha: 1, y: songNameText.y + 5}, 0.4, {ease: FlxEase.quartInOut, startDelay: 0.2});
		FlxTween.tween(difficultyNameTxt, {alpha: 1, y: difficultyNameTxt.y + 5}, 0.4, {ease: FlxEase.quartInOut, startDelay: 0.4});
		FlxTween.tween(results, {alpha: 1, y: results.y + 5}, 0.4, {ease: FlxEase.quartInOut, startDelay: 0.6});
		FlxTween.tween(judgementCounterTxt, {alpha: 1, y: judgementCounterTxt.y + 5}, 0.4, {ease: FlxEase.quartInOut, startDelay: 0.6});
		FlxTween.tween(iconPlayer1, {alpha: 1, y: FlxG.height - iconPlayer1.height - 5}, 0.4, {ease: FlxEase.quartInOut, startDelay: 0.8});
		FlxTween.tween(iconPlayer2, {alpha: 1, y: FlxG.height - iconPlayer2.height - 5}, 0.4, {ease: FlxEase.quartInOut, startDelay: 0.8});
		FlxTween.tween(pressEnterTxt, {alpha: 1}, 0.4, {ease: FlxEase.quartInOut, startDelay: 0.10});

		cameras = [FlxG.cameras.list[FlxG.cameras.list.length - 1]];

		#if android
		addVirtualPad(NONE, A);
		#end
	}

	override function update(elapsed:Float) {
		super.update(elapsed);

		if (pressEnterTxt.visible) {
			pressEnterTxtSine += 150 * elapsed;
			pressEnterTxt.alpha = 1 - Math.sin((Math.PI * pressEnterTxtSine) / 150);
		}

		if (controls.ACCEPT) {
			if (PlayState.isStoryMode)
				MusicBeatState.switchState(new StoryModeState());
			else
				MusicBeatState.switchState(new FreeplayState());
			FlxG.sound.playMusic(Paths.music('freakyMenu'));
		}
	}
}
