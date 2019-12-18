Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F39A21241A3
	for <lists+linux-rtc@lfdr.de>; Wed, 18 Dec 2019 09:28:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbfLRI2l (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 18 Dec 2019 03:28:41 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:40648 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725797AbfLRI2l (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 18 Dec 2019 03:28:41 -0500
Received: by mail-pj1-f65.google.com with SMTP id bg7so38921pjb.5
        for <linux-rtc@vger.kernel.org>; Wed, 18 Dec 2019 00:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fNqeKangGbs7rnBT23kSCpYq5perSl7J/QSjQ+fgEVI=;
        b=XT6vRcjopTfxpeVXBqBvwx6Ii/Pcu8bP5o+OqMIVs65VxILVjuBkScapytyut2QzUw
         j2+VfHWrfC0W2ptqP0NdtnD5TvghUJ61QP7QCM7bOABofpYlZmDML1WafkeKrMXzSkGF
         HI0qR6ZI9mB+m1ChIH95n1pdnru8CSaXsPGIal4Xr2OicMaHIM4fDszQbsvFRh7Jtytv
         9cRwaA3UguGJ7S4KFy3vtn63npSKjQMgNxesR+t6o8kxsFRk3wmfMyNr7CJmZk12Gn0m
         0a4xEsJdRgzbIkEreczCR5MlsIDmgBGiZLSH6aJOfrZhh+Zlmr71HuiUUmscPWTH9pCs
         AWww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fNqeKangGbs7rnBT23kSCpYq5perSl7J/QSjQ+fgEVI=;
        b=iOawNpj5EokKQEC9JiNnGvZQGmNvT1ojvT/r8/HCpGg8OsmGxTDxlqAklTfaHXDZFn
         XY/TGHdm4rm7ajIv3E5oLTSaXpsW3pVVuZu2rfChgEqOAHhBDxpnPg9onBnq9C9BFaJ4
         ovUanfFy2RqNuT6Ntyi01bnKaBUG3Z36AzSCu8HdjLFTEu6r1BRrxesLbi1PN7KOaaps
         HYk8TgmwDKx4c6dRLd8CrnZGkl2zIy10TOgtAA1Os/qx1deoJD4jUa0glZFj54ZGIvKp
         c/wpvxUpnKlz87Y3BWCYgCn0S+smx0DsFTRdxINKwF6kpR2Gymew86LMl+26SpfEGr8u
         PO8Q==
X-Gm-Message-State: APjAAAWfoAmiOq0WY7BEzCAkZVd++azDwHPVZMSFv60U6mW/cqxW93hx
        TKoF3MzKJVzthY32NgKDuYlp1Hbgzw==
X-Google-Smtp-Source: APXvYqzTbANS0D6OsMcW0VN1QdAl/Jv8tyEh+s0kpvzUmWQcnEp6ve1XGyNZyHmqLNe0tCiDe0HWGg==
X-Received: by 2002:a17:902:8c91:: with SMTP id t17mr1266500plo.225.1576657720327;
        Wed, 18 Dec 2019 00:28:40 -0800 (PST)
Received: from localhost (om126208136186.22.openmobile.ne.jp. [126.208.136.186])
        by smtp.gmail.com with ESMTPSA id f9sm1980716pfd.141.2019.12.18.00.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2019 00:28:39 -0800 (PST)
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To:     linux-rtc@vger.kernel.org
Cc:     Nobuhiro Iwamatsu <iwamatsu@nigauri.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jonas Jensen <jonas.jensen@gmail.com>
Subject: [PATCH] rtc: moxart: Convert to SPDX identifier
Date:   Wed, 18 Dec 2019 17:28:36 +0900
Message-Id: <20191218082836.3309808-1-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Use SPDX-License-Identifier instead of a verbose license text.

CC: Alessandro Zummo <a.zummo@towertech.it>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Jonas Jensen <jonas.jensen@gmail.com>
Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
 drivers/rtc/rtc-moxart.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-moxart.c b/drivers/rtc/rtc-moxart.c
index 07b30a373a929..6b24ac9e1cfa8 100644
--- a/drivers/rtc/rtc-moxart.c
+++ b/drivers/rtc/rtc-moxart.c
@@ -1,3 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
 /*
  * MOXA ART RTC driver.
  *
@@ -7,10 +8,6 @@
  *
  * Based on code from
  * Moxa Technology Co., Ltd. <www.moxa.com>
- *
- * This file is licensed under the terms of the GNU General Public
- * License version 2.  This program is licensed "as is" without any
- * warranty of any kind, whether express or implied.
  */
 
 #include <linux/init.h>
-- 
2.24.0

