Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0D352653C7
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Sep 2020 23:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726968AbgIJVkh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 10 Sep 2020 17:40:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730326AbgIJNGb (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 10 Sep 2020 09:06:31 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 132D4C0617A4
        for <linux-rtc@vger.kernel.org>; Thu, 10 Sep 2020 06:05:08 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id w2so5571410wmi.1
        for <linux-rtc@vger.kernel.org>; Thu, 10 Sep 2020 06:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6nrHj9I7O9lphgMpg3nYt8s6m+DhlUlMF3Q2xQwYP4o=;
        b=JfhHhfwgFyod/Q11QsB20PWg+IXp0MwbLVKEVJL8Xc96YCyL4xey0pP2SGU5uojuTs
         DuUjgoLnOJnE2X03XlZelu56WjbjShlK8YJIoPLTPFIv048vx5ZHsjchrG0l0/qXf6zv
         zJcPOkKfIPzxM1OGvHyaxnmgcFvu7TFEfr+Ghl9yJIWUlUSGUnv7XQCAfhHRgWL0v5bP
         IWAxunEPLeefjeEALzZY1jnkyGBQDjazW9O3bcDClAhuUkxOi8l8Yfj5POLh0grL1t22
         aMdMbvtXZO0Oa7SvxlredWytF7nuav3rLEDUoUAVuLhC9xJb7DYBWfpbZ9CO5MOu5TTF
         f0Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6nrHj9I7O9lphgMpg3nYt8s6m+DhlUlMF3Q2xQwYP4o=;
        b=Es4/ZkBAyB2zqzcxiSFg3mPVC4QTU8Sa4u1IvO/PDaZrL7fwC9LmQ/PD2GPmJKe54P
         JDdPhKIfB8JSnuM1hgzDhUgCthx7SB686h/2hyFWnRx05FSNOl7MFUNKrSJoZGw+eHPq
         Om1DSxutdgdrrzAQ4TpP+5nczkw1rI2PFfdBErpZuUv2Z+sxygdJZq2UZLXLKwmz6zIb
         XNo2kpBMSlag2P7KdeN87vfQg8DoRuPUROhKFEXJ/Dm6pWUGOPop2QGUdpZkz6QDzprO
         VXedNtGeFMPLFVJ2+/73Cjxz8vHXXpsnqfgYihuakdrlZoCo6wn2k8UCIaa3gJgp5+Jh
         BOEA==
X-Gm-Message-State: AOAM531HWIju873DdNsAD0q0rNn7WJqWD+F8b1/TlByvSw2P7RDWYjB2
        1wAD6Rz/+ehsJYMALXEqanTLQg==
X-Google-Smtp-Source: ABdhPJyQlwnTdOQN8O42Q8fGi8/D7oqfz4eeL8TeUHl2gPGc3qd3UR/PR3mSgO2NeUBm2nMrBpNovA==
X-Received: by 2002:a1c:bad5:: with SMTP id k204mr8796864wmf.111.1599743106742;
        Thu, 10 Sep 2020 06:05:06 -0700 (PDT)
Received: from debian-brgl.home (lfbn-nic-1-68-20.w2-15.abo.wanadoo.fr. [2.15.159.20])
        by smtp.gmail.com with ESMTPSA id p16sm9321988wro.71.2020.09.10.06.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2020 06:05:06 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v2 08/11] rtc: rx8010: prefer sizeof(*val) over sizeof(struct type_of_val)
Date:   Thu, 10 Sep 2020 15:04:43 +0200
Message-Id: <20200910130446.5689-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200910130446.5689-1-brgl@bgdev.pl>
References: <20200910130446.5689-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Using the size of the variable is preferred over using the size of its
type when allocating memory. Convert the call to devm_kzalloc() in
probe().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/rtc/rtc-rx8010.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-rx8010.c b/drivers/rtc/rtc-rx8010.c
index e401d8ed0e19..0665878e8843 100644
--- a/drivers/rtc/rtc-rx8010.c
+++ b/drivers/rtc/rtc-rx8010.c
@@ -419,7 +419,7 @@ static int rx8010_probe(struct i2c_client *client,
 		return -EIO;
 	}
 
-	rx8010 = devm_kzalloc(dev, sizeof(struct rx8010_data), GFP_KERNEL);
+	rx8010 = devm_kzalloc(dev, sizeof(*rx8010), GFP_KERNEL);
 	if (!rx8010)
 		return -ENOMEM;
 
-- 
2.26.1

