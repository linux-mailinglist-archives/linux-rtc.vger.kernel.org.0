Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A0A13BE426
	for <lists+linux-rtc@lfdr.de>; Wed,  7 Jul 2021 10:13:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbhGGIPx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 7 Jul 2021 04:15:53 -0400
Received: from mo-csw-fb1115.securemx.jp ([210.130.202.174]:52694 "EHLO
        mo-csw-fb.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230408AbhGGIPx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 7 Jul 2021 04:15:53 -0400
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1115) id 1677wWXW019270; Wed, 7 Jul 2021 16:58:33 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1115) id 1677wJWu032642; Wed, 7 Jul 2021 16:58:19 +0900
X-Iguazu-Qid: 2wGqimLSq63hP4fWMT
X-Iguazu-QSIG: v=2; s=0; t=1625644699; q=2wGqimLSq63hP4fWMT; m=E1oHAtRpAziOclHynNSi7h3wDnFAIxgOmVLLUVfRId0=
Received: from imx12-a.toshiba.co.jp (imx12-a.toshiba.co.jp [61.202.160.135])
        by relay.securemx.jp (mx-mr1111) id 1677wJso006697
        (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
        Wed, 7 Jul 2021 16:58:19 +0900
Received: from enc02.toshiba.co.jp (enc02.toshiba.co.jp [61.202.160.51])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by imx12-a.toshiba.co.jp (Postfix) with ESMTPS id F28301000B2;
        Wed,  7 Jul 2021 16:58:18 +0900 (JST)
Received: from hop101.toshiba.co.jp ([133.199.85.107])
        by enc02.toshiba.co.jp  with ESMTP id 1677wIqt003723;
        Wed, 7 Jul 2021 16:58:18 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH 09/10] rtc: starfire: convert to SPDX identifier
Date:   Wed,  7 Jul 2021 16:58:03 +0900
X-TSB-HOP: ON
Message-Id: <20210707075804.337458-10-nobuhiro1.iwamatsu@toshiba.co.jp>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210707075804.337458-1-nobuhiro1.iwamatsu@toshiba.co.jp>
References: <20210707075804.337458-1-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Use SPDX-License-Identifier instead of a license line.

Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
 drivers/rtc/rtc-starfire.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-starfire.c b/drivers/rtc/rtc-starfire.c
index fbd1ed41cbf1..ccaef051d6e6 100644
--- a/drivers/rtc/rtc-starfire.c
+++ b/drivers/rtc/rtc-starfire.c
@@ -1,7 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /* rtc-starfire.c: Starfire platform RTC driver.
  *
  * Author: David S. Miller
- * License: GPL
  *
  * Copyright (C) 2008 David S. Miller <davem@davemloft.net>
  */
-- 
2.32.0

