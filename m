Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 347DD432309
	for <lists+linux-rtc@lfdr.de>; Mon, 18 Oct 2021 17:37:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231915AbhJRPjN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 18 Oct 2021 11:39:13 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:57371 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231741AbhJRPjM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 18 Oct 2021 11:39:12 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 5459D24000B;
        Mon, 18 Oct 2021 15:36:55 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] rtc: pcf8523: always compile pcf8523_rtc_ioctl
Date:   Mon, 18 Oct 2021 17:36:47 +0200
Message-Id: <20211018153651.82069-2-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211018153651.82069-1-alexandre.belloni@bootlin.com>
References: <20211018153651.82069-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Compiling out pcf8523_rtc_ioctl saves about 5% of the generated machine
code. However, it certainly never happens as the RTC character device
interface is the most useful one and is probably always compiled in.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf8523.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/rtc/rtc-pcf8523.c b/drivers/rtc/rtc-pcf8523.c
index c5d31c525997..103557f48409 100644
--- a/drivers/rtc/rtc-pcf8523.c
+++ b/drivers/rtc/rtc-pcf8523.c
@@ -237,7 +237,6 @@ static int pcf8523_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *tm)
 	return 0;
 }
 
-#ifdef CONFIG_RTC_INTF_DEV
 static int pcf8523_rtc_ioctl(struct device *dev, unsigned int cmd,
 			     unsigned long arg)
 {
@@ -268,9 +267,6 @@ static int pcf8523_rtc_ioctl(struct device *dev, unsigned int cmd,
 		return -ENOIOCTLCMD;
 	}
 }
-#else
-#define pcf8523_rtc_ioctl NULL
-#endif
 
 static int pcf8523_rtc_read_offset(struct device *dev, long *offset)
 {
-- 
2.31.1

