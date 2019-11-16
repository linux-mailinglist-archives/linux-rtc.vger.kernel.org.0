Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86119FEBF0
	for <lists+linux-rtc@lfdr.de>; Sat, 16 Nov 2019 12:46:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727440AbfKPLqc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 16 Nov 2019 06:46:32 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:33096 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726794AbfKPLqc (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 16 Nov 2019 06:46:32 -0500
Received: by mail-wr1-f65.google.com with SMTP id w9so13817127wrr.0;
        Sat, 16 Nov 2019 03:46:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=hYZLZ+t7zW9QpC69y3DTNhSSDoe8rUBNplslYwkF1mk=;
        b=hNwHoNzk/uvJrn+JxoCqulz7jJxt2FAzMGnH3MaJkz2T1cx38hbvRHV8pnI504jgaG
         HSoTCY80cIIKgIZICacgPSvFpqSotzWhKTrBl/KLDwC/24CT0q/bh7gf+Z7eV9782qil
         XORkOSaXopgaMkGYkyjwvV2JfwfUo4PAbuL95JUuPoUVZSwwEjy1wRUaKeF4R5JjOYc3
         zVkLmDHAyW033W+035Vnr7e+1zyRYHUv4eGXQoRM2ZHkAD48yMHwpxjoZgdXGBJTVf4R
         yXGZ6lxe50OEzkwi8WaJcvD5iO/SnaIbcJurFBriBKedcg39ov4Ge39sdO7yIT7DqUOs
         I2cA==
X-Gm-Message-State: APjAAAW7U01wOJQHy0njxNi53q9h0YbNF1DXHPt8uABulZPzYzAOgaxr
        fqZpU58x5+PqHFq1WqCoG34=
X-Google-Smtp-Source: APXvYqzS7oielao94d4xPw0PIiTo9cBhVJcLFmaaElIt5rw2gXjykFtYdreC24iMgCvRErDEC1QwHg==
X-Received: by 2002:adf:e94e:: with SMTP id m14mr21057939wrn.233.1573904790163;
        Sat, 16 Nov 2019 03:46:30 -0800 (PST)
Received: from localhost.localdomain (2001-1c06-18c6-e000-2463-1bcb-8fa3-05f8.cable.dynamic.v6.ziggo.nl. [2001:1c06:18c6:e000:2463:1bcb:8fa3:5f8])
        by smtp.gmail.com with ESMTPSA id f17sm11918869wmj.40.2019.11.16.03.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2019 03:46:29 -0800 (PST)
From:   Kars de Jong <jongk@linux-m68k.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kars de Jong <jongk@linux-m68k.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] rtc: msm6242: Remove unneeded msm6242_set()/msm6242_clear() functions
Date:   Sat, 16 Nov 2019 12:46:20 +0100
Message-Id: <20191116114620.9193-1-jongk@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The msm6242_set()/msm6242_clear() functions are used when writing to Control
Register D to set or clear the HOLD bit when reading the current time from
the RTC.

Doing this with a read-modify-write cycle will potentially clear an
interrupt condition which occurs between the read and the write.

The datasheet states the following about this:

  When writing the HOLD or 30 second adjust bits of register D, it is
  necessary to write the IRQ FLAG bit to a "1".

Since the only other bits in the register are the 30 second adjust bit
(which is not used) and the BUSY bit (which is read-only), the
read-modify-write cycle can be replaced by a simple write with the IRQ FLAG
bit set to 1 and the other bits (except HOLD) set to 0.

Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Tested-by: Kars de Jong <jongk@linux-m68k.org>
Signed-off-by: Kars de Jong <jongk@linux-m68k.org>
---
 drivers/rtc/rtc-msm6242.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/rtc/rtc-msm6242.c b/drivers/rtc/rtc-msm6242.c
index b1f2bedee77e..80e364baac53 100644
--- a/drivers/rtc/rtc-msm6242.c
+++ b/drivers/rtc/rtc-msm6242.c
@@ -88,28 +88,16 @@ static inline void msm6242_write(struct msm6242_priv *priv, unsigned int val,
 	__raw_writel(val, &priv->regs[reg]);
 }
 
-static inline void msm6242_set(struct msm6242_priv *priv, unsigned int val,
-			       unsigned int reg)
-{
-	msm6242_write(priv, msm6242_read(priv, reg) | val, reg);
-}
-
-static inline void msm6242_clear(struct msm6242_priv *priv, unsigned int val,
-				 unsigned int reg)
-{
-	msm6242_write(priv, msm6242_read(priv, reg) & ~val, reg);
-}
-
 static void msm6242_lock(struct msm6242_priv *priv)
 {
 	int cnt = 5;
 
-	msm6242_set(priv, MSM6242_CD_HOLD, MSM6242_CD);
+	msm6242_write(priv, MSM6242_CD_HOLD|MSM6242_CD_IRQ_FLAG, MSM6242_CD);
 
 	while ((msm6242_read(priv, MSM6242_CD) & MSM6242_CD_BUSY) && cnt) {
-		msm6242_clear(priv, MSM6242_CD_HOLD, MSM6242_CD);
+		msm6242_write(priv, MSM6242_CD_IRQ_FLAG, MSM6242_CD);
 		udelay(70);
-		msm6242_set(priv, MSM6242_CD_HOLD, MSM6242_CD);
+		msm6242_write(priv, MSM6242_CD_HOLD|MSM6242_CD_IRQ_FLAG, MSM6242_CD);
 		cnt--;
 	}
 
@@ -120,7 +108,7 @@ static void msm6242_lock(struct msm6242_priv *priv)
 
 static void msm6242_unlock(struct msm6242_priv *priv)
 {
-	msm6242_clear(priv, MSM6242_CD_HOLD, MSM6242_CD);
+	msm6242_write(priv, MSM6242_CD_IRQ_FLAG, MSM6242_CD);
 }
 
 static int msm6242_read_time(struct device *dev, struct rtc_time *tm)
-- 
2.17.1

