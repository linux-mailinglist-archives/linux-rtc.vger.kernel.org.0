Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31F781C61BA
	for <lists+linux-rtc@lfdr.de>; Tue,  5 May 2020 22:13:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728076AbgEEUNV (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 5 May 2020 16:13:21 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:44353 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727785AbgEEUNV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 5 May 2020 16:13:21 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id C2C55240002;
        Tue,  5 May 2020 20:13:18 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        =?UTF-8?q?Per=20N=C3=B8rgaard=20Christensen?= 
        <per.christensen@prevas.dk>, linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 1/5] rtc: add new VL flag for backup switchover
Date:   Tue,  5 May 2020 22:13:06 +0200
Message-Id: <20200505201310.255145-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

A new flag RTC_VL_BACKUP_SWITCH means that a backup switchover happened
since last flag clear.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 include/uapi/linux/rtc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/rtc.h b/include/uapi/linux/rtc.h
index 83bba58d47f4..fa9aff91cbf2 100644
--- a/include/uapi/linux/rtc.h
+++ b/include/uapi/linux/rtc.h
@@ -99,6 +99,7 @@ struct rtc_pll_info {
 #define RTC_VL_BACKUP_LOW	_BITUL(1) /* Backup voltage is low */
 #define RTC_VL_BACKUP_EMPTY	_BITUL(2) /* Backup empty or not present */
 #define RTC_VL_ACCURACY_LOW	_BITUL(3) /* Voltage is low, RTC accuracy is reduced */
+#define RTC_VL_BACKUP_SWITCH	_BITUL(4) /* Backup switchover happened */
 
 #define RTC_VL_READ	_IOR('p', 0x13, unsigned int)	/* Voltage low detection */
 #define RTC_VL_CLR	_IO('p', 0x14)		/* Clear voltage low information */
-- 
2.26.2

