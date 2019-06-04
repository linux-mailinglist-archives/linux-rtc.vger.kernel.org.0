Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2150F33DDC
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Jun 2019 06:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbfFDEXx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 4 Jun 2019 00:23:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:38434 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726078AbfFDEXr (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Tue, 4 Jun 2019 00:23:47 -0400
Received: from wens.tw (mirror2.csie.ntu.edu.tw [140.112.30.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8955D23D8E;
        Tue,  4 Jun 2019 04:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559622226;
        bh=TA3ORGPusOAVXEJ7tR/bGFjdPY1t0Xg2lFwT8zhNkb8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=svMGH/MF4gDI8GSS9P8qsFor88Pdh0Nye0AT1FhYmBF2EmCf9Xj7cc26EojX/NLF6
         E+bz9AkmBIczle8sjjt/cgLKKndk3KSwRVTSH1edmYiXENR+QcipT4nQ/9UJmFF3d/
         ZforGa8bb/j7LwPHiHr0XblHFo9XOrxFnJg0CpRQ=
Received: by wens.tw (Postfix, from userid 1000)
        id 7371E5F80C; Tue,  4 Jun 2019 12:23:43 +0800 (CST)
From:   Chen-Yu Tsai <wens@kernel.org>
To:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Chen-Yu Tsai <wens@kernel.org>,
        Vincent Donnefort <vdonnefort@gmail.com>,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 1/3] rtc: pcf8563: Fix interrupt trigger method
Date:   Tue,  4 Jun 2019 12:23:35 +0800
Message-Id: <20190604042337.26129-2-wens@kernel.org>
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

The PCF8563 datasheet says the interrupt line is active low and stays
active until the events are cleared, i.e. a level trigger interrupt.

Fix the flags used to request the interrupt.

Fixes: ede3e9d47cca ("drivers/rtc/rtc-pcf8563.c: add alarm support")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---

Not sure if this would cause issues for other platforms. Ideally we'd
take the flags from the device tree, but it seems not all platforms
support this.

---
 drivers/rtc/rtc-pcf8563.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c
index 3efc86c25d27..e358313466f1 100644
--- a/drivers/rtc/rtc-pcf8563.c
+++ b/drivers/rtc/rtc-pcf8563.c
@@ -605,7 +605,7 @@ static int pcf8563_probe(struct i2c_client *client,
 	if (client->irq > 0) {
 		err = devm_request_threaded_irq(&client->dev, client->irq,
 				NULL, pcf8563_irq,
-				IRQF_SHARED|IRQF_ONESHOT|IRQF_TRIGGER_FALLING,
+				IRQF_SHARED | IRQF_ONESHOT | IRQF_TRIGGER_LOW,
 				pcf8563_driver.driver.name, client);
 		if (err) {
 			dev_err(&client->dev, "unable to request IRQ %d\n",
-- 
2.20.1

