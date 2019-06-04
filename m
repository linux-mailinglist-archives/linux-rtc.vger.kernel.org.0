Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFB5C33DD7
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Jun 2019 06:23:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbfFDEXr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 4 Jun 2019 00:23:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:38462 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726286AbfFDEXr (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 4 Jun 2019 00:23:47 -0400
Received: from wens.tw (mirror2.csie.ntu.edu.tw [140.112.30.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A779A24B35;
        Tue,  4 Jun 2019 04:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559622226;
        bh=yqUxi72cn1v3RF2Lmp76OrRJen60rKvo6j12vc0QZgg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Qxh797YMgBBIdnhM38VPWd4XptoS7s+5V+9jb9asjHs9ZyRMeayka9YgsZm6kZEl8
         1e10CXDcznefASbmL3beJTTe5ezhQ77C+Sf1qqSSIjtCXQvR6Dc+e9J4Hu+o0670WK
         NYbXWVQWQWBN7pgJ/9+XY7NzP1+7FDDXLEJvGat8=
Received: by wens.tw (Postfix, from userid 1000)
        id 7CE025FD5F; Tue,  4 Jun 2019 12:23:43 +0800 (CST)
From:   Chen-Yu Tsai <wens@kernel.org>
To:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Chen-Yu Tsai <wens@kernel.org>,
        Vincent Donnefort <vdonnefort@gmail.com>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 2/3] rtc: pcf8563: Clear event flags and disable interrupts before requesting irq
Date:   Tue,  4 Jun 2019 12:23:36 +0800
Message-Id: <20190604042337.26129-3-wens@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190604042337.26129-1-wens@kernel.org>
References: <20190604042337.26129-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

Besides the alarm, the PCF8563 also has a timer triggered interrupt.
In cases where the previous system left the timer and interrupts on,
or somehow the bits got enabled, the interrupt would keep triggering
as the kernel doesn't know about it.

Clear both the alarm and timer event flags, and disable the interrupts,
before requesting the interrupt line.

Fixes: ede3e9d47cca ("drivers/rtc/rtc-pcf8563.c: add alarm support")
Fixes: a45d528aab8b ("rtc: pcf8563: clear expired alarm at boot time")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/rtc/rtc-pcf8563.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c
index e358313466f1..d8adf69b6697 100644
--- a/drivers/rtc/rtc-pcf8563.c
+++ b/drivers/rtc/rtc-pcf8563.c
@@ -563,7 +563,6 @@ static int pcf8563_probe(struct i2c_client *client,
 	struct pcf8563 *pcf8563;
 	int err;
 	unsigned char buf;
-	unsigned char alm_pending;
 
 	dev_dbg(&client->dev, "%s\n", __func__);
 
@@ -587,13 +586,13 @@ static int pcf8563_probe(struct i2c_client *client,
 		return err;
 	}
 
-	err = pcf8563_get_alarm_mode(client, NULL, &alm_pending);
-	if (err) {
-		dev_err(&client->dev, "%s: read error\n", __func__);
+	/* Clear flags and disable interrupts */
+	buf = 0;
+	err = pcf8563_write_block_data(client, PCF8563_REG_ST2, 1, &buf);
+	if (err < 0) {
+		dev_err(&client->dev, "%s: write error\n", __func__);
 		return err;
 	}
-	if (alm_pending)
-		pcf8563_set_alarm_mode(client, 0);
 
 	pcf8563->rtc = devm_rtc_device_register(&client->dev,
 				pcf8563_driver.driver.name,
-- 
2.20.1

