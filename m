Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C475E39A363
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Jun 2021 16:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231594AbhFCOgu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Jun 2021 10:36:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231328AbhFCOgt (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Jun 2021 10:36:49 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41A25C061756
        for <linux-rtc@vger.kernel.org>; Thu,  3 Jun 2021 07:34:56 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id v4so4516318qtp.1
        for <linux-rtc@vger.kernel.org>; Thu, 03 Jun 2021 07:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yca2X08IJ5QEhJOzML5k9y8e6SuE28h6kbolxV5L38Y=;
        b=YaN7hDwb+4NsQGGerAYQKEy6W+0YPmvkN+Dm1s5rb0cEz/ojE5d9mAHMJhYauRhODa
         3Jq1AAzwTSstlYjBrLHq/5q0Ee2jlNefQ8zaZdhfx0HMJOctSMaUTSZvaOqmayVE/UVu
         U94g2lkLFLx+WA8pFc/CpUjQAS0R58mBv693+nMwvRRxj4laT/Me1GGeWsKLjiH3QpNo
         3lwfeQp4Q3CbOIME+uLA/ej08RTMBVDeKvuZHkEruJ1c4IA7zDPtYrJA61Jcj4Qqt4Qy
         MmvS8OXbMrUUkabj1W55ravUehgCC78FrhfbDMQqvzFqRfCVb7Y+2BTzE+QqEleUq5qg
         Cu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Yca2X08IJ5QEhJOzML5k9y8e6SuE28h6kbolxV5L38Y=;
        b=RTtHb2VfRgLxKdfCCYo+lRqFzIgyEuR+2Ieoa3s+HQ2gXKzdLjSbW1pmooOeiDx5ie
         sNCZUvbf4l4s5tcvkcypLrpMNgaEiLfZO1fwWA6HyagX34Y0pyMOf6Slp6qeR0VU/UOc
         lhehuic9+9TnRLpO0SKZGJPkHuAV4lbrE20nLppWlTpoaE27ELS1e8bKHlm5H69wB0pB
         ON4z2/9lzDmnHmyTPaAzBeiXwRSiWD6iEns7aqfpH2z8NDG5XoMXZ5aznJA5a5GQrlLj
         YTB3TEEJ575PBmDGEoTkBp7E9pu5CvlbfeD9S+N0phE8IPeG7vhHmX466iXGUgHGib/O
         F/sw==
X-Gm-Message-State: AOAM532c/tKgw5ymZpW54sWgax8hxc/Yh6x7H3sW8L0N4Xmj5xLJ0HPt
        2jJy3J+P0wE9NiwT1MDA0UgYQsoxht99gQ==
X-Google-Smtp-Source: ABdhPJyDgKSxP2AJQ+MZ5H8g/iQJHgs0dV/goOQ0NSQ61ie1b2q8zzdGCMYNJ0jcGi27+j5dDI76OQ==
X-Received: by 2002:a05:622a:164c:: with SMTP id y12mr195083qtj.318.1622730895372;
        Thu, 03 Jun 2021 07:34:55 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:504a:1fe8:47aa:9548:352c])
        by smtp.gmail.com with ESMTPSA id y17sm1742433qta.11.2021.06.03.07.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 07:34:54 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     alexandre.belloni@bootlin.com
Cc:     linux-rtc@vger.kernel.org, Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/3] rtc: pcf2127: Fix the datasheet URL
Date:   Thu,  3 Jun 2021 11:34:45 -0300
Message-Id: <20210603143447.2223353-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The current datasheet URL is no longer valid.

Replace with a valid one.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 drivers/rtc/rtc-pcf2127.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index d13c20a2adf7..48ce1e85deb1 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -10,7 +10,7 @@
  *
  * based on the other drivers in this same directory.
  *
- * Datasheet: http://cache.nxp.com/documents/data_sheet/PCF2127.pdf
+ * Datasheet: https://www.nxp.com/docs/en/data-sheet/PCF2127.pdf
  */
 
 #include <linux/i2c.h>
-- 
2.25.1

