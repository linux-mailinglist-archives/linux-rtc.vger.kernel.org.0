Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B103BF303
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Apr 2019 11:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727128AbfD3JdQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 30 Apr 2019 05:33:16 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:56211 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727077AbfD3JdM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 30 Apr 2019 05:33:12 -0400
X-Originating-IP: 109.213.14.175
Received: from localhost (alyon-652-1-31-175.w109-213.abo.wanadoo.fr [109.213.14.175])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id A4AB71BF213;
        Tue, 30 Apr 2019 09:33:10 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 4/4] rtc: pcap: convert to SPDX identifier
Date:   Tue, 30 Apr 2019 11:33:02 +0200
Message-Id: <20190430093302.28648-4-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190430093302.28648-1-alexandre.belloni@bootlin.com>
References: <20190430093302.28648-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Use SPDX-License-Identifier instead of a verbose license text.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcap.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-pcap.c b/drivers/rtc/rtc-pcap.c
index d424339f7abb..178bfb1dea21 100644
--- a/drivers/rtc/rtc-pcap.c
+++ b/drivers/rtc/rtc-pcap.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  *  pcap rtc code for Motorola EZX phones
  *
@@ -5,11 +6,6 @@
  *  Copyright (c) 2009 Daniel Ribeiro <drwyrm@gmail.com>
  *
  *  Based on Motorola's rtc.c Copyright (c) 2003-2005 Motorola
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License version 2 as
- *  published by the Free Software Foundation.
- *
  */
 
 #include <linux/kernel.h>
-- 
2.20.1

