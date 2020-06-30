Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFA3B20EB86
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jun 2020 04:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726019AbgF3Cmy (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 29 Jun 2020 22:42:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725988AbgF3Cmx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 29 Jun 2020 22:42:53 -0400
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com [IPv6:2607:f8b0:4864:20::741])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7452DC061755
        for <linux-rtc@vger.kernel.org>; Mon, 29 Jun 2020 19:42:53 -0700 (PDT)
Received: by mail-qk1-x741.google.com with SMTP id 145so14802293qke.9
        for <linux-rtc@vger.kernel.org>; Mon, 29 Jun 2020 19:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kzMOI2FalN2XEXf+523kcQqbwXn88Tbm44oIjmhHlCo=;
        b=qgmiKecTRV1KuR+t+tPFQCizvyIZNcYKt8QkJD3zP67Z7xgK4JcTZLZcAWTEWsW1bc
         frqzhTDUqMQP7QtZjLqT1ypRFzJ5X+WoIr79PO1XNm8OXrUtKkPPG3VRYeKbiUYt29ZX
         srNv/oFbRuh3fj/Nofq7LsKdBABRP79kX5neK+7c0O0Pv9f6wCI40ksXn6y9CXwXqmyW
         rTyF/1VHZz42/4LyGnysWrqoR2NmLQjh4oXgEAjn8QhKr0nkOaBDlzz4mBcbEPJS+2WI
         mhfRF+tXun+eEKWoqamFbf2RmVnrOyR72abnKBJfHDaVFPvy9yLidWmbtm/9cx0qjIIH
         +d8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kzMOI2FalN2XEXf+523kcQqbwXn88Tbm44oIjmhHlCo=;
        b=N685IRHw1rLtX8gu2F8g4iFhHQsPt3QW95QD3Lw0258OBjb01HG2YcwSt/viIJAzXi
         frOrxu9xsAxYtvHdPZBzZ9js58zdx88b/+qJMGkuSVo/iGD60Btn0C8jXAL1yRfutC4U
         AAd292UM4LViG5fuFoWtEhlEud7xepvvkyOIDO97MZ2+NDURtFMVLe87ILsDkhlWH7Fq
         jaax5j0MhCBKZZODD/NpHM+QaUfNE50sEYx3AqXohGfy0Y2e/V25WlHv7O6SWSxiiOZE
         Hx+xY6yl7FYkUKTAoO1O2LDAFmlGYT8nZYGvfgQ3ipL8Zx3Hntlds18/QWS4ddrPqxXV
         1BfA==
X-Gm-Message-State: AOAM533bHJbCh5ME+1i7s6eQ8L6t3TsmAuMkX13q7fZ8OGtXdRr7ddwr
        h79nS2sJo2UJA+4t02HGhmY=
X-Google-Smtp-Source: ABdhPJwi8l0gD3Cs36fsT8Kc9u3cS2vf1jlxxLUBg7m6j+YU0P9ucLPseIzTxRi7YFfkeI1o8m6uPw==
X-Received: by 2002:a37:b842:: with SMTP id i63mr16841744qkf.365.1593484972746;
        Mon, 29 Jun 2020 19:42:52 -0700 (PDT)
Received: from localhost.localdomain (198-48-202-89.cpe.pppoe.ca. [198.48.202.89])
        by smtp.gmail.com with ESMTPSA id p66sm1911185qkf.58.2020.06.29.19.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 19:42:52 -0700 (PDT)
From:   Liam Beguin <liambeguin@gmail.com>
To:     bruno.thomsen@gmail.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org
Subject: [PATCH v4 0/2] rtc: pcf2127: add alarm support
Date:   Mon, 29 Jun 2020 22:42:09 -0400
Message-Id: <20200630024211.12782-1-liambeguin@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Liam Beguin <lvb@xiphos.com>

The board used to test this series has the interrupt line of the RTC
connected to a circuit controlling the power of the board.
An event on the interrupt line while the board is off will power it on.
Because of these hardware limitations, the irq handler added in this
patch wasn't fully tested.

The alarm fuctionality was tested on a PCA2129, with:

	$ date "2010-10-10 10:10"
	Sun Oct 10 10:10:00 UTC 2010
	$ /usr/sbin/rtcwake -u -d /dev/rtc0  -s10 --mode off
	[ ... ]
	$ # power on after 10 seconds

Changes since v1:
- Document new compatible string for the pca2129
- Add calls to pcf2127_wdt_active_ping after accessing CTRL2
- Use sizeof(buf) instead of hadcoding value
- Cleanup debug trace
- Add interrupt handler and wakeup-source devicetree option

Changes since v2:
- Rebase on latest mainline tree
- Remove redundant if in pcf2127_rtc_alarm_irq_enable
- Remove duplicate watchdog ping in pcf2127_rtc_irq
- Avoid forward declaration
- Remove dev_err strings
- Remove dev_dbg traces since they are now part of the core
- Avoid unnecessary read in pcf2127_rtc_irq with regmap_write
- Add extra rtc_class_ops struct with alarm functions

Changes since v3:
- Replace "goto irq_err" with "return IRQ_NONE" in interrupt handler
- Add Reviewed-by trailers

Liam Beguin (2):
  rtc: pcf2127: add pca2129 device id
  rtc: pcf2127: add alarm support

 .../devicetree/bindings/rtc/trivial-rtc.yaml  |   2 +
 drivers/rtc/rtc-pcf2127.c                     | 137 ++++++++++++++++++
 2 files changed, 139 insertions(+)

Interdiff against v3:
diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index df09d3c6c5c3..4e99c45a87d7 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -416,7 +416,7 @@ static irqreturn_t pcf2127_rtc_irq(int irq, void *dev)
 
 	ret = regmap_read(pcf2127->regmap, PCF2127_REG_CTRL2, &ctrl2);
 	if (ret)
-		goto irq_err;
+		return IRQ_NONE;
 
 	if (ctrl2 & PCF2127_BIT_CTRL2_AF) {
 		regmap_write(pcf2127->regmap, PCF2127_REG_CTRL2,
@@ -427,11 +427,9 @@ static irqreturn_t pcf2127_rtc_irq(int irq, void *dev)
 
 	ret = pcf2127_wdt_active_ping(&pcf2127->wdd);
 	if (ret)
-		goto irq_err;
+		return IRQ_NONE;
 
 	return IRQ_HANDLED;
-irq_err:
-	return IRQ_NONE;
 }
 
 static const struct rtc_class_ops pcf2127_rtc_alrm_ops = {

base-commit: 7c30b859a947535f2213277e827d7ac7dcff9c84
-- 
2.27.0

