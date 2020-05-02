Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 739301C2621
	for <lists+linux-rtc@lfdr.de>; Sat,  2 May 2020 16:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728302AbgEBO1I (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 2 May 2020 10:27:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:58306 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728020AbgEBO1H (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Sat, 2 May 2020 10:27:07 -0400
Received: from localhost (p5486C608.dip0.t-ipconnect.de [84.134.198.8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7ABDA2496B;
        Sat,  2 May 2020 14:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588429627;
        bh=SWAgqFjQtH+44KzNB37D3YGOf7TBc55dGtMgscD5tck=;
        h=From:To:Cc:Subject:Date:From;
        b=R/cAwhPZR5OcZx2udyqGygLoioE2/RPOjZzU81BkV1Bbxd4/Xsd3lQuOESkBKbeoe
         284fPMtqJeVoN8K6AWgWiNHhxmLhAuQG1B0cV/WN4jip15NVyRez4zUmHvLg+t3SwX
         M6zp+ufgHWECupQ8pCJWfoVhieunt71VFxl4tBPI=
From:   Wolfram Sang <wsa@kernel.org>
To:     linux-kernel@vger.kernel.org
Cc:     kernel@pengutronix.de, Wolfram Sang <wsa@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        linux-rtc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] rtc: stmp3xxx: update contact email
Date:   Sat,  2 May 2020 16:27:04 +0200
Message-Id: <20200502142704.19308-1-wsa@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The 'pengutronix' address is defunct for years. Use the proper contact
address.

Signed-off-by: Wolfram Sang <wsa@kernel.org>
---
 drivers/rtc/rtc-stmp3xxx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-stmp3xxx.c b/drivers/rtc/rtc-stmp3xxx.c
index ff6488be385f..c9bc3d4a1e66 100644
--- a/drivers/rtc/rtc-stmp3xxx.c
+++ b/drivers/rtc/rtc-stmp3xxx.c
@@ -416,5 +416,5 @@ module_platform_driver(stmp3xxx_rtcdrv);
 
 MODULE_DESCRIPTION("STMP3xxx RTC Driver");
 MODULE_AUTHOR("dmitry pervushin <dpervushin@embeddedalley.com> and "
-		"Wolfram Sang <w.sang@pengutronix.de>");
+		"Wolfram Sang <kernel@pengutronix.de>");
 MODULE_LICENSE("GPL");
-- 
2.20.1

