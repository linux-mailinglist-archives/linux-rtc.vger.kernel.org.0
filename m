Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C27773BE44A
	for <lists+linux-rtc@lfdr.de>; Wed,  7 Jul 2021 10:23:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230086AbhGGI0Y (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 7 Jul 2021 04:26:24 -0400
Received: from mo-csw-fb1514.securemx.jp ([210.130.202.170]:35992 "EHLO
        mo-csw-fb.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbhGGI0X (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 7 Jul 2021 04:26:23 -0400
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1514) id 1677wS7p011245; Wed, 7 Jul 2021 16:58:30 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1514) id 1677wE03004169; Wed, 7 Jul 2021 16:58:14 +0900
X-Iguazu-Qid: 34tMM6Vudaq7rQ3udD
X-Iguazu-QSIG: v=2; s=0; t=1625644694; q=34tMM6Vudaq7rQ3udD; m=7REmO1iOV2LTTDt8ZCl92NgRByBobWuv1M4ns7B+XjE=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
        by relay.securemx.jp (mx-mr1513) id 1677wDtp040787
        (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
        Wed, 7 Jul 2021 16:58:14 +0900
Received: from enc01.toshiba.co.jp (enc01.toshiba.co.jp [106.186.93.100])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by imx2-a.toshiba.co.jp (Postfix) with ESMTPS id CBCC81000B3;
        Wed,  7 Jul 2021 16:58:13 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc01.toshiba.co.jp  with ESMTP id 1677wDFX013844;
        Wed, 7 Jul 2021 16:58:13 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH 02/10] rtc: ds1374: convert to SPDX identifier
Date:   Wed,  7 Jul 2021 16:57:56 +0900
X-TSB-HOP: ON
Message-Id: <20210707075804.337458-3-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210707075804.337458-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20210707075804.337458-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Use SPDX-License-Identifier instead of a verbose license text.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
 drivers/rtc/rtc-ds1374.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-ds1374.c b/drivers/rtc/rtc-ds1374.c
index fab79921a712..8db5a631bca8 100644
--- a/drivers/rtc/rtc-ds1374.c
+++ b/drivers/rtc/rtc-ds1374.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * RTC client/driver for the Maxim/Dallas DS1374 Real-Time Clock over I2C
  *
@@ -6,11 +7,7 @@
  *
  * Copyright (C) 2014 Rose Technology
  * Copyright (C) 2006-2007 Freescale Semiconductor
- *
- * 2005 (c) MontaVista Software, Inc. This file is licensed under
- * the terms of the GNU General Public License version 2. This program
- * is licensed "as is" without any warranty of any kind, whether express
- * or implied.
+ * Copyright (c) 2005 MontaVista Software, Inc.
  */
 /*
  * It would be more efficient to use i2c msgs/i2c_transfer directly but, as
-- 
2.32.0

