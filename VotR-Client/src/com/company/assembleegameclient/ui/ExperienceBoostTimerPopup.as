﻿package com.company.assembleegameclient.ui {
import com.company.assembleegameclient.ui.components.TimerDisplay;

import flash.display.Sprite;
import flash.filters.DropShadowFilter;

import kabam.rotmg.text.view.TextFieldDisplayConcrete;

public class ExperienceBoostTimerPopup extends Sprite {

    private var timerDisplay:TimerDisplay;
    private var textField:TextFieldDisplayConcrete;

    public function ExperienceBoostTimerPopup() {
        this.textField = this.returnTimerTextField();
        this.textField.x = 5;
        this.timerDisplay = new TimerDisplay(this.textField);
        addChild(this.timerDisplay);
        this.timerDisplay.update(100000);
        graphics.lineStyle(2, 0xFFFFFF);
        graphics.beginFill(0x363636);
        graphics.drawRoundRect(0, 0, 150, 25, 10);
        filters = [new DropShadowFilter(0, 0, 0, 1, 16, 16, 1)];
    }

    public function update(_arg1:Number):void {
        this.timerDisplay.update(_arg1);
    }

    private function returnTimerTextField():TextFieldDisplayConcrete {
        var _local1:TextFieldDisplayConcrete;
        _local1 = new TextFieldDisplayConcrete().setSize(16).setColor(16777103);
        _local1.setBold(true);
        _local1.setMultiLine(true);
        _local1.mouseEnabled = true;
        _local1.filters = [new DropShadowFilter(0, 0, 0)];
        return (_local1);
    }


}
}
