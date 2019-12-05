Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92EA9114466
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Dec 2019 17:07:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726257AbfLEQHG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 5 Dec 2019 11:07:06 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:42562 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbfLEQHG (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 5 Dec 2019 11:07:06 -0500
Received: by mail-pj1-f68.google.com with SMTP id o11so1463721pjp.9;
        Thu, 05 Dec 2019 08:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0EteF4iAsRPHclRrUrgDLpQZXRR6Kg6d9lRSQjCvFTM=;
        b=MwasEGI7lm+mGeCpcG6eU/GbXC7zNqrFuCiJB87Bv7lJ6q2aJsS0HYDmpRLMlUSnqr
         bUH7uorWtXJHy2FK4Zsht6aeU4IUKqqwnZqXstHWd3GAuGh+2N3gtLqJwHkC/4cMwELe
         TGBTIYm8HyoAcyb5tC2dN1UQVgxQuiHpHniL2G1fqOZ/R6OVf+4+qGsuMYxKegG66IJ2
         YXBVIsZfNABYv3Sz4wFzY0T7O3TSMvsnzhbjAXUcVF9SdWMXZEDFPTsPS0jcIVerLj22
         wzKbLoCckcPxFqGApIK4ifdjwT7ETBkDktx5+KbEIahJMKhckepyBFeQaknkWrs1ja12
         So1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0EteF4iAsRPHclRrUrgDLpQZXRR6Kg6d9lRSQjCvFTM=;
        b=Zdvbzf1nN+YR+ROLMej5FwlsNYVSlyTLnH6NuTstmjk904hFb9THuv0MbABfcXlusq
         m09F36s6O0FNRNyJTHs0WPnu+5kOlXyqzsrbk2m4Uz4o+Xpk64xMrdsoKv6ftsfwPgNh
         jNU1LQyGJVkEZ+rA+qL//3P3sxU5MZleHESwBrT6NXgM7y+VafKC90HVVWvYYqfMyhGM
         z09FCw/jrH+siVX586UQWm/hWzqUHEbFDDCbHCmx0OSHwjErm3dfyNpiTguoC9GUCgni
         8G1KLrxR7PEMFW9azgZz9qV+3ZzzBiuGmZ6FUHa76Z3gSKz1fdPOwfFs9tY2tM1DS1u6
         o23g==
X-Gm-Message-State: APjAAAXcK/w7NdOOTFZtI47T0M0f5LPDz4SutaLcSKTGH4DaDLD0LhAi
        EGrnwBHCK/gqHjQbkMwl+bg=
X-Google-Smtp-Source: APXvYqywhPRYNArYzVQFWv+PuF/L2d6dUUNgv5VAlL+Ittq3144uB72j/wDmK/qj00I0S7d386YuRA==
X-Received: by 2002:a17:902:7c0a:: with SMTP id x10mr9926650pll.168.1575562026013;
        Thu, 05 Dec 2019 08:07:06 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id h5sm13877752pfk.30.2019.12.05.08.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2019 08:07:05 -0800 (PST)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-rtc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] rtc: stm32: add missed clk_disable_unprepare in error path of resume
Date:   Fri,  6 Dec 2019 00:06:55 +0800
Message-Id: <20191205160655.32188-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The resume() forgets to call clk_disable_unprepare() when failed.
Add the missed call to fix it.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/rtc/rtc-stm32.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index 781cabb2afca..d774aa18f57a 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -897,8 +897,11 @@ static int stm32_rtc_resume(struct device *dev)
 	}
 
 	ret = stm32_rtc_wait_sync(rtc);
-	if (ret < 0)
+	if (ret < 0) {
+		if (rtc->data->has_pclk)
+			clk_disable_unprepare(rtc->pclk);
 		return ret;
+	}
 
 	if (device_may_wakeup(dev))
 		return disable_irq_wake(rtc->irq_alarm);
-- 
2.24.0

