Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3A7D3720E4
	for <lists+linux-rtc@lfdr.de>; Mon,  3 May 2021 21:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229628AbhECTvv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 3 May 2021 15:51:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229582AbhECTvv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 3 May 2021 15:51:51 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CEADC06174A
        for <linux-rtc@vger.kernel.org>; Mon,  3 May 2021 12:50:57 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id a4so6858244wrr.2
        for <linux-rtc@vger.kernel.org>; Mon, 03 May 2021 12:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Va5A8z7PqFlkwfDk4kcsvQKqbabXZRIQXNsljjdIaqw=;
        b=xqVxhScZp596UM4htSphTSlY3zRx5yDFdaIkRITEqc475ieyb9LxSsrsDPHoYMUnf+
         J1WGabgf/7hv/mVdHz0Imo+v21P0/VxKPjJVyiJpBOt9S0j8fmBM2+qVnS6pXAnswCPz
         JfT6NW9B7Na0qYlN/bG3cgdD+dGWRge0h2AeVW72f3O2Rq97D1nMrsy8aqEE/xcvlgcV
         JMCbUujONc6vdts4afBPhvPCdYC2F2w1O8Kg6zHEt+0iSYdV9wxL4ypsETkqT7aDgcAk
         2//Lw7/9fqfDGzmDGTKVAFZvwizAxksxEDzM4vRqMRY7hvEjDBP8fPm7UkMbOxCh8Y/y
         c50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Va5A8z7PqFlkwfDk4kcsvQKqbabXZRIQXNsljjdIaqw=;
        b=UW7+0gwaNl7ZOkeH40/WVX4kaa1GylXP6chKkSxRE51/7uJ2uQvz2TbrqO26eqNH6P
         wUSwht8jU/SE2eOL7hPY85skEkSSZwghIr+JsTdYvWNh6N+zn0i7eU27vaifdiz7/dg5
         5ClXrtEqg1o282DNyCKoy9Gr86mSZjAuTPHvqjVpuX4QtV5WjYFdc31oZuVFOaS+8gOL
         5otoq8j5cXA2i8NgBAOUEybNqngdtHHLra5XdctbYbr/JZ+jXs1kXaUf/8sa68Ab+k3o
         zQqbuEAPexJOzda2Wft8BIjff3QpAB/VRdmbuPsUrRnDJu+hP2O0Ykiq/xmNmXb7FSPC
         5kcQ==
X-Gm-Message-State: AOAM532rJUWSpMuL0DaJz1Lrs13bLHnTf4f88MSRLdTO5wYGmyWDZLYf
        pU/P/lbkGrYQy1pCTOJYJX67jX9HQvgyckWp
X-Google-Smtp-Source: ABdhPJwiRQQddS1SJSJ2r9Ir8k3r0m9m1WZOKg2f4l5A7JI5A0NqQTU9a5ajuyiydOr8Dx3ZVep8mg==
X-Received: by 2002:adf:fd0c:: with SMTP id e12mr3671044wrr.324.1620071456216;
        Mon, 03 May 2021 12:50:56 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id d5sm13989429wrv.43.2021.05.03.12.50.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 12:50:55 -0700 (PDT)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     alexandre.belloni@bootlin.com, a.zummo@towertech.it,
        linus.walleij@linaro.org, robh+dt@kernel.org,
        ulli.kroll@googlemail.com
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 2/2] ARM: dts: gemini: use the right rtc compatible
Date:   Mon,  3 May 2021 19:50:48 +0000
Message-Id: <20210503195048.1575007-2-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210503195048.1575007-1-clabbe@baylibre.com>
References: <20210503195048.1575007-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The rtc compatible was not following the dt-binding.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/arm/boot/dts/gemini.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/gemini.dtsi b/arch/arm/boot/dts/gemini.dtsi
index 9b4e5cf0ff5c..46071b46418a 100644
--- a/arch/arm/boot/dts/gemini.dtsi
+++ b/arch/arm/boot/dts/gemini.dtsi
@@ -191,7 +191,7 @@ timer@43000000 {
 		};
 
 		rtc@45000000 {
-			compatible = "cortina,gemini-rtc";
+			compatible = "cortina,gemini-rtc", "faraday,ftrtc010";
 			reg = <0x45000000 0x100>;
 			interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
 			resets = <&syscon GEMINI_RESET_RTC>;
-- 
2.26.3

