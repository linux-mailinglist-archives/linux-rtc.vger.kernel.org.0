Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C61E107ADD
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Nov 2019 23:52:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726762AbfKVWwO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 22 Nov 2019 17:52:14 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:43516 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbfKVWwO (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 22 Nov 2019 17:52:14 -0500
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1iYHmd-0007Lc-5R; Fri, 22 Nov 2019 22:52:11 +0000
From:   Colin King <colin.king@canonical.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Kevin Hilman <khilman@baylibre.com>, linux-rtc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] rtc: meson: remove redundant assignment to variable retries
Date:   Fri, 22 Nov 2019 22:52:10 +0000
Message-Id: <20191122225210.109172-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The variable retries is being initialized with a value that is never
read and it is being updated later with a new value in a for-loop.
The initialization is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/rtc/rtc-meson.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-meson.c b/drivers/rtc/rtc-meson.c
index 9bd8478db34b..47ebcf834cc2 100644
--- a/drivers/rtc/rtc-meson.c
+++ b/drivers/rtc/rtc-meson.c
@@ -131,7 +131,7 @@ static u32 meson_rtc_get_data(struct meson_rtc *rtc)
 
 static int meson_rtc_get_bus(struct meson_rtc *rtc)
 {
-	int ret, retries = 3;
+	int ret, retries;
 	u32 val;
 
 	/* prepare bus for transfers, set all lines low */
-- 
2.24.0

