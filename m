Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 622F141B114
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Sep 2021 15:47:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240995AbhI1Nsj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 28 Sep 2021 09:48:39 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:45458
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241007AbhI1Nsf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 28 Sep 2021 09:48:35 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 19D29405E4;
        Tue, 28 Sep 2021 13:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632836815;
        bh=CVPzKw2Lf6fMiEtRUXtIUtsODqt2nAe+y+A62+2Z9IY=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=DSXRZ0wptf2RiwWyAD0QPn2zdUgT89tEBpTwHBqCgEPUx48yTDEulxBLFXUCgpICR
         tyZJKsR+RUsxjSTytHcs6u/Vg7q9b75ycMuuVTICwi9Attq658OoC8bak2feTQFX9c
         h7GVZiR8+MJuFNvP9m/PJ6j91YF+/3jMw208n/QuA2IGg1BGwN/36KitkUzRiR3Vqm
         8SCigiokb9y+ZWIigeBfQg9BVCLRH2ye4cQ0TyowvL1rmppSPFZakhmcDDpKg5tXz9
         pJCKf1pDSRGOu38clY9lxfOjMHNOtxBMRWBXHzG33GvCBkw2B5VO7l1xvsIGMR4xGz
         TbazDNZNjvcaA==
From:   Colin King <colin.king@canonical.com>
To:     Daniel Palmer <daniel@thingy.jp>,
        Romain Perier <romain.perier@gmail.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
        linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next][V2] rtc: msc313: Fix unintentional sign extension issues with left shift of a u16
Date:   Tue, 28 Sep 2021 14:46:54 +0100
Message-Id: <20210928134654.991923-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Shifting the u16 value returned by readw by 16 bits to the left
will be promoted to a 32 bit signed int and then sign-extended
to an unsigned long. If the top bit of the readw is set then
the shifted value will be sign extended and the top 32 bits of
the result will be set.

Fixes: be7d9c9161b9 ("rtc: Add support for the MSTAR MSC313 RTC")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
V2: Fix identical issue in msc313_rtc_read_time too. Thanks to Daniel Palmer
    for noticing this ommission.
---
 drivers/rtc/rtc-msc313.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-msc313.c b/drivers/rtc/rtc-msc313.c
index 5f178d29cfd8..f3fde013c4b8 100644
--- a/drivers/rtc/rtc-msc313.c
+++ b/drivers/rtc/rtc-msc313.c
@@ -53,7 +53,7 @@ static int msc313_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 	unsigned long seconds;
 
 	seconds = readw(priv->rtc_base + REG_RTC_MATCH_VAL_L)
-			| (readw(priv->rtc_base + REG_RTC_MATCH_VAL_H) << 16);
+			| ((unsigned long)readw(priv->rtc_base + REG_RTC_MATCH_VAL_H) << 16);
 
 	rtc_time64_to_tm(seconds, &alarm->time);
 
@@ -122,7 +122,7 @@ static int msc313_rtc_read_time(struct device *dev, struct rtc_time *tm)
 		udelay(1);
 
 	seconds = readw(priv->rtc_base + REG_RTC_CNT_VAL_L)
-			| (readw(priv->rtc_base + REG_RTC_CNT_VAL_H) << 16);
+			| ((unsigned long)readw(priv->rtc_base + REG_RTC_CNT_VAL_H) << 16);
 
 	rtc_time64_to_tm(seconds, tm);
 
-- 
2.32.0

