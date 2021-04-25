Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E04B736A7E2
	for <lists+linux-rtc@lfdr.de>; Sun, 25 Apr 2021 17:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbhDYPIV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 25 Apr 2021 11:08:21 -0400
Received: from smtp-35-i2.italiaonline.it ([213.209.12.35]:43393 "EHLO
        libero.it" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230244AbhDYPIU (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sun, 25 Apr 2021 11:08:20 -0400
X-Greylist: delayed 489 seconds by postgrey-1.27 at vger.kernel.org; Sun, 25 Apr 2021 11:08:20 EDT
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([95.244.94.151])
        by smtp-35.iol.local with ESMTPA
        id agEHlY8ippK9wagELlbBD1; Sun, 25 Apr 2021 16:59:29 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
        t=1619362769; bh=IebJ39rC3YsAS5xcTpDkg4gCO5NahbB0WbaWRAFj/w4=;
        h=From;
        b=oI/jhgzhNFHHxfSRzm4moPnc+TMttR9dCsrmmz1prn9aelKJ2ywgpN4BgAR6/+CST
         /KpJfRuEAkVaZk1cctJ5ToVEOyK4h4u2+BQRfd5fOy5NT+VVZ+0h/dt7dX05AOISJp
         rPyP/pRb7W1cBYecT7CXKBWX8uKAEhCaNF1YBC5BgKs9g3tO5m5hDwdXLPip0qTKw1
         TPQjFnXbxuhZk7QzPW062V9AOINBEobnO6onv5JGsR7YJvbV90CAe6shJjeA0x+aNK
         z+2YjHg+/qfbcyLV+AkE25Mae4ksKaYHBnq5CaovdKveEbu+z0o9nqosVQrTX5nnrZ
         FKRsYXFqTwg7A==
X-CNFS-Analysis: v=2.4 cv=A9ipg4aG c=1 sm=1 tr=0 ts=608583d1 cx=a_exe
 a=ugxisoNCKEotYwafST++Mw==:117 a=ugxisoNCKEotYwafST++Mw==:17
 a=VTExqAix1d_2lDZdMv4A:9
From:   Dario Binacchi <dariobin@libero.it>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dariobin@libero.it>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Subject: [PATCH] rtc: omap: use rtc_write to access OMAP_RTC_OSC_REG
Date:   Sun, 25 Apr 2021 16:59:23 +0200
Message-Id: <20210425145924.23353-1-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
X-CMAE-Envelope: MS4xfCmwAtpzgqSBvqvD0wrg6fFGgfB/GIyon6Zwfi9hzuSo4XorEh2Uu0oeSMcmQzSO6erot9c9HHPVfjNd8K+YZ0/MugbNYBEyVPGAWiq+D9bD/krMBwAu
 IVXsOnUFy3cuUZFGjDUpguLDPWX9FQ1eDcf7ipCQoeBTMU5G4qOMwZTpPb7mRduhUQcCKnlZZZUX2+2G6vtiG4T3jQxQn2hIVgCldyST7rgnkZpKs0UAJK5j
 IRfRrdP1+TS/CeFLRf0aqV7KDqdY7JvBKSXAiPmsLfb3H94e1bVo4jq+RfKiK2UjoDNr2iT1qQvioijKzCg99nogPNWdpjFsWmpRV+u25Pf5BLY5r5QIvc8/
 TYJEPwUbnZRooJbVhijvejWl0YTBe3AqsIIcE2W3IdaLLkywc5A=
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The RTC_OSC_REG register is 32-bit, but the useful information is found
in the 7 least significant bits (bits 7-31 are reserved). And in fact,
as you can see from the code, all read accesses are 8-bit, as well as
some writes. Let's make sure all writes are 8-bit. Moreover, in contexts
where consecutive reads / writes after the busy check must take place
within 15 us, it is better not to waste time on useless accesses.

Signed-off-by: Dario Binacchi <dariobin@libero.it>
---

 drivers/rtc/rtc-omap.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-omap.c b/drivers/rtc/rtc-omap.c
index dc7db2477f88..d46e0f0cc502 100644
--- a/drivers/rtc/rtc-omap.c
+++ b/drivers/rtc/rtc-omap.c
@@ -786,8 +786,7 @@ static int omap_rtc_probe(struct platform_device *pdev)
 	/* enable RTC functional clock */
 	if (rtc->type->has_32kclk_en) {
 		reg = rtc_read(rtc, OMAP_RTC_OSC_REG);
-		rtc_writel(rtc, OMAP_RTC_OSC_REG,
-				reg | OMAP_RTC_OSC_32KCLK_EN);
+		rtc_write(rtc, OMAP_RTC_OSC_REG, reg | OMAP_RTC_OSC_32KCLK_EN);
 	}
 
 	/* clear old status */
@@ -845,7 +844,7 @@ static int omap_rtc_probe(struct platform_device *pdev)
 		reg = rtc_read(rtc, OMAP_RTC_OSC_REG);
 		reg &= ~OMAP_RTC_OSC_OSC32K_GZ_DISABLE;
 		reg |= OMAP_RTC_OSC_32KCLK_EN | OMAP_RTC_OSC_SEL_32KCLK_SRC;
-		rtc_writel(rtc, OMAP_RTC_OSC_REG, reg);
+		rtc_write(rtc, OMAP_RTC_OSC_REG, reg);
 	}
 
 	rtc->type->lock(rtc);
-- 
2.17.1

