Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C63B9ACF4
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Aug 2019 12:18:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387905AbfHWKS3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 23 Aug 2019 06:18:29 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:38634 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732509AbfHWKS3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 23 Aug 2019 06:18:29 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1i16eG-0005xF-88; Fri, 23 Aug 2019 10:18:24 +0000
From:   Colin King <colin.king@canonical.com>
To:     Biwen Li <biwen.li@nxp.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][rtc-next] rtc: fsl: fix spelling mistake: "memery" -> "memory"
Date:   Fri, 23 Aug 2019 11:18:23 +0100
Message-Id: <20190823101823.18402-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/rtc/rtc-fsl-ftm-alarm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-fsl-ftm-alarm.c b/drivers/rtc/rtc-fsl-ftm-alarm.c
index 4f7259c2d6a3..4bb98310cc3f 100644
--- a/drivers/rtc/rtc-fsl-ftm-alarm.c
+++ b/drivers/rtc/rtc-fsl-ftm-alarm.c
@@ -255,7 +255,7 @@ static int ftm_rtc_probe(struct platform_device *pdev)
 
 	rtc = devm_kzalloc(&pdev->dev, sizeof(*rtc), GFP_KERNEL);
 	if (unlikely(!rtc)) {
-		dev_err(&pdev->dev, "cannot alloc memery for rtc\n");
+		dev_err(&pdev->dev, "cannot alloc memory for rtc\n");
 		return -ENOMEM;
 	}
 
-- 
2.20.1

