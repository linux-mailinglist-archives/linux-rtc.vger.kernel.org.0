Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73FE1F3CCE
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Nov 2019 01:23:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726054AbfKHAX7 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 7 Nov 2019 19:23:59 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:40151 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725928AbfKHAX6 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 7 Nov 2019 19:23:58 -0500
Received: by mail-pl1-f194.google.com with SMTP id e3so2779016plt.7
        for <linux-rtc@vger.kernel.org>; Thu, 07 Nov 2019 16:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QtGZhwDrTNStCkPp0hyMlEQrnpuVEwzvRdkgz1xLZdE=;
        b=f47lsGy1Pfu66iqcrz6MC1KQMPbIRCTaX5jH6ZBW6jE777MnJGCwdMIKYSR1HK77Bk
         nxowl81Tvu/mr1ys6ZMKTQBDR4AN1H+Rf/xgKifCYyqUw/sciKzk6u1y2NEU2inXwzeb
         BmkPOC3mkHNFuZ0Hq88YCfkgSEDU5ee6eFn+oOg0/2Xyxi8ZewaDxwhQSKbwUxKh9Wlu
         R6RwE8ErEzVVn7nL+gO2RD5lOIcMv2smr8WaIXAkbfKlUVRT9vkyg3Ezp3dmme4ko1mO
         bzUWtFeTOfKyFOMJ5/rihJ0+B4unIxGiAFHLmiagG2wnStIaLwMB3YtVBii3xQbnm66K
         qF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QtGZhwDrTNStCkPp0hyMlEQrnpuVEwzvRdkgz1xLZdE=;
        b=tlc6t608TQrTVj1V5sfo0WXDJXqgTOMXUHbLYof7oCmOhfSPkBF2Os1BYjyeJQ4Wpk
         3+lMdQyCJFJ6yktvdXz1Hg4Z57vHF7gvEzm4wGfF4/CUcV86cPcKhSTmLgq766xqYtet
         Stko5Do7F9ol053B79F55FJlcwzZQCl8eCeBxuxOr+woctm2Pak3iLnj6jklJT+YQj/W
         tFUTCoXmcQCUBjsUcOX7kdfEsG6tTF8gY0C+E2HyW38Xd54JtjHNH87x4EdnINVvBz8N
         uV8+eHXY5bQdAPRSmRwpUHxSZEAhk+wkXG+TT3P8wXFciGWLRODKz4oV0G9/hTR+apjX
         QcMw==
X-Gm-Message-State: APjAAAVA4jLG7ou2YvYuMfJz0CHvS2tluPSL13ijVgqsduAk6t186gZr
        rW8tJWo4OOpxrLRI28oeC5uWvcooCg==
X-Google-Smtp-Source: APXvYqy6VOf4SPgaErYfu9PUkmmbUds+oXWpFitTWLYWP71ZRIJlFlxKfZ/RIODuGjGt1EMuwqOV1Q==
X-Received: by 2002:a17:902:7e45:: with SMTP id a5mr6894900pln.315.1573172638029;
        Thu, 07 Nov 2019 16:23:58 -0800 (PST)
Received: from localhost (b152239.dynamic.ppp.asahi-net.or.jp. [202.213.152.239])
        by smtp.gmail.com with ESMTPSA id b26sm3567106pfo.158.2019.11.07.16.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 16:23:57 -0800 (PST)
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH] rtc: ds1302: Remove unused DRV_NAME
Date:   Fri,  8 Nov 2019 09:23:54 +0900
Message-Id: <20191108002354.15016-1-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.24.0.rc1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

DRV_NAME is unused, remove it.

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 drivers/rtc/rtc-ds1302.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/rtc/rtc-ds1302.c b/drivers/rtc/rtc-ds1302.c
index 4faa24c88af5..b3de6d2e680a 100644
--- a/drivers/rtc/rtc-ds1302.c
+++ b/drivers/rtc/rtc-ds1302.c
@@ -15,8 +15,6 @@
 #include <linux/rtc.h>
 #include <linux/spi/spi.h>
 
-#define DRV_NAME	"rtc-ds1302"
-
 #define	RTC_CMD_READ	0x81		/* Read command */
 #define	RTC_CMD_WRITE	0x80		/* Write command */
 
-- 
2.24.0.rc1

