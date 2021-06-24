Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA1633B2EA6
	for <lists+linux-rtc@lfdr.de>; Thu, 24 Jun 2021 14:10:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbhFXMM2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 24 Jun 2021 08:12:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbhFXMM1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 24 Jun 2021 08:12:27 -0400
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com [IPv6:2607:f8b0:4864:20::730])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF26EC061574
        for <linux-rtc@vger.kernel.org>; Thu, 24 Jun 2021 05:10:08 -0700 (PDT)
Received: by mail-qk1-x730.google.com with SMTP id o6so13832967qkh.4
        for <linux-rtc@vger.kernel.org>; Thu, 24 Jun 2021 05:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pVe+oqxYATmpPh/MtyqJwsp7gjJozMqbQH+LmtH68r8=;
        b=XqjwUY5tOkaWuz2xwcCrsCs4qncDtLaJuFQEtGZwjsQOKvcxhNi4V9Ux+rgqWkIo3z
         EFKz1tkHJEpWL/Tj2tHykvt/0VZblLxpurOFLYq97ncXVsmupEfodKofEPSeLCJx8j/L
         /mNkzNcaBapSCOhI10J3u9bVn84AsJ7zOn0b7tAN4H+OQk2VB026TJcjv/rYCwQxfuUH
         8D6NmnFM9MQNgkB28eyopV4+jOGfkHjvtoAuMyNcQxWm4SR7c/SRq2bOZ82h+12GenAT
         YGFSGC3wgmo2y4mAu7Xps7ocwUVWIbsT+/k4NJvUAFCbCVmDIUqzRe5JiXqifRZT0vtu
         s6Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pVe+oqxYATmpPh/MtyqJwsp7gjJozMqbQH+LmtH68r8=;
        b=a7cmxEt4Ix+Mrra2TbObXCEXGznCwbi5Z43VPDMjVFXpiY+Xke+Ic2Ycyl+I20lG4C
         DeWTsEsXzvQDOYtLbR5yI4ceqFwpEzX37vqVyLr523IGSQMWwRoXTuw36ujliqLzLSe7
         mjefcwcQd1bsyuJS4DeUVNCUtT7NQXMtPIhyUwQLqgjzkDHgxtMHL791AKokF5UjZcYh
         C9Z050LzYKeSFOOLfdh5ZdxMLUUWrR55R8OqI0k/L2RFUuaLxFvBVfI5OhQZBMstx7zT
         bOh0k2L6jUb44YY1Kw2sH/IenMCWg0KUZLs0wMiC357mM/cypS+yEOZnHgpgZ5jur2rY
         AYHg==
X-Gm-Message-State: AOAM532i/Nqj14GEymioWbYWzFBbB1/poqYNm6LgCqHfZaOBuSJnDNMS
        XVamoIO02bI5x0d1/QB7BsDsdOwYE43veQ==
X-Google-Smtp-Source: ABdhPJy9WzhgLdXcTKA1az67TV+PqZGt+eg3Key7iu5/qQLj5jjpqt9h50LXClMnSS7z2fRtaXWg7g==
X-Received: by 2002:a37:8b47:: with SMTP id n68mr5167716qkd.209.1624536608127;
        Thu, 24 Jun 2021 05:10:08 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:504a:390c:fbca:3b:927a])
        by smtp.gmail.com with ESMTPSA id t8sm1814125qtp.7.2021.06.24.05.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 05:10:07 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, iwamatsu@nigauri.org,
        Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] rtc: pcf85063: Update the PCF85063A  datasheet revision
Date:   Thu, 24 Jun 2021 09:09:53 -0300
Message-Id: <20210624120953.2313378-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

After updating the datasheet URL, the PCF85063A  datasheet revision
has changed.

Adjust it accordingly.

Reported-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/rtc/rtc-pcf85063.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index 9a5297098d39..14da4ab30104 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -24,7 +24,7 @@
  *  https://www.nxp.com/docs/en/data-sheet/PCF85063A.pdf
  *  https://www.nxp.com/docs/en/data-sheet/PCF85063TP.pdf
  *
- *  PCF85063A -- Rev. 6 — 18 November 2015
+ *  PCF85063A -- Rev. 7 — 30 March 2018
  *  PCF85063TP -- Rev. 4 — 6 May 2015
  *
  *  https://www.microcrystal.com/fileadmin/Media/Products/RTC/App.Manual/RV-8263-C7_App-Manual.pdf
-- 
2.25.1

