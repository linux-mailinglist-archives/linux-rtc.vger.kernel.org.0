Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 148191315D
	for <lists+linux-rtc@lfdr.de>; Fri,  3 May 2019 17:42:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727601AbfECPme (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 3 May 2019 11:42:34 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:39586 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbfECPme (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 3 May 2019 11:42:34 -0400
Received: by mail-lf1-f66.google.com with SMTP id d12so4727387lfk.6
        for <linux-rtc@vger.kernel.org>; Fri, 03 May 2019 08:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hxoy1ZV5sToffY4PE/tTqurkXva76ASJNTG/Gm0iUtc=;
        b=uZfp/N3AZYMWXt5Qex8B7lqHo+QCVU0lHkKBJ7/OsujvSrSe/6pCz3Tx/Fi9EzN5MH
         4jcT8gkcTgrPnCoo0P9vfF+6iCLssr6QFtKBslx199cYK4OJTJbpS+BzwLFO3fNnGR9b
         VV2/ovqWA8W5ztSfjC8UYtL1loIfqqFXPq5PVQxDXjllaDkSGlGoRpcF2xCH40qpsyiy
         96McdV4eFzJOBsohHc8zfmOaseibnvi5v5D/B6K48C9GCV0/jkvl2LfwuhXtVXBBpdpe
         mKLwvvII1dMDaDBYVc/tupFgRk7th1DURgzTvLxVX4NxKO9XBDRzZt6m+n8HojOyywtw
         VHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hxoy1ZV5sToffY4PE/tTqurkXva76ASJNTG/Gm0iUtc=;
        b=TuOawkfKXkuPIxLrdsStJPAf4NZrNyxQQu3Hd3LCc9fVGd44saJp7OBxpAV6Cqaz8G
         0GAcqX8tubVRb7wrIpSuyGobxAkGtlPZQCXj40bNu1BkGCPtzcOro3VOfivY5uPH2+v3
         Ys6hRMHN52SlhZWdlcrY2fXIc4CJTCL+D2shigCYaqHOm+FBhx1GYBckWPTNkUPiAKtS
         Frfj/z5qE/mAJo8CB5OIKobVDAq07X3UUZ/sc3nttX5Yk5GJGfe2bsVfARwPJHVvhPdR
         WoVuMhqIulayc6fdbju8WEZVexyL7byjWYl1+hQ2hDYXxRH7yxB13QJlpv76d7HL8UjQ
         4YnA==
X-Gm-Message-State: APjAAAWq00/3//MhYWWmW9hpZ+5V3HpCac1hYJbag0deFkxhDJ6/PhKV
        kIA4auBnPR4GBFS7/XoSKZ/Uaw==
X-Google-Smtp-Source: APXvYqyU4uQeJLG/OtvlrhNPGDGwC02F9Y9cEMoD1VswE6z2M+2QplpwXLVYjy+XAotMFpGdXNqlcw==
X-Received: by 2002:a19:f60f:: with SMTP id x15mr5444261lfe.95.1556898152317;
        Fri, 03 May 2019 08:42:32 -0700 (PDT)
Received: from localhost (c-573670d5.07-21-73746f28.bbcust.telenor.se. [213.112.54.87])
        by smtp.gmail.com with ESMTPSA id 63sm486077lfz.2.2019.05.03.08.42.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 May 2019 08:42:31 -0700 (PDT)
From:   Anders Roxell <anders.roxell@linaro.org>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de
Cc:     linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH] rtc: imxdi: remove unused variable
Date:   Fri,  3 May 2019 17:42:17 +0200
Message-Id: <20190503154217.13205-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This variable is no longer used and the compiler rightly complains that
it should be removed.

../drivers/rtc/rtc-imxdi.c: In function ‘dryice_rtc_set_alarm’:
../drivers/rtc/rtc-imxdi.c:633:16: warning: unused variable ‘now’ [-Wunused-variable]
  unsigned long now;
                ^~~

Rework to remove the unused variable.

Fixes: 629d488a3eb6 ("rtc: imxdi: remove unnecessary check")
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 drivers/rtc/rtc-imxdi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/rtc/rtc-imxdi.c b/drivers/rtc/rtc-imxdi.c
index 6342bc403645..3f3d652a0b0f 100644
--- a/drivers/rtc/rtc-imxdi.c
+++ b/drivers/rtc/rtc-imxdi.c
@@ -630,7 +630,6 @@ static int dryice_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 static int dryice_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alarm)
 {
 	struct imxdi_dev *imxdi = dev_get_drvdata(dev);
-	unsigned long now;
 	int rc;
 
 	/* write the new alarm time */
-- 
2.20.1

