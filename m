Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51D12F2D4
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Apr 2019 11:28:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727035AbfD3J2g (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 30 Apr 2019 05:28:36 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:46617 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727021AbfD3J2f (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 30 Apr 2019 05:28:35 -0400
X-Originating-IP: 109.213.14.175
Received: from localhost (alyon-652-1-31-175.w109-213.abo.wanadoo.fr [109.213.14.175])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 899642000C;
        Tue, 30 Apr 2019 09:28:32 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Mathieu Malaterre <malat@debian.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2 7/7] rtc: jz4740: convert to SPDX identifier
Date:   Tue, 30 Apr 2019 11:28:21 +0200
Message-Id: <20190430092821.27963-7-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190430092821.27963-1-alexandre.belloni@bootlin.com>
References: <20190430092821.27963-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Use SPDX-License-Identifier instead of a verbose license text.

Tested-by: Mathieu Malaterre <malat@debian.org>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-jz4740.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/rtc/rtc-jz4740.c b/drivers/rtc/rtc-jz4740.c
index 6dd00b654f93..9e7b3a04debc 100644
--- a/drivers/rtc/rtc-jz4740.c
+++ b/drivers/rtc/rtc-jz4740.c
@@ -1,17 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0+
 /*
  *  Copyright (C) 2009-2010, Lars-Peter Clausen <lars@metafoo.de>
  *  Copyright (C) 2010, Paul Cercueil <paul@crapouillou.net>
  *	 JZ4740 SoC RTC driver
- *
- *  This program is free software; you can redistribute it and/or modify it
- *  under  the terms of  the GNU General Public License as published by the
- *  Free Software Foundation;  either version 2 of the License, or (at your
- *  option) any later version.
- *
- *  You should have received a copy of the GNU General Public License along
- *  with this program; if not, write to the Free Software Foundation, Inc.,
- *  675 Mass Ave, Cambridge, MA 02139, USA.
- *
  */
 
 #include <linux/clk.h>
-- 
2.20.1

