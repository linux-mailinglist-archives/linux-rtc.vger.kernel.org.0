Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D3573BE48A
	for <lists+linux-rtc@lfdr.de>; Wed,  7 Jul 2021 10:38:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbhGGIl0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 7 Jul 2021 04:41:26 -0400
Received: from mo-csw-fb1116.securemx.jp ([210.130.202.175]:33238 "EHLO
        mo-csw-fb.securemx.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230109AbhGGIlZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 7 Jul 2021 04:41:25 -0400
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1116) id 1677wS9Q027572; Wed, 7 Jul 2021 16:58:31 +0900
Received: by mo-csw.securemx.jp (mx-mo-csw1114) id 1677wFC6026026; Wed, 7 Jul 2021 16:58:15 +0900
X-Iguazu-Qid: 2wGrNQa8ex8XOtab7g
X-Iguazu-QSIG: v=2; s=0; t=1625644694; q=2wGrNQa8ex8XOtab7g; m=or7j7XyhI4JvBL4LnmYNEJ0i7hkPo48cDOGZKA3O/oE=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
        by relay.securemx.jp (mx-mr1113) id 1677wDkg034531
        (version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
        Wed, 7 Jul 2021 16:58:14 +0900
Received: from enc01.toshiba.co.jp (enc01.toshiba.co.jp [106.186.93.100])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by imx2-a.toshiba.co.jp (Postfix) with ESMTPS id DCCFA1000B7;
        Wed,  7 Jul 2021 16:58:13 +0900 (JST)
Received: from hop001.toshiba.co.jp ([133.199.164.63])
        by enc01.toshiba.co.jp  with ESMTP id 1677wD7f013847;
        Wed, 7 Jul 2021 16:58:13 +0900
From:   Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Subject: [PATCH 04/10] rtc: palmas: convert to SPDX identifier
Date:   Wed,  7 Jul 2021 16:57:58 +0900
X-TSB-HOP: ON
Message-Id: <20210707075804.337458-5-nobuhiro1.iwamatsu@toshiba.co.jp>
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
 drivers/rtc/rtc-palmas.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/rtc/rtc-palmas.c b/drivers/rtc/rtc-palmas.c
index 4bcfb88674d3..67571f7f0bbc 100644
--- a/drivers/rtc/rtc-palmas.c
+++ b/drivers/rtc/rtc-palmas.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * rtc-palmas.c -- Palmas Real Time Clock driver.
 
@@ -7,20 +8,6 @@
  * Copyright (c) 2012, NVIDIA Corporation.
  *
  * Author: Laxman Dewangan <ldewangan@nvidia.com>
- *
- * This program is free software; you can redistribute it and/or
- * modify it under the terms of the GNU General Public License as
- * published by the Free Software Foundation version 2.
- *
- * This program is distributed "as is" WITHOUT ANY WARRANTY of any kind,
- * whether express or implied; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
- * General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA
- * 02111-1307, USA
  */
 
 #include <linux/bcd.h>
-- 
2.32.0

