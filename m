Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACDF334DCC8
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Mar 2021 02:04:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbhC3AEG (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 29 Mar 2021 20:04:06 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:53627 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230212AbhC3AD7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 29 Mar 2021 20:03:59 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id A7DD9FF803;
        Tue, 30 Mar 2021 00:03:57 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Lukasz Stelmach <l.stelmach@samsung.com>
Cc:     linux-rtc@vger.kernel.org,
        =?UTF-8?q?Bart=C5=82omiej=20=C5=BBolnierkiewicz?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 2/3] rtc: ds1307: remove flags
Date:   Tue, 30 Mar 2021 02:03:42 +0200
Message-Id: <20210330000343.801566-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210330000343.801566-1-alexandre.belloni@bootlin.com>
References: <YGJqfVFVb7Z1LBTu@piout.net>
 <20210330000343.801566-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

flags is now unused, drop it.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-ds1307.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 76d67c419f7d..089509d0a3a0 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -169,8 +169,6 @@ enum ds_type {
 
 struct ds1307 {
 	enum ds_type		type;
-	unsigned long		flags;
-#define HAS_NVRAM	0		/* bit 0 == sysfs file active */
 	struct device		*dev;
 	struct regmap		*regmap;
 	const char		*name;
-- 
2.30.2

