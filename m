Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68FE412CAD6
	for <lists+linux-rtc@lfdr.de>; Sun, 29 Dec 2019 21:45:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726864AbfL2UpJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 29 Dec 2019 15:45:09 -0500
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:47093 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726816AbfL2UpI (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 29 Dec 2019 15:45:08 -0500
X-Originating-IP: 92.184.100.83
Received: from localhost (unknown [92.184.100.83])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id D21D0E0002;
        Sun, 29 Dec 2019 20:45:04 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     linux-rtc@vger.kernel.org
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Eugen.Hristev@microchip.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 4/9] rtc: at91rm9200: move register definitions to C file
Date:   Sun, 29 Dec 2019 21:44:16 +0100
Message-Id: <20191229204421.337612-4-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191229204421.337612-1-alexandre.belloni@bootlin.com>
References: <20191229204421.337612-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The header was simply moved from the arm mach folder to drivers/rtc but
there is not point in having it separated from the driver.

Also remove unused bit definitions and use BIT and GENMASK.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-at91rm9200.c | 46 ++++++++++++++++++++++-
 drivers/rtc/rtc-at91rm9200.h | 71 ------------------------------------
 2 files changed, 45 insertions(+), 72 deletions(-)
 delete mode 100644 drivers/rtc/rtc-at91rm9200.h

diff --git a/drivers/rtc/rtc-at91rm9200.c b/drivers/rtc/rtc-at91rm9200.c
index bda8e009076f..997734ed9a5b 100644
--- a/drivers/rtc/rtc-at91rm9200.c
+++ b/drivers/rtc/rtc-at91rm9200.c
@@ -30,7 +30,51 @@
 #include <linux/time.h>
 #include <linux/uaccess.h>
 
-#include "rtc-at91rm9200.h"
+#define	AT91_RTC_CR		0x00			/* Control Register */
+#define		AT91_RTC_UPDTIM		BIT(0)		/* Update Request Time Register */
+#define		AT91_RTC_UPDCAL		BIT(1)		/* Update Request Calendar Register */
+
+#define	AT91_RTC_MR		0x04			/* Mode Register */
+
+#define	AT91_RTC_TIMR		0x08			/* Time Register */
+#define		AT91_RTC_SEC		GENMASK(6, 0)	/* Current Second */
+#define		AT91_RTC_MIN		GENMASK(14, 8)	/* Current Minute */
+#define		AT91_RTC_HOUR		GENMASK(21, 16)	/* Current Hour */
+#define		AT91_RTC_AMPM		BIT(22)		/* Ante Meridiem Post Meridiem Indicator */
+
+#define	AT91_RTC_CALR		0x0c			/* Calendar Register */
+#define		AT91_RTC_CENT		GENMASK(6, 0)	/* Current Century */
+#define		AT91_RTC_YEAR		GENMASK(15, 8)	/* Current Year */
+#define		AT91_RTC_MONTH		GENMASK(20, 16)	/* Current Month */
+#define		AT91_RTC_DAY		GENMASK(23, 21)	/* Current Day */
+#define		AT91_RTC_DATE		GENMASK(29, 24)	/* Current Date */
+
+#define	AT91_RTC_TIMALR		0x10			/* Time Alarm Register */
+#define		AT91_RTC_SECEN		BIT(7)		/* Second Alarm Enable */
+#define		AT91_RTC_MINEN		BIT(15)		/* Minute Alarm Enable */
+#define		AT91_RTC_HOUREN		BIT(23)		/* Hour Alarm Enable */
+
+#define	AT91_RTC_CALALR		0x14			/* Calendar Alarm Register */
+#define		AT91_RTC_MTHEN		BIT(23)		/* Month Alarm Enable */
+#define		AT91_RTC_DATEEN		BIT(31)		/* Date Alarm Enable */
+
+#define	AT91_RTC_SR		0x18			/* Status Register */
+#define		AT91_RTC_ACKUPD		BIT(0)		/* Acknowledge for Update */
+#define		AT91_RTC_ALARM		BIT(1)		/* Alarm Flag */
+#define		AT91_RTC_SECEV		BIT(2)		/* Second Event */
+#define		AT91_RTC_TIMEV		BIT(3)		/* Time Event */
+#define		AT91_RTC_CALEV		BIT(4)		/* Calendar Event */
+
+#define	AT91_RTC_SCCR		0x1c			/* Status Clear Command Register */
+#define	AT91_RTC_IER		0x20			/* Interrupt Enable Register */
+#define	AT91_RTC_IDR		0x24			/* Interrupt Disable Register */
+#define	AT91_RTC_IMR		0x28			/* Interrupt Mask Register */
+
+#define	AT91_RTC_VER		0x2c			/* Valid Entry Register */
+#define		AT91_RTC_NVTIM		BIT(0)		/* Non valid Time */
+#define		AT91_RTC_NVCAL		BIT(1)		/* Non valid Calendar */
+#define		AT91_RTC_NVTIMALR	BIT(2)		/* Non valid Time Alarm */
+#define		AT91_RTC_NVCALALR	BIT(3)		/* Non valid Calendar Alarm */
 
 #define at91_rtc_read(field) \
 	readl_relaxed(at91_rtc_regs + field)
