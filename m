Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F413621C46
	for <lists+linux-rtc@lfdr.de>; Tue,  8 Nov 2022 19:44:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234066AbiKHSoz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 8 Nov 2022 13:44:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232556AbiKHSoe (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 8 Nov 2022 13:44:34 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8336C45A04
        for <linux-rtc@vger.kernel.org>; Tue,  8 Nov 2022 10:44:20 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id h133-20020a1c218b000000b003cf4d389c41so2112403wmh.3
        for <linux-rtc@vger.kernel.org>; Tue, 08 Nov 2022 10:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L20WZDfB4Ry2n4XJgPN1jHb78hlwsc6RiwrnFa7B3l8=;
        b=X86Oj3VmY3z3bN2okv+TrWhSiG93o1+Bir6b0bYrqyp135B2umDW7xqcJkVEhTmZ/Z
         MB+gadlvP0VfJtGVAp5at1NLQlI/Q5dFTB2ZeFTNY9KhKetvTIzlDVitWUM/bzArLYWq
         tuM8IJxSMFTMKRa6NzZ+vshthnbkHEe6spYuIXbSIK8AiFYtPY+XM66rxFlOrBk9ommT
         Uye0K15SbIfzFfgRHXGDJME3j3k+sssu/h0VH0g8kQGIzBB9/CtO80Rxjeb1Ckrnt2r7
         WmEozoJR+lxVFcwH36Cba8WYcd9xCx14eNO73I9vB951UVnhLzERbJLmq7UxHPe83dGl
         iQKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L20WZDfB4Ry2n4XJgPN1jHb78hlwsc6RiwrnFa7B3l8=;
        b=yrPZSvLEpK/zFZPYsxgG5V+5/B23/oxIxXXlCIDVTQttDSTQleai6XuR/nEuWZ0lTh
         JjulDNQE5Hd2kYfRJTZR4AJDYdWn8yPemYur24E/jgHsumLOJbShdR48jgjvjZn0/UTe
         YpcqMse5t8+uV+e5xWVVoXtcllWJGM+hnPnzrXME2uLNalJtjBPylrqpay8bkMpEj7jY
         T7KMQ5HjoUmREod7bVLlDXS4yBwcjXIDsy7IPv7UgUDP3mcg4d4imO94luVH5rCRpFK2
         DH6Q1ARzcyKfDSJFkG/qPIc9F7qKHAP9b05oOHyPuK0PzbGsBoz9yMDElgI66AV/Evfe
         xrEg==
X-Gm-Message-State: ACrzQf3DPKdA/Eu+bzzeojYnni1vM3f6rGu3XtTBnMSqs9MForA9x4By
        yD/EApsA+cNmV/g7wfnMcIi+hA==
X-Google-Smtp-Source: AMsMyM5AarrbeV++fniByKtEg7T79sU7xpN3t7OCokfHeIAVTF2NddszH+lHi7AY22w1kclM/wF7Ng==
X-Received: by 2002:a05:600c:33a5:b0:3cf:6fd1:d94b with SMTP id o37-20020a05600c33a500b003cf6fd1d94bmr34657965wmp.52.1667933060018;
        Tue, 08 Nov 2022 10:44:20 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id m6-20020a05600c3b0600b003cf6c2f9513sm13564009wms.2.2022.11.08.10.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 10:44:19 -0800 (PST)
From:   Alexandre Mergnat <amergnat@baylibre.com>
Date:   Tue, 08 Nov 2022 19:43:42 +0100
Subject: [PATCH v4 7/9] arm64: dts: mt8173: change node name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mt6357-support-v4-7-5d2bb58e6087@baylibre.com>
References: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
In-Reply-To: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
To:     Fabien Parent <fabien.parent@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Lee Jones <lee@kernel.org>,
        Chen Zhong <chen.zhong@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     linux-leds@vger.kernel.org,
        Alexandre Mergnat <amergnat@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Fabien Parent <fparent@baylibre.com>,
        linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1290; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=GBaNKrSWOOj3IIbimro7kSOdhFcUdE4vLaUrLB+TgIA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjaqN6jIHrLK5ba/9RboyYvb9OrGAYOnQPvqiWbBzU
 up+6X4SJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY2qjegAKCRArRkmdfjHURRjvD/
 9UtpSjMXT2IvEQImHV2/Je0WrnfGK0wXBLP6+2wFX7Cm13Kz1MYbkybczKtN/pJEkMKc4Wpyt5WNuH
 W85VLgZ9dVoYeWP9jbas1EqFtF/1iuKRNiEM2Fy4PpZ3Qx35kqkdFGsOjGzWeX9e+wevdfdOCAfOCJ
 x+UDnQjULKhVTzyg4oTTIcas78RdGgiVyTKjCt5ZHfbAGkSk+wAjaR9igJ/6YR58lQLolRGekMbu94
 irH5Y7fhDOqZ61gZXpMXBjYSbs7iRzNrBlYhmcPIC1WZMbrpQx7n/d8JiuY3eS+1bdBxi3TBuf9u43
 7uYveEt/BKSarifYxJVE14YO4XMSC7R5mRcCYx32dYzWhur5g27wSN03f35EDjI+zdnlkfUFx1q/lZ
 vkOmirajHD3XiI4urH1wqBdpLUuoJm41YYtvCd2B6VAPEJ9md4r9Ko7IXkvR1BZ+3r7GRToX7YrRLt
 Sf2HdzPmmVXsLC1yt1F/UGwXWqKjLfWiT4FRaN/WTgqLYXTarDtLO5UT2ul1KbrLYvwtuc6OWhbXEc
 J565kVwabYoFdgVCCHmaPSoAUOYwRCshCzbc6cpLDfDKppLJKN1MWzcmsC9K8YLUieuUeJoVvT9KAe
 m5oP/cT9MvTgJjnnKg2Gg0hr/dX7fJ6JjvgG96BiUj+aTrYaei5RPPCnnwEA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

- Change the node name from "mt6397" to "pmic" to be consistent
with mediatek,pwrap.yaml documentation.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 2 +-
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index e21feb85d822..a8f5c48e1782 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -913,7 +913,7 @@ &pwm0 {
 };
 
 &pwrap {
-	pmic: mt6397 {
+	pmic: pmic {
 		compatible = "mediatek,mt6397";
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
index 0b5f154007be..755df5694234 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
@@ -300,7 +300,7 @@ &pwrap {
 	/* Only MT8173 E1 needs USB power domain */
 	power-domains = <&spm MT8173_POWER_DOMAIN_USB>;
 
-	pmic: mt6397 {
+	pmic: pmic {
 		compatible = "mediatek,mt6397";
 		interrupt-parent = <&pio>;
 		interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;

-- 
b4 0.10.1
