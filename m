Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D43A23BE417
	for <lists+linux-rtc@lfdr.de>; Wed,  7 Jul 2021 10:06:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230408AbhGGII6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 7 Jul 2021 04:08:58 -0400
Received: from mo-csw-fb1114.securemx.jp ([210.130.202.173]:58176 "EHLO
        mo-csw-fb.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbhGGII6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 7 Jul 2021 04:08:58 -0400
X-Greylist: delayed 469 seconds by postgrey-1.27 at vger.kernel.org; Wed, 07 Jul 2021 04:08:57 EDT
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1114) id 1677wSEZ007183; Wed, 7 Jul 2021 16:58:31 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1116) id 1677wEfQ030639; Wed, 7 Jul 2021 16:58:14 +0900
X-Iguazu-Qid: 2wGrGpFmX4pftJv46s
X-Iguazu-QSIG: v=2; s=0; t=1625644694; q=2wGrGpFmX4pftJv46s; m=tw1tYhuMell+x59W1aDWo8v1FD0P49mAsBLjtQydl3M=
Received: from imx12-a.toshiba.co.jp (imx12-a.toshiba.co.jp [61.202.160.135])
        by relay.securemx.jp (mx-mr1110) id 1677wD9S020091
        (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
        Wed, 7 Jul 2021 16:58:13 +0900
Received: from enc02.toshiba.co.jp (enc02.toshiba.co.jp [61.202.160.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by imx12-a.toshiba.co.jp (Postfix) with ESMTPS id 333D01000FA;
        Wed,  7 Jul 2021 16:58:13 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 1677wCEq003640;
        Wed, 7 Jul 2021 16:58:13 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH 03/10] rtc: max6900: convert to SPDX identifier
Date:   Wed,  7 Jul 2021 16:57:57 +0900
X-TSB-HOP: ON
Message-Id: <20210707075804.337458-4-nobuhiro1.iwamatsu@toshiba.co.jp>
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
 drivers/rtc/rtc-max6900.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-max6900.c b/drivers/rtc/rtc-max6900.c
index ab60f13fa3ef..4beadfa41644 100644
--- a/drivers/rtc/rtc-max6900.c
+++ b/drivers/rtc/rtc-max6900.c
@@ -1,14 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * rtc class driver for the Maxim MAX6900 chip
  *
+ * Copyright (c) 2007 MontaVista, Software, Inc.
+ *
  * Author: Dale Farnsworth <dale@farnsworth.org>
  *
  * based on previously existing rtc class drivers
- *
- * 2007 (c) MontaVista, Software, Inc.  This file is licensed under
- * the terms of the GNU General Public License version 2.  This program
- * is licensed "as is" without any warranty of any kind, whether express
- * or implied.
  */
 
 #include <linux/module.h>
-- 
2.32.0

