Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63F903FB019
	for <lists+linux-rtc@lfdr.de>; Mon, 30 Aug 2021 05:56:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229630AbhH3D5f (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 29 Aug 2021 23:57:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbhH3D5e (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 29 Aug 2021 23:57:34 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9418C061575;
        Sun, 29 Aug 2021 20:56:41 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id u6so10501066pfi.0;
        Sun, 29 Aug 2021 20:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:cc:message-id:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=HjNZBedsFuw0ZBtpjYkbCXssQyv/l8LUL4tzZE4plgI=;
        b=WPpNjWJF3y1ylaD51PRZQslkWjArPxnR1/UkWWF4HGyTEJLeXd3TV2sVEym+d//J4K
         A9Qaq7OYohA3fykEG79ZQk/z2vDjK20UrYUCzA7luG+85cjzXttmBD6oTSVo7YRXoL9k
         bfqrlM983ARFP0m1o98v8u7CBpT59pHEfk5gmHeLiu/MgeMWKsjC5Y8KdRWdSOq5kywN
         WXA1SJ4iqMMamIMvnr2qeHfmEVI2yRsGOZVSynfGHRziXeZCtc7z8Os/3Aq/Lc/aceI+
         Ovk1Cybxpuxdgqe7O5qlJuxMbOl0RofnumsuscX+4EzMlLQ8sotTA+hER63A7TfqmKhx
         Y55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:cc:message-id:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=HjNZBedsFuw0ZBtpjYkbCXssQyv/l8LUL4tzZE4plgI=;
        b=TeqLlhFRzxTHqSIK4TL4iDFLAyTeEPlePXdL2rdNX0Pwsn6fdf31IBVvLNkUdr194y
         VQJz2+TG8SLGrpqCu2Aj6SMh8W+cjDv2f86sjh7Xl/YcA8Mi9Wz1FdBhWgVFhYfm+yy1
         4kQxMWrpRO8mTz7Hw0+U+0jxT0o2GKOIJdFkyjDV/0KtRlJzDwB+s5Iu2FF9U3gQbIU1
         tu8dcdgrC01E2O+8A69tihuZWy4RX1lIhbQRHInp+ajxoMHNvFfa2plMDyTMu3zZu6Qn
         rXFSuXwMoP5Ara9DIN0lYWOrPqTkjW5bUmxJJW253GtzqPTKyGtzzSFtqN5tgvXiD26Y
         SxQA==
X-Gm-Message-State: AOAM5329PfoPoQxu8lTcl1kOjWrJBsTgmDV5FtQZo1VSIintN8SpSj9r
        RroY2J1F8+jpJv1MneYhqgRIDHVehDs=
X-Google-Smtp-Source: ABdhPJx+ICg/wDcPdZwcJYPqUHuw95JkOO+wR4etB0VRCSJ2UsDiE4PxE+7IXanOA/Wk/M/VFnH0HA==
X-Received: by 2002:a65:62c4:: with SMTP id m4mr20121584pgv.453.1630295801294;
        Sun, 29 Aug 2021 20:56:41 -0700 (PDT)
Received: from [192.168.1.111] ([211.72.215.15])
        by smtp.gmail.com with ESMTPSA id w11sm5810872pfj.65.2021.08.29.20.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Aug 2021 20:56:40 -0700 (PDT)
From:   Yu-Tung Chang <mtwget@gmail.com>
To:     mtwget@gmail.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com
Subject: [PATCH] rtc: rx8010: select REGMAP_I2C
Cc:     linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Message-ID: <f58c6a58-86a6-1b37-7cec-6a9d801189ed@gmail.com>
Date:   Mon, 30 Aug 2021 11:56:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From 45801967ad80578161485937a0833b27b90210f9 Mon Sep 17 00:00:00 2001
From: Yu-Tung Chang <mtwget@gmail.com>
Date: Mon, 30 Aug 2021 10:59:17 +0800
Subject: [PATCH] rtc: rx8010: select REGMAP_I2C

The rtc-rx8010 uses the I2C regmap but doesn't select it in Kconfig so
depending on the configuration the build may fail. Fix it.

Signed-off-by: Yu-Tung Chang <mtwget@gmail.com>
---
 drivers/rtc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 12153d5801ce..f7bf87097a9f 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -624,6 +624,7 @@ config RTC_DRV_FM3130

 config RTC_DRV_RX8010
        tristate "Epson RX8010SJ"
+       select REGMAP_I2C
        help
          If you say yes here you get support for the Epson RX8010SJ RTC
          chip.
--
2.33.0
