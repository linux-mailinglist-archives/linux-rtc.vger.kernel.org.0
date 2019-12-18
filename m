Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10075124196
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Dec 2019 09:26:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbfLRIZ7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 18 Dec 2019 03:25:59 -0500
Received: from mail-pj1-f66.google.com ([209.85.216.66]:36691 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbfLRIZ7 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 18 Dec 2019 03:25:59 -0500
Received: by mail-pj1-f66.google.com with SMTP id n59so536076pjb.1
        for <linux-rtc@vger.kernel.org>; Wed, 18 Dec 2019 00:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nvxe5Hdgmi+rV2NFdmV67/Qk5y3szlsV7iVE7uzEj/8=;
        b=yvhe4hmTjgre+rZ16dpfaXRTsXu/19D6r2TiVplhwZ8IJL8VMzTh51HYlmkfKPDPPF
         l5bp+YzMAALV4S7+KHXotjYHamWQs88Bpm3FhBRYQXekGilG9K6NV4ueWtIxRyidFl0j
         jO9DW1tfEmynG6/WyGm0e1YRWW0lZUpv1j/WaACQo7YA+Vw58YKnqXfga0cYenarIpfV
         OSBel44SVuKeTCItAOtyGbppzFPbZH86tq7cwhRQT0jZvNfxUnQaEiDJkz5MJ7Zz2xfL
         fZQJ+TNbEvrtek8j6K/DOfUbofOLiOtT96MF+mOi5f29F9bSxcTk2oAYAFpg1w72tYcq
         kRZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Nvxe5Hdgmi+rV2NFdmV67/Qk5y3szlsV7iVE7uzEj/8=;
        b=ptp3n/AMjr40F3RFZskekySDLQvai+Ei/2ff/k+SaolHSXL6npV5/sS5lwxIKrapkG
         A1Xh27ni7UanlT1eXjkwEPRDYs1Xgno2Kz7SXKYcdO/F5Wkrv9+6NCNZ1gXcOuUpnLcB
         jC8EmAx8BM4tReeKN5wIp5CYHUmAkkBlAlr1CkCtVTdDlgqMYyYPRhhty6/40FTPNiTA
         3CbYjbN+uFaiJPzdySLBzcs5EM6ohGrqBh2g8nags6w433bPPN1LXSqeI54PceoyYJNA
         g8atpXur4vGNlcAnr4vGLNAr2AJB4ro89vOe2gQa9rGH+rmTHfPOqz+/VlGNt04TzLF3
         qs4A==
X-Gm-Message-State: APjAAAXR6dKKrvkUWz1Mihs4M2rDV9TJ3bSVkcPSBIV54HcsBN5FiRH9
        QgvhAkft7jjbhVgrnqcI3I2bPwWdHw==
X-Google-Smtp-Source: APXvYqwIsUr2YjnGZKzH93ZUpxMT4DtOF1FevgHCCUGSQ//v97Bl7WWFiHciAF3A+nG593fpc6KTLw==
X-Received: by 2002:a17:902:1:: with SMTP id 1mr1431462pla.108.1576657558129;
        Wed, 18 Dec 2019 00:25:58 -0800 (PST)
Received: from localhost (om126208136186.22.openmobile.ne.jp. [126.208.136.186])
        by smtp.gmail.com with ESMTPSA id d14sm2096528pfq.117.2019.12.18.00.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 00:25:57 -0800 (PST)
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To:     linux-rtc@vger.kernel.org
Cc:     Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH] rtc: pcf8563: Use BIT
Date:   Wed, 18 Dec 2019 17:25:53 +0900
Message-Id: <20191218082553.3309554-1-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Replace (1 << ...) with BIT().

CC: Alessandro Zummo <a.zummo@towertech.it>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 drivers/rtc/rtc-pcf8563.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c
index 3c322f3079b0c..65e2bb5644768 100644
--- a/drivers/rtc/rtc-pcf8563.c
+++ b/drivers/rtc/rtc-pcf8563.c
@@ -22,8 +22,8 @@
 
 #define PCF8563_REG_ST1		0x00 /* status */
 #define PCF8563_REG_ST2		0x01
-#define PCF8563_BIT_AIE		(1 << 1)
-#define PCF8563_BIT_AF		(1 << 3)
+#define PCF8563_BIT_AIE		BIT(1)
+#define PCF8563_BIT_AF		BIT(3)
 #define PCF8563_BITS_ST2_N	(7 << 5)
 
 #define PCF8563_REG_SC		0x02 /* datetime */
-- 
2.24.0

