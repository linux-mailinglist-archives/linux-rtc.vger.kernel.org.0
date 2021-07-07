Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 162E43BE43E
	for <lists+linux-rtc@lfdr.de>; Wed,  7 Jul 2021 10:19:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230074AbhGGIWe (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 7 Jul 2021 04:22:34 -0400
Received: from mo-csw-fb1114.securemx.jp ([210.130.202.173]:34918 "EHLO
        mo-csw-fb.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229975AbhGGIWe (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 7 Jul 2021 04:22:34 -0400
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1114) id 1677wSnH007182; Wed, 7 Jul 2021 16:58:32 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1116) id 1677wEgR030644; Wed, 7 Jul 2021 16:58:14 +0900
X-Iguazu-Qid: 2wGrTXt2PgRvnGLXhT
X-Iguazu-QSIG: v=2; s=0; t=1625644694; q=2wGrTXt2PgRvnGLXhT; m=EQQVnsR2xnOkcwSsewmhYiSMWJ21zQr8r+vshjmAwa8=
Received: from imx12-a.toshiba.co.jp (imx12-a.toshiba.co.jp [61.202.160.135])
        by relay.securemx.jp (mx-mr1113) id 1677wCGh034481
        (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
        Wed, 7 Jul 2021 16:58:13 +0900
Received: from enc02.toshiba.co.jp (enc02.toshiba.co.jp [61.202.160.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by imx12-a.toshiba.co.jp (Postfix) with ESMTPS id EAA231000F0;
        Wed,  7 Jul 2021 16:58:12 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 1677wCLJ003635;
        Wed, 7 Jul 2021 16:58:12 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH 01/10] rtc: au1xxx: convert to SPDX identifier
Date:   Wed,  7 Jul 2021 16:57:55 +0900
X-TSB-HOP: ON
Message-Id: <20210707075804.337458-2-nobuhiro1.iwamatsu@toshiba.co.jp>
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
 drivers/rtc/rtc-au1xxx.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-au1xxx.c b/drivers/rtc/rtc-au1xxx.c
index e6428b27b5d4..630ea5de6871 100644
--- a/drivers/rtc/rtc-au1xxx.c
+++ b/drivers/rtc/rtc-au1xxx.c
@@ -1,11 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Au1xxx counter0 (aka Time-Of-Year counter) RTC interface driver.
  *
  * Copyright (C) 2008 Manuel Lauss <mano@roarinelk.homelinux.net>
- *
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
  */
 
 /* All current Au1xxx SoCs have 2 counters fed by an external 32.768 kHz
-- 
2.32.0

