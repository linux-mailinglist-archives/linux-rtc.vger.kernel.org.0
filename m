Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B100320696C
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jun 2020 03:21:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387916AbgFXBVv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 23 Jun 2020 21:21:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387761AbgFXBVv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 23 Jun 2020 21:21:51 -0400
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2FB3C061573;
        Tue, 23 Jun 2020 18:21:50 -0700 (PDT)
Received: by mail-qt1-x841.google.com with SMTP id e12so428220qtr.9;
        Tue, 23 Jun 2020 18:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=txJPzANDLZA/zCp7w12cv1QnOI9jTpDX4eklhPyYXbw=;
        b=gaJP3cF7Dk7i226eYnKM0oB52NJRBsaTIkbTN7Fi35BR0ZlqmyUgMhxgIH2UwFY9pf
         paSV/f0XPy3FwbzPrl2s3CF352uTpGdjHplfJYKM22eEb0NXdP5qmFCQeHFtZNvTRXVV
         beAXqJuonjcBioya1b22YNDnwVvCx3nib1c122JsyW+ty1bHdveCinxUUKrKwiMvG3B2
         +mtH9KQdXf1QXfnJSwni2a8hiTbVl1cxoj0fxAiYtJJl9pIlnAVE4nJGjH2FJKYJ7m0o
         CBdsHDryZIonLeyLU6DyM8b6nRKLX1g0IoWOiCQLkI8JTvXAkIkDoAZy43MuHlIOMyL0
         t3og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=txJPzANDLZA/zCp7w12cv1QnOI9jTpDX4eklhPyYXbw=;
        b=Rp0YgmXKSGFefvADXPop4wJnsMRB54Tl+FLbWXFdXrW8PDeqvpxw8Q+3E4bqyclGgk
         ajc0iN2Aa24kiWhN6Oqy9BG+LIcv40A0AwqKxbxY65AnUU4A55WhLXkwG8w9RG5adC7B
         ePFoLT2mY9y/iLLWvGUuoTdkfORA6T54hLn0ZkWeuMsdrkVYWOoP1PtM7+EgP1ArY28Z
         qlI8sKsXliE6RaPnHzAsILuOA8xLuObWyyaa7MTwp3yv+2gKn7pavZVPwgZ+rMx3dew3
         Y39wpy1Av7fyTzGKtfK7ciutIF1zvPJJ9ieIkh3QWL2MGOHR90MxbuxUrnUN4DS6qyry
         lW5A==
X-Gm-Message-State: AOAM530+NNLtzQOoQzrzGGqI47eJh2zCOqKExqERpkS+1vuQfM4T1ZMb
        KCV9kyUSvgCLEmEbfvFBncQ=
X-Google-Smtp-Source: ABdhPJyE8MW42xgdaHIn7HPazuE3h0+sANm89AjaI5wmOF7S0Bn1mKgLqL/MX+sypxtkj8V7jHZN5A==
X-Received: by 2002:ac8:8a4:: with SMTP id v33mr15262860qth.392.1592961709983;
        Tue, 23 Jun 2020 18:21:49 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:712c:e542:fd5b:52d3:4072])
        by smtp.gmail.com with ESMTPSA id v59sm2120129qte.96.2020.06.23.18.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 18:21:49 -0700 (PDT)
From:   "Tales L. da Aparecida" <tales.aparecida@gmail.com>
To:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, linux-rtc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     andrealmeid@collabora.com,
        "Tales L. da Aparecida" <tales.aparecida@gmail.com>
Subject: [PATCH] rtc: imxdi: fix trivial typos
Date:   Tue, 23 Jun 2020 22:21:19 -0300
Message-Id: <20200624012119.54768-1-tales.aparecida@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Fix typos 'pionter' -> 'pointer' and 'softwere' -> 'software'

Signed-off-by: Tales L. da Aparecida <tales.aparecida@gmail.com>
---
 drivers/rtc/rtc-imxdi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-imxdi.c b/drivers/rtc/rtc-imxdi.c
index f21dc6b16d88..8d141d8a5490 100644
--- a/drivers/rtc/rtc-imxdi.c
+++ b/drivers/rtc/rtc-imxdi.c
@@ -95,7 +95,7 @@
 
 /**
  * struct imxdi_dev - private imxdi rtc data
- * @pdev: pionter to platform dev
+ * @pdev: pointer to platform dev
  * @rtc: pointer to rtc struct
  * @ioaddr: IO registers pointer
  * @clk: input reference clock
@@ -350,7 +350,7 @@ static int di_handle_invalid_and_failure_state(struct imxdi_dev *imxdi, u32 dsr)
 			 * the tamper register is locked. We cannot disable the
 			 * tamper detection. The TDCHL can only be reset by a
 			 * DRYICE POR, but we cannot force a DRYICE POR in
-			 * softwere because we are still in "FAILURE STATE".
+			 * software because we are still in "FAILURE STATE".
 			 * We need a DRYICE POR via battery power cycling....
 			 */
 			/*
-- 
2.27.0

