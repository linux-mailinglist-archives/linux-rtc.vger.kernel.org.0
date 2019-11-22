Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F22F1069E2
	for <lists+linux-rtc@lfdr.de>; Fri, 22 Nov 2019 11:24:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbfKVKY3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 22 Nov 2019 05:24:29 -0500
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:52455 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726546AbfKVKY3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 22 Nov 2019 05:24:29 -0500
X-Originating-IP: 92.184.97.94
Received: from localhost (unknown [92.184.97.94])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id D82131C000E;
        Fri, 22 Nov 2019 10:24:27 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 5/8] rtc: m41t80: remove excess kerneldoc
Date:   Fri, 22 Nov 2019 11:22:09 +0100
Message-Id: <20191122102212.400158-6-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191122102212.400158-1-alexandre.belloni@bootlin.com>
References: <20191122102212.400158-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Fix the following warning:
drivers/rtc/rtc-m41t80.c:716: warning: Excess function parameter 'inode' description in 'wdt_ioctl'

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-m41t80.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index b813295a2eb5..5094a8cf9691 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -702,7 +702,6 @@ static ssize_t wdt_read(struct file *file, char __user *buf,
 
 /**
  *	wdt_ioctl:
- *	@inode: inode of the device
  *	@file: file handle to the device
  *	@cmd: watchdog command
  *	@arg: argument pointer
-- 
2.23.0

