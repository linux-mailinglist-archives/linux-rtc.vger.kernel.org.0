Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3284228719A
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Oct 2020 11:34:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729009AbgJHJeX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 8 Oct 2020 05:34:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725882AbgJHJeX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 8 Oct 2020 05:34:23 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF053C0613D2
        for <linux-rtc@vger.kernel.org>; Thu,  8 Oct 2020 02:34:22 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id n14so3517931pff.6
        for <linux-rtc@vger.kernel.org>; Thu, 08 Oct 2020 02:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ky6B9tzxN97erkw+L3nihgRW4OC9vjJOPwyhfBdbivM=;
        b=hJ6kgqwbkmiF+RvoAlO+KDFQRiWTJWGEZCGcib6sEFkrkP/9ioxTPU/3+Ump8jnpMH
         R+54SWbf0ge46G0SySQ5qFrvzhoUXIgnEixyPrhOrCyIuZWPOtMtsxEcf2r6sijAtoS6
         6Ope6x8XjIt+Unfrf/47HdTxoQjqg+KP8fgA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ky6B9tzxN97erkw+L3nihgRW4OC9vjJOPwyhfBdbivM=;
        b=nnAkzCQqfbrx9ABkSyU6VixkxIv2+1u530fwrxVWYoyhfVSfmUoVGk5tNqd5+ZmgMB
         4E4r60LuoaG1bu5mXAC852jiOnTFu6DZuHF1gZnKaIQCTYGhv96wNrE/CSFmQoEUhqBz
         sjRjsk5w+X/lwPJmJqmoTgVbiHaM/BHsL9NyXvJ948iSNorV8wTqYP3m1ZVPawkaN6g3
         MflilPut8w7ib3MeA2GU8QhFBKrXxGv4N8+j+tBU9NLrTS2/C883FK53or3En01EMXsq
         /j24cmgTkJLggqs2/wjfdtlBFJihDEO4B4MheSp7BxeJ3EIut9dlW4GEytiJJHgy1Xk9
         ty3w==
X-Gm-Message-State: AOAM531uHbyg7nuNWFVP00kMdpv/z6w/syv6YASYWPq2hTjzsHsIjwYH
        6CLiV1B1b8wgvxUnxAJe5mK39w==
X-Google-Smtp-Source: ABdhPJxNmMQ5cqAp68AMAOr14GG/lN71/+I/Wr47wnEu0lH1ZnbSJkmDEQSjhjshVstu8ZSZpzI7jQ==
X-Received: by 2002:a62:5382:0:b029:155:6333:ce4f with SMTP id h124-20020a6253820000b02901556333ce4fmr1061372pfb.28.1602149662342;
        Thu, 08 Oct 2020 02:34:22 -0700 (PDT)
Received: from fshao-glinux.tpe.corp.google.com ([2401:fa00:1:b:1a60:24ff:fe90:ea5a])
        by smtp.gmail.com with ESMTPSA id q7sm6113711pfj.38.2020.10.08.02.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2020 02:34:21 -0700 (PDT)
From:   Fei Shao <fshao@chromium.org>
To:     Eddie Huang <eddie.huang@mediatek.com>
Cc:     Fei Shao <fshao@chromium.org>, linux-rtc@vger.kernel.org,
        Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Lee Jones <lee.jones@linaro.org>,
        Sean Wang <sean.wang@mediatek.com>,
        linux-kernel@vger.kernel.org, Josef Friedl <josef.friedl@speed.at>,
        Ran Bi <ran.bi@mediatek.com>,
        linux-mediatek@lists.infradead.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] rtc: mt6397: Remove unused member dev
Date:   Thu,  8 Oct 2020 17:34:14 +0800
Message-Id: <20201008093414.1911699-1-fshao@chromium.org>
X-Mailer: git-send-email 2.28.0.806.g8561365e88-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Removing the struct member "dev" in mt6397 RTC driver because it's not
initialized and the only usage is for one debugging message.

Also fixed a typo in the error message.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 drivers/rtc/rtc-mt6397.c       | 3 ++-
 include/linux/mfd/mt6397/rtc.h | 1 -
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index f8b1353777ba..1894aded4c85 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -31,7 +31,8 @@ static int mtk_rtc_write_trigger(struct mt6397_rtc *rtc)
 					MTK_RTC_POLL_DELAY_US,
 					MTK_RTC_POLL_TIMEOUT);
 	if (ret < 0)
-		dev_err(rtc->dev, "failed to write WRTGE: %d\n", ret);
+		dev_err(rtc->rtc_dev->dev.parent,
+			"failed to write WRTGR: %d\n", ret);
 
 	return ret;
 }
diff --git a/include/linux/mfd/mt6397/rtc.h b/include/linux/mfd/mt6397/rtc.h
index 66989a16221a..c3748b53bf7d 100644
--- a/include/linux/mfd/mt6397/rtc.h
+++ b/include/linux/mfd/mt6397/rtc.h
@@ -72,7 +72,6 @@ struct mtk_rtc_data {
 };
 
 struct mt6397_rtc {
-	struct device           *dev;
 	struct rtc_device       *rtc_dev;
 
 	/* Protect register access from multiple tasks */
-- 
2.28.0.806.g8561365e88-goog