diff --git a/drivers/rtc/rtc-at91rm9200.h b/drivers/rtc/rtc-at91rm9200.h
deleted file mode 100644
index 8be5289da8e2..000000000000
--- a/drivers/rtc/rtc-at91rm9200.h
+++ /dev/null
@@ -1,71 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * arch/arm/mach-at91/include/mach/at91_rtc.h
- *
- * Copyright (C) 2005 Ivan Kokshaysky
- * Copyright (C) SAN People
- *
- * Real Time Clock (RTC) - System peripheral registers.
- * Based on AT91RM9200 datasheet revision E.
- */
-
-#ifndef AT91_RTC_H
-#define AT91_RTC_H
-
-#define	AT91_RTC_CR		0x00			/* Control Register */
-#define		AT91_RTC_UPDTIM		(1 <<  0)		/* Update Request Time Register */
-#define		AT91_RTC_UPDCAL		(1 <<  1)		/* Update Request Calendar Register */
-#define		AT91_RTC_TIMEVSEL	(3 <<  8)		/* Time Event Selection */
-#define			AT91_RTC_TIMEVSEL_MINUTE	(0 << 8)
-#define			AT91_RTC_TIMEVSEL_HOUR		(1 << 8)
-#define			AT91_RTC_TIMEVSEL_DAY24		(2 << 8)
-#define			AT91_RTC_TIMEVSEL_DAY12		(3 << 8)
-#define		AT91_RTC_CALEVSEL	(3 << 16)		/* Calendar Event Selection */
-#define			AT91_RTC_CALEVSEL_WEEK		(0 << 16)
-#define			AT91_RTC_CALEVSEL_MONTH		(1 << 16)
-#define			AT91_RTC_CALEVSEL_YEAR		(2 << 16)
-
-#define	AT91_RTC_MR		0x04			/* Mode Register */
-#define			AT91_RTC_HRMOD		(1 <<  0)		/* 12/24 Hour Mode */
-
-#define	AT91_RTC_TIMR		0x08			/* Time Register */
-#define		AT91_RTC_SEC		(0x7f <<  0)		/* Current Second */
-#define		AT91_RTC_MIN		(0x7f <<  8)		/* Current Minute */
-#define		AT91_RTC_HOUR		(0x3f << 16)		/* Current Hour */
-#define		AT91_RTC_AMPM		(1    << 22)		/* Ante Meridiem Post Meridiem Indicator */
-
-#define	AT91_RTC_CALR		0x0c			/* Calendar Register */
-#define		AT91_RTC_CENT		(0x7f <<  0)		/* Current Century */
-#define		AT91_RTC_YEAR		(0xff <<  8)		/* Current Year */
-#define		AT91_RTC_MONTH		(0x1f << 16)		/* Current Month */
-#define		AT91_RTC_DAY		(7    << 21)		/* Current Day */
-#define		AT91_RTC_DATE		(0x3f << 24)		/* Current Date */
-
-#define	AT91_RTC_TIMALR		0x10			/* Time Alarm Register */
-#define		AT91_RTC_SECEN		(1 <<  7)		/* Second Alarm Enable */
-#define		AT91_RTC_MINEN		(1 << 15)		/* Minute Alarm Enable */
-#define		AT91_RTC_HOUREN		(1 << 23)		/* Hour Alarm Enable */
-
-#define	AT91_RTC_CALALR		0x14			/* Calendar Alarm Register */
-#define		AT91_RTC_MTHEN		(1 << 23)		/* Month Alarm Enable */
-#define		AT91_RTC_DATEEN		(1 << 31)		/* Date Alarm Enable */
-
-#define	AT91_RTC_SR		0x18			/* Status Register */
-#define		AT91_RTC_ACKUPD		(1 <<  0)		/* Acknowledge for Update */
-#define		AT91_RTC_ALARM		(1 <<  1)		/* Alarm Flag */
-#define		AT91_RTC_SECEV		(1 <<  2)		/* Second Event */
-#define		AT91_RTC_TIMEV		(1 <<  3)		/* Time Event */
-#define		AT91_RTC_CALEV		(1 <<  4)		/* Calendar Event */
-
-#define	AT91_RTC_SCCR		0x1c			/* Status Clear Command Register */
-#define	AT91_RTC_IER		0x20			/* Interrupt Enable Register */
-#define	AT91_RTC_IDR		0x24			/* Interrupt Disable Register */
-#define	AT91_RTC_IMR		0x28			/* Interrupt Mask Register */
-
-#define	AT91_RTC_VER		0x2c			/* Valid Entry Register */
-#define		AT91_RTC_NVTIM		(1 <<  0)		/* Non valid Time */
-#define		AT91_RTC_NVCAL		(1 <<  1)		/* Non valid Calendar */
-#define		AT91_RTC_NVTIMALR	(1 <<  2)		/* Non valid Time Alarm */
-#define		AT91_RTC_NVCALALR	(1 <<  3)		/* Non valid Calendar Alarm */
-
-#endif
-- 
2.23.0

