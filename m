Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0067B3BE48B
	for <lists+linux-rtc@lfdr.de>; Wed,  7 Jul 2021 10:38:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230130AbhGGIle (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 7 Jul 2021 04:41:34 -0400
Received: from mo-csw-fb1116.securemx.jp ([210.130.202.175]:33250 "EHLO
        mo-csw-fb.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230109AbhGGIld (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 7 Jul 2021 04:41:33 -0400
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1116) id 1677wUC6027573; Wed, 7 Jul 2021 16:58:32 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1116) id 1677wFTE030710; Wed, 7 Jul 2021 16:58:15 +0900
X-Iguazu-Qid: 2wGrbz1dOd5EHNOID6
X-Iguazu-QSIG: v=2; s=0; t=1625644694; q=2wGrbz1dOd5EHNOID6; m=hcg6ZpGyG7383HKkZjOZvYDJI21g9ktLSgOkrXU3nas=
Received: from imx12-a.toshiba.co.jp (imx12-a.toshiba.co.jp [61.202.160.135])
        by relay.securemx.jp (mx-mr1113) id 1677wDK8034530
        (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
        Wed, 7 Jul 2021 16:58:14 +0900
Received: from enc02.toshiba.co.jp (enc02.toshiba.co.jp [61.202.160.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by imx12-a.toshiba.co.jp (Postfix) with ESMTPS id D9D011000B2;
        Wed,  7 Jul 2021 16:58:13 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 1677wDHw003651;
        Wed, 7 Jul 2021 16:58:13 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
Subject: [PATCH 05/10] rtc: sc27xx: Fix format of SPDX identifier
Date:   Wed,  7 Jul 2021 16:57:59 +0900
X-TSB-HOP: ON
Message-Id: <20210707075804.337458-6-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210707075804.337458-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20210707075804.337458-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

For C files, use the C99 format (//).

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Baolin Wang <baolin.wang7@gmail.com>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
 drivers/rtc/rtc-sc27xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-sc27xx.c b/drivers/rtc/rtc-sc27xx.c
index 187aa955b79c..ce7a2ddbbc16 100644
--- a/drivers/rtc/rtc-sc27xx.c
+++ b/drivers/rtc/rtc-sc27xx.c
@@ -1,7 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (C) 2017 Spreadtrum Communications Inc.
  *
- * SPDX-License-Identifier: GPL-2.0
  */
 
 #include <linux/bitops.h>
-- 
2.32.0

