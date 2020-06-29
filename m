Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8125520E010
	for <lists+linux-rtc@lfdr.de>; Mon, 29 Jun 2020 23:56:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389500AbgF2Umb (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 29 Jun 2020 16:42:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731649AbgF2TOE (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 29 Jun 2020 15:14:04 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC09AC0068C6;
        Mon, 29 Jun 2020 04:41:30 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: sre)
        with ESMTPSA id 3B2052A22FB
Received: by jupiter.universe (Postfix, from userid 1000)
        id F3F54480103; Mon, 29 Jun 2020 13:41:26 +0200 (CEST)
From:   Sebastian Reichel <sebastian.reichel@collabora.com>
To:     Sebastian Reichel <sre@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Dev Null <devnull@uvos.xyz>
Cc:     Tony Lindgren <tony@atomide.com>, Pavel Machek <pavel@ucw.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        "Sicelo A . Mhlongo" <absicsz@gmail.com>
Subject: [PATCH] rtc: cpcap: fix range
Date:   Mon, 29 Jun 2020 13:41:23 +0200
Message-Id: <20200629114123.27956-1-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200629002917.0a2045380a0fe022f852e067@uvos.xyz>
References: <20200629002917.0a2045380a0fe022f852e067@uvos.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Unbreak CPCAP driver, which has one more bit in the day counter
increasing the max. range from 2014 to 2058. The original commit
introducing the range limit was obviously wrong, since the driver
has only been written in 2017 (3 years after 14 bits would have
run out).

Reported-by: Sicelo A. Mhlongo <absicsz@gmail.com>
Reported-by: Dev Null <devnull@uvos.xyz>
Fixes: d2377f8cc5a7 ("rtc: cpcap: set range")
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/rtc/rtc-cpcap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-cpcap.c b/drivers/rtc/rtc-cpcap.c
index a603f1f21125..800667d73a6f 100644
--- a/drivers/rtc/rtc-cpcap.c
+++ b/drivers/rtc/rtc-cpcap.c
@@ -261,7 +261,7 @@ static int cpcap_rtc_probe(struct platform_device *pdev)
 		return PTR_ERR(rtc->rtc_dev);
 
 	rtc->rtc_dev->ops = &cpcap_rtc_ops;
-	rtc->rtc_dev->range_max = (1 << 14) * SECS_PER_DAY - 1;
+	rtc->rtc_dev->range_max = (timeu64_t) (DAY_MASK + 1) * SECS_PER_DAY - 1;
 
 	err = cpcap_get_vendor(dev, rtc->regmap, &rtc->vendor);
 	if (err)
-- 
2.27.0

