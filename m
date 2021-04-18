Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 725873632BC
	for <lists+linux-rtc@lfdr.de>; Sun, 18 Apr 2021 02:00:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbhDRAA6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 17 Apr 2021 20:00:58 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:41911 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230339AbhDRAA5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 17 Apr 2021 20:00:57 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 0018AE0006;
        Sun, 18 Apr 2021 00:00:28 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] rtc: ds1307: remove flags
Date:   Sun, 18 Apr 2021 02:00:22 +0200
Message-Id: <20210418000023.995758-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210418000023.995758-1-alexandre.belloni@bootlin.com>
References: <20210418000023.995758-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

flags is now unused, drop it.

Tested-by: Łukasz Stelmach <l.stelmach@samsung.com>
Reviewed-by: Łukasz Stelmach <l.stelmach@samsung.com>
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

