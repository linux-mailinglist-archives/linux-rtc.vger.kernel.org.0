Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CBB6436B46
	for <lists+linux-rtc@lfdr.de>; Thu, 21 Oct 2021 21:23:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbhJUTZ5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 21 Oct 2021 15:25:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230020AbhJUTZ4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 21 Oct 2021 15:25:56 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30B96C061764;
        Thu, 21 Oct 2021 12:23:40 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id l5so403069lja.13;
        Thu, 21 Oct 2021 12:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=csserFjZSoEI6beCVFpYS1wBruxf7jjPaeY660IwdTg=;
        b=eK13idCDwoic1YwknS6cpOcEsHRspT5wmhgaqY5x72HGJcmNf0FEEz3SwFOELk0YxS
         mrBSjin76agcLDVfMvkeZjNScHaRfekR61NittO9/kkHtcJ2iF3FrKAE2dg9PcW1NhAc
         W0Yrx0RP05DC4nLlizhAaP3kbeLCNge1GXeVrRfFtkDVoxLoSBtrmk1DYuECI6ObnRLG
         0rUN4LwHCHfFJTupxGq5dHxCac/Dp/LVas4G8g1jN8kV/yIg8TvXccSwYousgk/kWDzS
         EOylC6nPDCdFc+8OfVS6s/fsjy7IMW38229GBNrFNuxWvbEikHlbqCrpKa8z6IwHXHCg
         TFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=csserFjZSoEI6beCVFpYS1wBruxf7jjPaeY660IwdTg=;
        b=PKAJtAmiKZ9czxhrBZLQDgMrFKQ5B+f5VQBlosELLBeoD7R9A6vE1SGOl+9aEuRCdo
         yPOxkjkIB1hX1AsujzwO+/82W7S1hshWuwvSkZrm7W7v9yekVs24gF2prV/MSpSJ92+4
         K71LtztPhhXqbNcrs5oluLLISvFC5sejEyaVjqa+6kMvyNz6r2lpxCOMJ6YEB0+7geLE
         l4g7K01Gkfab9ZZLw+gZwr2W28BQ3G6gXrgXzwiATXfJzfoJRVOfm17q2hgG/nZ9+bEt
         2GovGvK1PPuAiqQZYxA8+USwTEXsJBIFM5/6EG7zeUXyQK8GONv6hoTQ+TXy1lO5sRiL
         s2YQ==
X-Gm-Message-State: AOAM531AVAcfJaABDzjXD/GDyV+Ehz2q7wsAkMnN5W4Bcu3F8j03MLXk
        PHwmcfrY3fNKHFuCKJbQwQ/9chKrFMY=
X-Google-Smtp-Source: ABdhPJx1ilJQOelgGKQyWLaDy/MfJgk/WBC0ozTTjsHJ0DaLhiKtV3bDN6RJI9qOvR5CmWu0kuA2WQ==
X-Received: by 2002:a05:651c:1795:: with SMTP id bn21mr8162599ljb.525.1634844218584;
        Thu, 21 Oct 2021 12:23:38 -0700 (PDT)
Received: from localhost.localdomain (94-29-61-202.dynamic.spd-mgts.ru. [94.29.61.202])
        by smtp.gmail.com with ESMTPSA id c20sm533763lfi.182.2021.10.21.12.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 12:23:38 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Laxman Dewangan <ldewangan@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [PATCH v1 0/3] Remove TPS80031 driver
Date:   Thu, 21 Oct 2021 22:22:55 +0300
Message-Id: <20211021192258.21968-1-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

TPS80031 driver was upstreamed back in 2013 and never got a user. I noticed
that driver is abandoned while was about to write a patch to switch it to a
new power-off API (that I'm working on). Driver requires platform data that
nobody provides. Instead of changing the dead code, let's remove it.

Dmitry Osipenko (3):
  rtc: tps80031: Remove driver
  regulator: tps80031: Remove driver
  mfd: tps80031: Remove driver

 drivers/mfd/Kconfig                    |  14 -
 drivers/mfd/Makefile                   |   1 -
 drivers/mfd/tps80031.c                 | 526 -----------------
 drivers/regulator/Kconfig              |   9 -
 drivers/regulator/Makefile             |   1 -
 drivers/regulator/tps80031-regulator.c | 753 -------------------------
 drivers/rtc/Kconfig                    |   8 -
 drivers/rtc/Makefile                   |   1 -
 drivers/rtc/rtc-tps80031.c             | 324 -----------
 include/linux/mfd/tps80031.h           | 637 ---------------------
 10 files changed, 2274 deletions(-)
 delete mode 100644 drivers/mfd/tps80031.c
 delete mode 100644 drivers/regulator/tps80031-regulator.c
 delete mode 100644 drivers/rtc/rtc-tps80031.c
 delete mode 100644 include/linux/mfd/tps80031.h

-- 
2.32.0

