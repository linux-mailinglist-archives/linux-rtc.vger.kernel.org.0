Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 400BB390CA
	for <lists+linux-rtc@lfdr.de>; Fri,  7 Jun 2019 17:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728247AbfFGPyr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 7 Jun 2019 11:54:47 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:58506 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729293AbfFGPyr (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 7 Jun 2019 11:54:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1559922885; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:references; bh=vxBqAc96EhZ4PSZvc1D8uQDGXjEbUQwnCFYwSOLsi0g=;
        b=eHbx2qJx4yi3WXwd2S/9fgnqwkhFpgGCIQx8ZE7jjc+xD088BN55f7hx3cE4zREhIPqw81
        lJj+Gh7LxLHkC4c4WfC9Cr1p3aDEtdQnTpXFDoxDz26xQWjrGzFot9MAerdTcW60kd+ols
        BULH75jKY5N9WPgFrFWbFnTZeBnBSWA=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     od@zcrc.me, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] rtc: jz4740: Make probe function __init_or_module
Date:   Fri,  7 Jun 2019 17:54:38 +0200
Message-Id: <20190607155438.14342-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This allows the probe function to be dropped after the kernel finished
its initialization, in the case where the driver was not compiled as a
module.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/rtc/rtc-jz4740.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-jz4740.c b/drivers/rtc/rtc-jz4740.c
index 9e7b3a04debc..a20e7dc794dd 100644
--- a/drivers/rtc/rtc-jz4740.c
+++ b/drivers/rtc/rtc-jz4740.c
@@ -303,7 +303,7 @@ static const struct of_device_id jz4740_rtc_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, jz4740_rtc_of_match);
 
-static int jz4740_rtc_probe(struct platform_device *pdev)
+static int __init_or_module jz4740_rtc_probe(struct platform_device *pdev)
 {
 	int ret;
 	struct jz4740_rtc *rtc;
-- 
2.21.0.593.g511ec345e18

