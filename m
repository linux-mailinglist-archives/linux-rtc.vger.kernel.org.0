Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7AC4336CA
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Oct 2021 15:17:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235754AbhJSNT4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 19 Oct 2021 09:19:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbhJSNTx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 19 Oct 2021 09:19:53 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A57FC061749
        for <linux-rtc@vger.kernel.org>; Tue, 19 Oct 2021 06:17:40 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id g10so12717529edj.1
        for <linux-rtc@vger.kernel.org>; Tue, 19 Oct 2021 06:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CLwoj+6JAPRwJLN1t16G8nJ5cVwOPwSD+DoR9oMRdGo=;
        b=Ce0pB2XnJ+pcLL2gsKKvP2WllA50+0p0z3nSPDgL9rRvVDr8GuCEUScOxoISc0JDtD
         JUH39WNcf1/ctHX4+13bPoaRYo/g4I9asCanwyGT6LQ9b/qSX2VupzM0frUUGpsF2id+
         QjU0BPt1HYGVOlWpRkUn88bxkitUEmJcgOH2r3Ih41zGKXsNRf1R7FVn3qAJ0m9Zy14n
         HM7RF1ItY3IA6dLByqKKm9B0sHIxxaIoLCW6lxpIKPbSsV/a1LWO2Jak0F0zYksHBKC8
         uRpQDUabBmOpgeybcjgNQgCmd+Vg+JxsxshiulhhxU8NDb38LC685Do9unfetNZCr3nn
         6JFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CLwoj+6JAPRwJLN1t16G8nJ5cVwOPwSD+DoR9oMRdGo=;
        b=cNxLQIycUQTnRTm01yxDR1J9qPyOfQS2aqECWU1h4hy3wcT6PHdZXTaPb956KIFyLg
         ztYhPHxkh2PfORBgQMg9t2/s39aEhbT9rboLwvYfQO0AYbLZOjIKBLc/h0uFGBcKf3Sy
         pBAUwe8owXIkZhxTTwaaF2jb99J277hhuO65Yxjv9RXF1Sie5r7f83wNl1WLX/S1TF4k
         3xfc5lEYSshTUmr+rUPMv/OQznF0TPIjVsp+CYAsbPWpKGj7cmNGG5GgpgmlBfTxHrFI
         tc5/yLea7q0T5fzacic2khVRbl1Hs25co1uip2MQB0+dILd8C+dGxqOhV2bSfR5n+vx+
         NB2Q==
X-Gm-Message-State: AOAM530kxLACXW4mr2V7LUbMf5KvuG3nLw/dc4wU+ME9gPZwQFxq5+Ua
        jmGIRGrsZgY72+XPEg7/tQzAsg==
X-Google-Smtp-Source: ABdhPJz6hO1n6bf4YP3H5z8nwduKJpChBhWhubdocyUag2dkgE+qTnSevm5Ng34/Uat60/YIGTgWQg==
X-Received: by 2002:a05:6402:cb2:: with SMTP id cn18mr51008114edb.249.1634649446707;
        Tue, 19 Oct 2021 06:17:26 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id d22sm10490086ejj.47.2021.10.19.06.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 06:17:26 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] rtc: s3c: S3C driver improvements
Date:   Tue, 19 Oct 2021 16:17:20 +0300
Message-Id: <20211019131724.3109-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

While working on Exynos850 support (where this driver works fine in its
current state), I've stumbled upon some minor issue. This is the effort
to fix those. [PATCH 1/4] was already sent as a separate submission, but
Alexandre Belloni asked me to set time range while at it. This is done
in this series, in [PATCH 2/4]. So first two patches are basically
moving S3C RTC driver to newer API usage. And last two patches fixing
some error message which I noticed when doing the very first boot of my
board (when RTC registers are not initialized with S3C driver yet).
Patches 1/4 and 3/4 don't introduce any functional changes, only doing
some refactoring and cleaning up.

Sam Protsenko (4):
  rtc: s3c: Remove usage of devm_rtc_device_register()
  rtc: s3c: Add time range
  rtc: s3c: Extract read/write IO into separate functions
  rtc: s3c: Fix RTC read on first boot

 drivers/rtc/rtc-s3c.c | 137 +++++++++++++++++++++++++++++-------------
 1 file changed, 96 insertions(+), 41 deletions(-)

-- 
2.30.2

