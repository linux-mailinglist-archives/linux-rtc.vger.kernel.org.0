Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36443436BFF
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Oct 2021 22:23:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232139AbhJUUZX (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 21 Oct 2021 16:25:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232108AbhJUUZV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 21 Oct 2021 16:25:21 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F8B2C061225
        for <linux-rtc@vger.kernel.org>; Thu, 21 Oct 2021 13:23:03 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id g10so5446824edj.1
        for <linux-rtc@vger.kernel.org>; Thu, 21 Oct 2021 13:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FoCS2Of8JxmjrHA0ciYvVff3O/0PQ9jcwIzAZgxkZS4=;
        b=xZaim99sf1bhVyq0cz+y+AGLha2Rs85XXTMdgylFks8k1SKW0pM6Tf4ovbIHHTJm7a
         f5k7Kc/crnsPDQWV92l8nrxWK26UPS0UA+rBvHaM2ffryWvXOWI8H+Vc12Tq2LKjphVs
         wzjP56H05iTP5rL9g/zdrJ2L6raRN3zejvpMVVn9veKSfip5gnXk19/TJYGMM3Cs6Xro
         NiV7ep6Y1Es7b4YDM39aRn7Qzq1XDw0L/B1nl0TMSmfxpJ8SPH0oTL+60Uvt5Zohr7Vz
         5qn3lg2t4TNzdHxT2nEQBsMV5NBCg2afSX3CPIj72gsISFp6/SGISgJ86s1J9/wes7lJ
         ge4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FoCS2Of8JxmjrHA0ciYvVff3O/0PQ9jcwIzAZgxkZS4=;
        b=WYxCDTGVMRU07S8/MRgONZpJFT/VRUG/TrhdLMroKEtDg6ZjxFOCna+02mg6vuYfpy
         nnJ59nWOr4uuzOLaX/eZi+VNDXsLI/FzhrjBv4Lqgakz0L1Mk+b04HgTUXYW3UsEUiAQ
         RpLRlB0qV2yw0geiWfzFl+dzS6dtSZBfH6XgK5cJwbkq1ESHbjw9TdSvidoB5WD5vj/R
         juUPO5W9mqzKUSQHYnabKdjijPkLxgcozmr3b1xInM9wClJrLzNqU7gB3uHX4y9fHiu5
         XlF9wGEHzHbpqqSo5VWpJwA6wL1eE+Nel+d4c1BF3mNQUIk5Hc1XI1I5H17OKTF2BFT3
         eW5w==
X-Gm-Message-State: AOAM533f6tHX+YZTRSXx77+vhduG/JfPmKKlpir0+mi5MWICrgKrbTjQ
        QAq2LqWqVlkCpyx4Btlh8kl+xg==
X-Google-Smtp-Source: ABdhPJzNwPC1x2uv2WuF6tsvx9+hXHVKaMH2Rdw3WklOnENLjkro6EEJq++2tcWXb/uSqXPiBfPnBg==
X-Received: by 2002:a17:906:181a:: with SMTP id v26mr2131988eje.478.1634847781841;
        Thu, 21 Oct 2021 13:23:01 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id u18sm3293456eds.86.2021.10.21.13.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 13:23:01 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] rtc: s3c: Add time range
Date:   Thu, 21 Oct 2021 23:22:56 +0300
Message-Id: <20211021202256.28517-4-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211021202256.28517-1-semen.protsenko@linaro.org>
References: <20211021202256.28517-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

This RTC driver starts counting from 2000 to avoid Y2K problem. Also it
only supports 100 years range for all RTCs.  Provide that info to RTC
framework. Also remove check for 100 years range in s3c_rtc_settime(),
as RTC core won't pass any invalid values to the driver, now that
correct range is set.

Here is the rationale on 100 years range limitation. Info on different
Samsung RTCs (credit goes to Krzysztof Kozlowski):
  - All S3C chips have only 8-bit wide year register (can store 100
    years range in BCD format)
  - S5Pv210 and Exynos chips have 12-bit year register (can store 1000
    years range in BCD format)

But in reality we usually can't make use of those 12 bits either:
  - RTCs might think that both 2000 and 2100 years are leap years. So
    when the YEAR register is 0, RTC goes from 28 Feb to 29 Feb, and
    when the YEAR register is 100, RTC also goes from 28 Feb to 29 Feb.
    This is of course incorrect: RTC breaks leap year criteria, which
    breaks the time contiguity, which leads to inability to use the RTC
    after year of 2099. It was found for example on Exynos850 SoC.
  - Despite having 12 bits for holding the year value, RTC might
    overflow the year value internally much earlier. For example, on
    Exynos850 the RTC overflows when YEAR=159, making the next YEAR=0.
    This way RTC actually has range of 160 years, not 1000 as one may
    think.

All that said, there is no sense in trying to increase the time range
for more than 100 years on RTCs that seem capable of that. It also
doesn't have too much practical value -- current hardware will be
probably obsolete by 2100.

Tested manually on Exynos850 RTC:

    $ date -s "1999-12-31 23:59:50"
    $ hwclock -w -f /dev/rtc0
    $ date -s "2100-01-01 00:00:00"
    $ hwclock -w -f /dev/rtc0
    $ date -s "2000-01-01 00:00:00"
    $ hwclock -w -f /dev/rtc0
    $ hwclock -r -f /dev/rtc0
    $ date -s "2099-12-31 23:59:50"
    $ hwclock -w -f /dev/rtc0
    $ hwclock -r -f /dev/rtc0

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - Removed check for 100 years range in s3c_rtc_settime()
  - Improved the commit message

 drivers/rtc/rtc-s3c.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
index d1baf655c008..db529733c9c4 100644
--- a/drivers/rtc/rtc-s3c.c
+++ b/drivers/rtc/rtc-s3c.c
@@ -219,11 +219,6 @@ static int s3c_rtc_settime(struct device *dev, struct rtc_time *tm)
 	rtc_tm.tm_year -= 100;
 	rtc_tm.tm_mon += 1;
 
-	if (rtc_tm.tm_year < 0 || rtc_tm.tm_year >= 100) {
-		dev_err(dev, "rtc only supports 100 years\n");
-		return -EINVAL;
-	}
-
 	return s3c_rtc_write_time(info, &rtc_tm);
 }
 
@@ -478,6 +473,8 @@ static int s3c_rtc_probe(struct platform_device *pdev)
 	}
 
 	info->rtc->ops = &s3c_rtcops;
+	info->rtc->range_min = RTC_TIMESTAMP_BEGIN_2000;
+	info->rtc->range_max = RTC_TIMESTAMP_END_2099;
 
 	ret = devm_rtc_register_device(info->rtc);
 	if (ret)
-- 
2.30.2

