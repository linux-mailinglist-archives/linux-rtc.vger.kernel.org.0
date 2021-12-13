Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71FBE4723CF
	for <lists+linux-rtc@lfdr.de>; Mon, 13 Dec 2021 10:30:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233734AbhLMJac (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 13 Dec 2021 04:30:32 -0500
Received: from guitar.tcltek.co.il ([84.110.109.230]:56410 "EHLO mx.tkos.co.il"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233728AbhLMJaa (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Mon, 13 Dec 2021 04:30:30 -0500
X-Greylist: delayed 571 seconds by postgrey-1.27 at vger.kernel.org; Mon, 13 Dec 2021 04:30:30 EST
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mx.tkos.co.il (Postfix) with ESMTPS id A5D5A440072;
        Mon, 13 Dec 2021 11:20:35 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
        s=default; t=1639387235;
        bh=dGXApIREMfmjXBc3Rw1RVh263VHQ4zI9MOpqQOSXWs0=;
        h=From:To:Cc:Subject:Date:From;
        b=Pt24qlb62pac9mh88Az4rYgqbjRakS1JKYHlaCVBcYauta/aauD8VUqKFN/cnXVar
         9yJK6IWGfy8Pu9ncfx+0J7zZZITtPzjk/j2ppm7QVuCcLZbQRENQgpbBL66A8g/0bK
         j1DqX8jkGFBVxFHJ7vO/J9rsNYVNQtMZ9MUiY0VGMcqobCjwJDgOGsvE8Pi/lyLZsv
         deA05WHyVbWP+W78GworkvdVZoMlxoCzIJw3mry8RrTSQqMcxO84U1vyvoL3N9GQ0R
         6zB/Ix9+1p/M5suYY0WOEX+wnCdtKBJBM9ndGpqJDiKYACs6zRv/Svh9/WHGnKWsw6
         rZVuSbZKi1gdg==
From:   Baruch Siach <baruch@tkos.co.il>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH] rtc: pcf8523: report battery switch over
Date:   Mon, 13 Dec 2021 11:18:53 +0200
Message-Id: <992993372d0ae794dcd1da91c386048458b11d65.1639387133.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Set RTC_VL_BACKUP_SWITCH when reading the batter voltage level to
indicate switch to battery backup.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 drivers/rtc/rtc-pcf8523.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/rtc/rtc-pcf8523.c b/drivers/rtc/rtc-pcf8523.c
index c93acade7205..d0eb53265549 100644
--- a/drivers/rtc/rtc-pcf8523.c
+++ b/drivers/rtc/rtc-pcf8523.c
@@ -330,6 +330,9 @@ static int pcf8523_rtc_ioctl(struct device *dev, unsigned int cmd,
 		if (value & PCF8523_CONTROL3_BLF)
 			flags |= RTC_VL_BACKUP_LOW;
 
+		if (value & PCF8523_CONTROL3_BSF)
+			flags |= RTC_VL_BACKUP_SWITCH;
+
 		ret = regmap_read(pcf8523->regmap, PCF8523_REG_SECONDS, &value);
 		if (ret < 0)
 			return ret;
@@ -339,6 +342,10 @@ static int pcf8523_rtc_ioctl(struct device *dev, unsigned int cmd,
 
 		return put_user(flags, (unsigned int __user *)arg);
 
+	case RTC_VL_CLR:
+		return regmap_update_bits(pcf8523->regmap,
+				PCF8523_REG_CONTROL3, PCF8523_CONTROL3_BSF, 0);
+
 	default:
 		return -ENOIOCTLCMD;
 	}
-- 
2.33.0

