Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FCFB365E1C
	for <lists+linux-rtc@lfdr.de>; Tue, 20 Apr 2021 19:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233355AbhDTRDV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 20 Apr 2021 13:03:21 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50133 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233247AbhDTRDV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 20 Apr 2021 13:03:21 -0400
Received: from mail-ed1-f71.google.com ([209.85.208.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYtlw-0004bU-Se
        for linux-rtc@vger.kernel.org; Tue, 20 Apr 2021 17:02:48 +0000
Received: by mail-ed1-f71.google.com with SMTP id p16-20020a0564021550b029038522733b66so5402334edx.11
        for <linux-rtc@vger.kernel.org>; Tue, 20 Apr 2021 10:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rjka4Njemna1OOKJdcZeeFwVYEY/9hgKuOFFKuvjSYE=;
        b=E8Ysqb8CRmz4V1OqOVsCsiM9kJFKj0MMBcyxWD6zNP/TKqInmyhgjI9t7d62U0EKCT
         cAZa0bkIBckbg5OhXq7EK137b/qLMgD8AcOTzg7xPIY0TN2UaDURVGPwc5CQZAf9k/4C
         YSv5evImilAk3QFQ9+ylZATaBRXUTURP9gJtr4Zneib7whlLi09G82TAht+BUJpRBvt9
         mil8RipiN4LjvpodUTm4TbKH9kuqi7EqdGbQStJWwmXgVl3bHjjwEPfI5sL5KxQFWbVp
         PBRrvmA6lBuV/Oz9TeZR/WNQC8N6gkT0E5wi0aztv8Jm9yxMgDPMVplsN16uxPTLvnbO
         xxuQ==
X-Gm-Message-State: AOAM531uDuBBMlbNLtygRRcvfWIJUZ6aN7z64tFDNIqi6WT4vF2/kW1N
        eQn6OFebcO2i5lSpMJQLT9Ok93KGsuVDM97saa1PpFV74I0EqaFuc6p0YJhOmcuyhLl6bjQJmtK
        EYWwPSkIwhki5GPy8hvB4mxKGNNLU+1r+zaAVlA==
X-Received: by 2002:a17:907:33cb:: with SMTP id zk11mr29272728ejb.231.1618938168644;
        Tue, 20 Apr 2021 10:02:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEptLquhZ2/QqZ4X/5o6u/BOlY7S9w9blCK0zCE6EhdECvGDYJS8VhGVzjFSaiOFlOBW2WUw==
X-Received: by 2002:a17:907:33cb:: with SMTP id zk11mr29272709ejb.231.1618938168470;
        Tue, 20 Apr 2021 10:02:48 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id s20sm16590714edu.93.2021.04.20.10.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 10:02:48 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-rtc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH 6/9] mfd: sec: Remove unused platform data members
Date:   Tue, 20 Apr 2021 19:02:41 +0200
Message-Id: <20210420170244.13467-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420170244.13467-1-krzysztof.kozlowski@canonical.com>
References: <20210420170118.12788-1-krzysztof.kozlowski@canonical.com>
 <20210420170244.13467-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The Samsung PMIC drivers for early chipsets like S5M8767 stored quite a
lot in platform data (struct sec_platform_data).  The s5m8767 regulator
driver currently references only some of its fields.  Newer regulator
drivers (e.g. s2mps11) use even less platform data fields.

Clean up the structure to reduce memory footprint and source code size.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 include/linux/mfd/samsung/core.h | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index b0d049a56d16..f92fe090473d 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -80,8 +80,6 @@ struct sec_platform_data {
 	struct sec_opmode_data		*opmode;
 	int				num_regulators;
 
-	bool				buck_voltage_lock;
-
 	int				buck_gpios[3];
 	int				buck_ds[3];
 	unsigned int			buck2_voltage[8];
@@ -91,35 +89,12 @@ struct sec_platform_data {
 	unsigned int			buck4_voltage[8];
 	bool				buck4_gpiodvs;
 
-	int				buck_set1;
-	int				buck_set2;
-	int				buck_set3;
-	int				buck2_enable;
-	int				buck3_enable;
-	int				buck4_enable;
 	int				buck_default_idx;
-	int				buck2_default_idx;
-	int				buck3_default_idx;
-	int				buck4_default_idx;
-
 	int				buck_ramp_delay;
 
-	int				buck2_ramp_delay;
-	int				buck34_ramp_delay;
-	int				buck5_ramp_delay;
-	int				buck16_ramp_delay;
-	int				buck7810_ramp_delay;
-	int				buck9_ramp_delay;
-	int				buck24_ramp_delay;
-	int				buck3_ramp_delay;
-	int				buck7_ramp_delay;
-	int				buck8910_ramp_delay;
-
-	bool				buck1_ramp_enable;
 	bool				buck2_ramp_enable;
 	bool				buck3_ramp_enable;
 	bool				buck4_ramp_enable;
-	bool				buck6_ramp_enable;
 
 	int				buck2_init;
 	int				buck3_init;
-- 
2.25.1

