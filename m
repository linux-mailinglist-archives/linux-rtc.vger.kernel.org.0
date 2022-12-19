Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2927650870
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Dec 2022 09:14:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231301AbiLSIOt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 19 Dec 2022 03:14:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbiLSIOs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 19 Dec 2022 03:14:48 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B04BF62DF
        for <linux-rtc@vger.kernel.org>; Mon, 19 Dec 2022 00:14:47 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1p7BIL-0002ZQ-Cm; Mon, 19 Dec 2022 09:14:45 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p7BIK-000I3Z-9y; Mon, 19 Dec 2022 09:14:44 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1p7BIJ-006GNK-D8; Mon, 19 Dec 2022 09:14:43 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] rtc: max8907: Drop unused i2c include
Date:   Mon, 19 Dec 2022 09:14:40 +0100
Message-Id: <20221219081440.1399791-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=615; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=3gcY22onXC6pqIsjCr5MjeYT1AJLPnhjgFMQ8YcZzU8=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjoB1tXzh2jV8APSpcbk4zNjeQ9pmoCWlhICZuGDfJ D5AlVTiJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY6AdbQAKCRDB/BR4rcrsCXpVB/ 0YYrSpDQ3srZHfLqqceO2IwQhU+MdMlIVi29V7Z8hCIsHOQ0i6Cg5PHlroan1lkVlRj8nVTc77NyFT +t+FddzWSqINHDGQrQvwUHGYvh/wBiHvWMaUjkqjnd4Z/6qe590cYXtGhM2gruZpHOOj72hMc5Lf/E AipNOSUjVZau8IXxdCZq6sA2oeLViuiYTLhlLL4uuhSvgc9oi9Ap9h0xtwR5Wugq58d5U8fipPbg04 vu4cAoXKT0VHFKoqZCmjlYTjpLxCvTmDplLICnVpD3ttLSj+y1iyRnISGTtKcxZdPnnISqRWuYCSLe bUmJlSMbdMqofWzRYEQfKtI00KQaOr
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

rtc-max8907 is a platform driver that doesn't use any symbol provided in
<linux/i2c.h>. So drop the include.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/rtc/rtc-max8907.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-max8907.c b/drivers/rtc/rtc-max8907.c
index db3495d10274..af97140dd00a 100644
--- a/drivers/rtc/rtc-max8907.c
+++ b/drivers/rtc/rtc-max8907.c
@@ -9,7 +9,6 @@
  */
 
 #include <linux/bcd.h>
-#include <linux/i2c.h>
 #include <linux/mfd/max8907.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-- 
2.38.1

