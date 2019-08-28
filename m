Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADF3FA0BDA
	for <lists+linux-rtc@lfdr.de>; Wed, 28 Aug 2019 22:51:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726764AbfH1UvF (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 28 Aug 2019 16:51:05 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:57861 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726713AbfH1UvE (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 28 Aug 2019 16:51:04 -0400
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id C7C6F200004;
        Wed, 28 Aug 2019 20:51:02 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Anson.Huang@nxp.com,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 1/2] rtc: snvs: set range
Date:   Wed, 28 Aug 2019 22:50:55 +0200
Message-Id: <20190828205056.31321-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The SNVS is a 47-bit counter incremented at 32768Hz, it is then a 32-bit
second counter.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-snvs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-snvs.c b/drivers/rtc/rtc-snvs.c
index 4f9a107a0427..50dd4b8492eb 100644
--- a/drivers/rtc/rtc-snvs.c
+++ b/drivers/rtc/rtc-snvs.c
@@ -348,6 +348,7 @@ static int snvs_rtc_probe(struct platform_device *pdev)
 	}
 
 	data->rtc->ops = &snvs_rtc_ops;
+	data->rtc->range_max = U32_MAX;
 	ret = rtc_register_device(data->rtc);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register rtc: %d\n", ret);
-- 
2.21.0

