Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B671F30BD34
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Feb 2021 12:36:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbhBBLdP (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 2 Feb 2021 06:33:15 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:42271 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230165AbhBBLae (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 2 Feb 2021 06:30:34 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 394F7E0007;
        Tue,  2 Feb 2021 11:29:47 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 2/2] rtc: s3c: quiet maybe-unused variable warning
Date:   Tue,  2 Feb 2021 12:29:34 +0100
Message-Id: <20210202112934.3612726-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202112934.3612726-1-alexandre.belloni@bootlin.com>
References: <20210202112934.3612726-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

When CONFIG_OF is disabled then the matching table is not referenced.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-s3c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index f07b0c43aafe..e57d3ca70a78 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -558,7 +558,7 @@ static struct s3c_rtc_data const s3c6410_rtc_data = {
 	.disable		= s3c6410_rtc_disable,
 };
 
-static const struct of_device_id s3c_rtc_dt_match[] = {
+static const __maybe_unused struct of_device_id s3c_rtc_dt_match[] = {
 	{
 		.compatible = "samsung,s3c2410-rtc",
 		.data = &s3c2410_rtc_data,
-- 
2.29.2

