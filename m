Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB258391DE7
	for <lists+linux-rtc@lfdr.de>; Wed, 26 May 2021 19:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235104AbhEZRXH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 26 May 2021 13:23:07 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:36785 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234506AbhEZRWf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 26 May 2021 13:22:35 -0400
Received: from mail-ua1-f71.google.com ([209.85.222.71])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1llxDL-0003cb-9U
        for linux-rtc@vger.kernel.org; Wed, 26 May 2021 17:21:03 +0000
Received: by mail-ua1-f71.google.com with SMTP id k17-20020ab071510000b02902351d1972d8so1087282uao.19
        for <linux-rtc@vger.kernel.org>; Wed, 26 May 2021 10:21:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GmEoQJnYyHa6LUU8eDJ5U1vBJGHUMr9Q2pgbu4Jz5Pw=;
        b=DabhEfyYE071xY9EUegTZBFA7KxAx/Fxgk2QyMsHNkSYNA5f5+mZ2hlveF8aTVM+a3
         F4tvncUh+pNmTqev2IXkGN9Rj6Sb1jd9VaVIqS9r/Z+9NoT982f+hxdyGmZuZLzalkYn
         K1DWmHrNf3sqvjWTNuPZeMh8N1UogZIkLCADX4dB+A2moHWvVIDTy8zDjDNRStAZkpVp
         oDVJtTQ3z1yOdmlVv/TnlZjaoxjPtbUy1S95h7fuDQF/YEhjUPdIEYFBvDiv8vDPxdoG
         yoweap3zbjdKyI9oc8L6fQ1sTRiqay4+zsQvDu8DwQPcFRPWqsVNFc9n6CNPgB4FKb7t
         aQMA==
X-Gm-Message-State: AOAM5315Wky2HcYfUCd3QHXHyCCLOXab7wwZL0OUlJrTCTbey5a93V7J
        qt2rcZ8fYsbE5928vnue2Vn69S7fXk57P/4+4lPq3HipkXH9ejX3fQcCzbUx9APmLEHiLPnrJnV
        Ec1ls7rLXPYYOvuI6uFoTEsDGEW/rd0mdkbqh8A==
X-Received: by 2002:a05:6102:124d:: with SMTP id p13mr32602211vsg.58.1622049662241;
        Wed, 26 May 2021 10:21:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9xh7stKNjLHMO5aPJf5U1x+d8xsFxY3fMgzBN4TM4e3umiNoUIJM1/Sf2sd3i0ilvlipGjw==
X-Received: by 2002:a05:6102:124d:: with SMTP id p13mr32602180vsg.58.1622049661974;
        Wed, 26 May 2021 10:21:01 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.6])
        by smtp.gmail.com with ESMTPSA id u195sm2036032vsc.10.2021.05.26.10.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 10:21:01 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 6/7] power: supply: max17042: Do not enforce (incorrect) interrupt trigger type
Date:   Wed, 26 May 2021 13:20:35 -0400
Message-Id: <20210526172036.183223-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210526172036.183223-1-krzysztof.kozlowski@canonical.com>
References: <20210526172036.183223-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Krzysztof Kozlowski <krzk@kernel.org>

Interrupt line can be configured on different hardware in different way,
even inverted.  Therefore driver should not enforce specific trigger
type - edge falling - but instead rely on Devicetree to configure it.

The Maxim 17047/77693 datasheets describe the interrupt line as active
low with a requirement of acknowledge from the CPU therefore the edge
falling is not correct.

The interrupt line is shared between PMIC and RTC driver, so using level
sensitive interrupt is here especially important to avoid races.  With
an edge configuration in case if first PMIC signals interrupt followed
shortly after by the RTC, the interrupt might not be yet cleared/acked
thus the second one would not be noticed.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. None
---
 drivers/power/supply/max17042_battery.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/max17042_battery.c b/drivers/power/supply/max17042_battery.c
index 1d7326cd8fc6..ce2041b30a06 100644
--- a/drivers/power/supply/max17042_battery.c
+++ b/drivers/power/supply/max17042_battery.c
@@ -1104,7 +1104,7 @@ static int max17042_probe(struct i2c_client *client,
 	}
 
 	if (client->irq) {
-		unsigned int flags = IRQF_TRIGGER_FALLING | IRQF_ONESHOT;
+		unsigned int flags = IRQF_ONESHOT;
 
 		/*
 		 * On ACPI systems the IRQ may be handled by ACPI-event code,
-- 
2.27.0

