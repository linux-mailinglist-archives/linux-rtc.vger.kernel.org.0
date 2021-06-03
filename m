Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13A2D39A36C
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Jun 2021 16:36:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230394AbhFCOh6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Jun 2021 10:37:58 -0400
Received: from mail-qk1-f174.google.com ([209.85.222.174]:36709 "EHLO
        mail-qk1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230138AbhFCOh5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Jun 2021 10:37:57 -0400
Received: by mail-qk1-f174.google.com with SMTP id i68so2533580qke.3
        for <linux-rtc@vger.kernel.org>; Thu, 03 Jun 2021 07:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xpTsM69Cl/AgBfKi7b4z8xpRnzSgiWFbBRpS0pAh2PQ=;
        b=WCtq4Qt2qhFf3+3AbcEFeBAwJ1U9ZlkJLecV0bMivcfd4rr+DS9J87RODNO9MdvCFB
         TDOheTsRrUjpeT/6LUgVv/+MEipk66xTk9CQLiFPZJCm5e0fFFAKUEJqY/mmkj+UcF8d
         z2hXALQWoihbT9ju03cN+a4RBbeJRHdwUvKHjaj7jLQoupCo/Pvsl/LBX1Te50HE7l6o
         LsE/bN1+2S3F0AzPagMLFyJtOmpJlui81VKN9vVV6qfGJ/neXe5lypK2aveofZ/lHaC3
         KZx0Jxrk8UczNDOZjD+Zg73ty8KRsUP2ddLaJFBdJY9apFrQ0nb7j91YhqcpwxCbOGpL
         xtwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xpTsM69Cl/AgBfKi7b4z8xpRnzSgiWFbBRpS0pAh2PQ=;
        b=jILAoKSRWiasvSE9sDisiyd5qTTgpsFNrom7J4XOM3d3N98C1ffVxzlVdC8VrGxsNC
         e16YhZ1cNMwqWzwDyUHNE33aenOi4rG0COUuGVXYd+bAi/ZICRIdBRTbOdEDUaGmlYUg
         MUKjxXjYKpG3iGHwOL05G4hywgku6z5Sws43dRyFT0mel4Fb19jdAMrA2eyDXpH+mlfl
         ivYJCGETiTyRwf9MydAmLy89WOQre2zeQDDWNbbj526OZnG+/e3tp9TRp5IjTbaOmjJu
         /zDD+EFZ0RKL4fToy0eMzoCwjzz6eLmSf85z79Exf4NTDhVqRhaZdwEq4NBtSOv4LRlu
         JIlw==
X-Gm-Message-State: AOAM530afae1u9i2lRYkFw3acMEN8oJmrAGKz2tobp4JUUR9bdcyJg24
        ooGSHxE8hkm6QxateuHGSh8=
X-Google-Smtp-Source: ABdhPJw/el53K5BvPojvQfcZDz358QAiC+ZKer7il9WvbHLcn+6Z2JrbADZLYZw/g24GgQ0Xry4GmQ==
X-Received: by 2002:a37:b4c:: with SMTP id 73mr5581374qkl.130.1622730899482;
        Thu, 03 Jun 2021 07:34:59 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:504a:1fe8:47aa:9548:352c])
        by smtp.gmail.com with ESMTPSA id y17sm1742433qta.11.2021.06.03.07.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 07:34:59 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 3/3] rtc: pcf8563: Fix the datasheet URL
Date:   Thu,  3 Jun 2021 11:34:47 -0300
Message-Id: <20210603143447.2223353-3-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210603143447.2223353-1-festevam@gmail.com>
References: <20210603143447.2223353-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The current datasheet URL is no longer valid.

Replace with a valid one.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/rtc/rtc-pcf8563.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pcf8563.c b/drivers/rtc/rtc-pcf8563.c
index 18f12f36eb2b..c8bddfb94129 100644
--- a/drivers/rtc/rtc-pcf8563.c
+++ b/drivers/rtc/rtc-pcf8563.c
@@ -8,7 +8,7 @@
  *
  * based on the other drivers in this same directory.
  *
- * http://www.semiconductors.philips.com/acrobat/datasheets/PCF8563-04.pdf
+ * https://www.nxp.com/docs/en/data-sheet/PCF8563.pdf
  */
 
 #include <linux/clk-provider.h>
-- 
2.25.1

