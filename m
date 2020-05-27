Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 144FD1E4703
	for <lists+linux-rtc@lfdr.de>; Wed, 27 May 2020 17:07:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389316AbgE0PHL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 27 May 2020 11:07:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388922AbgE0PHK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 27 May 2020 11:07:10 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3A5DC05BD1E;
        Wed, 27 May 2020 08:07:10 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id z26so11927717pfk.12;
        Wed, 27 May 2020 08:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JBMhR/E6YxOWzbmlEXEk9KBZIqv6+OPXL6Fa2JH9S9E=;
        b=CAQrcI47RH2LponFhwU9pyD+TTHIPaukEhD4HwWtShJpo8VT2JAqL15Znuh64varDB
         Qj48XGJClDwnxPtcwZo7THveNeYW8YKKrhek031jVVPxhpItzBi9ZgCXdtL7S8HfIpGt
         h3K7gymfo4nyPedMTeTNDbTUH1+6itCXcpsnODAnLwjtCsI/7CV/26vhsS8/yZ1jzod4
         yl9jeRs8Swigjbr4fLOgE824FaocjylZzw0h0ey25k+bL+5azXaH7XyrLMnnBPft628F
         /95F5SwSdbKgkZFnZ8bgPF5MECdIjACPqpZ2Z6NYvO1GNqARMuAQuQ605Tcm3nN273kF
         nB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JBMhR/E6YxOWzbmlEXEk9KBZIqv6+OPXL6Fa2JH9S9E=;
        b=aZdxmXTXxrqVFYK3nql4rfge43L3pgfTnV9WX4WBbv6ILE1JsnGqX8F2J7FIcJ7rC3
         yIWkX8zAM90d840bbAMj1NDh4Y9tLeCyDOpvjf0EtcBHY0LSJgPlar02W9RwP6yP8HCd
         FRM7DC7Hyf5NwUcFic+lYhg1RDdtqKXN9ydCz1c/ILMa5t7+Wp76HSWgMmzjzhAS+HFz
         klvC33OChcWgzPb9tlxL5ef/1QIr+H25A53zwkPU5j9HgRzpzPKmnmZp2qARoNVMMTH4
         fPj+0LBZlSioctazjmE/IBFbIRDWKPO5xBWVvye6W9bcSRMd/3S14qFClVPKPm4rVAre
         Zc8g==
X-Gm-Message-State: AOAM5333FcZfsxgkpMYGBhuWUwp/AXlQZc28/w9HmSiikd47KKdWSSff
        8wyJSV0p35u7kMECrhdFPvNFxmQtinE=
X-Google-Smtp-Source: ABdhPJyKDMkGx+dsSJqCjjr2+ctNeg3f4rTXqsQK+jQvAyZypbK/eut1SVUlbgWn2njTtnCgHOd6gw==
X-Received: by 2002:a63:4a1d:: with SMTP id x29mr4301681pga.53.1590592030456;
        Wed, 27 May 2020 08:07:10 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
        by smtp.gmail.com with ESMTPSA id j15sm2970961pjj.12.2020.05.27.08.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2020 08:07:09 -0700 (PDT)
From:   Chuhong Yuan <hslester96@gmail.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Chuhong Yuan <hslester96@gmail.com>
Subject: [PATCH] rtc: rv3028: add the missed check for devm_regmap_init_i2c
Date:   Wed, 27 May 2020 23:07:04 +0800
Message-Id: <20200527150704.539315-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

rv3028_probe() misses a check for devm_regmap_init_i2c().
Add the missed check to fix it.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
 drivers/rtc/rtc-rv3028.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/rtc/rtc-rv3028.c b/drivers/rtc/rtc-rv3028.c
index a0ddc86c975a..ec84db0b3d7a 100644
--- a/drivers/rtc/rtc-rv3028.c
+++ b/drivers/rtc/rtc-rv3028.c
@@ -755,6 +755,8 @@ static int rv3028_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	rv3028->regmap = devm_regmap_init_i2c(client, &regmap_config);
+	if (IS_ERR(rv3028->regmap))
+		return PTR_ERR(rv3028->regmap);
 
 	i2c_set_clientdata(client, rv3028);
 
-- 
2.26.2

