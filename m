Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D14732B4C13
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Nov 2020 18:04:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730962AbgKPREN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 16 Nov 2020 12:04:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730396AbgKPREM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 16 Nov 2020 12:04:12 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60217C0613CF;
        Mon, 16 Nov 2020 09:04:12 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id s8so19456579wrw.10;
        Mon, 16 Nov 2020 09:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Ytpy131YfXChkVefXBJj/npVul2elHiL0f/FvnDDRqw=;
        b=LUQTrjLvqa+oFYh9d7QdGtvw/MJRzn6WZF0Hl7sEnrS5GjcsmCQ47uFMTRHIqPdS7/
         Rj7v1g588YlDjPKHuC52ckaRQ5g6CCpdHo8GZ/DP04AQsOUrQYXW8ckDWTpDTyNe8fjV
         EnBib8Bm8RPkYIAvY0LA3EV7VsIXDUytmBIyYhfEstUJWuGUBdVFQd0PMn2xr56Tx835
         BvFS4nYMQwXbh+B+SVwGjzq/iBmxRauM0CX7eh0WzlsiuW6ARgaVEAV4F+9lo++wxHWD
         oLxyRrxdhL3moXiYrvM1v7LGCNOOaXfV3o+0EC7Uis1SvY8q+MxWQbQWZXIUR6l0PTX8
         vHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Ytpy131YfXChkVefXBJj/npVul2elHiL0f/FvnDDRqw=;
        b=GMTSMJXi1DaC8JZAXiuyYR4Mxx1qql/7h23PlWR9AOvDkSO/20ms+FRREezVyVTPSF
         xQ9V4hJQGESK8Ysusq5rdr3Uf3WuV7i+A97gg02d5ISNYU/ikHKRpEWJ+fWFZN/YwxKZ
         DErsvRNr16iDmoD4qKNBF2Tmz9OJUAND4k7AtzjGqFYJyCAOp27KrciE7fnkL9i8W6yY
         v2hqD8jrkQZfhO5w/JwxkxdzIfj+bwisVJ8fspqBs6Tcd6Dd+iPXWciZ1WyZE7BGWUuy
         yia3YMXtlSWtoM3ZjVcQ6DWRHNXojp8rP1LK/Yg/qAntFp76/2Jj6fWotIvUTNBFqnH/
         NJrw==
X-Gm-Message-State: AOAM530HTucJhSYveOAsPYFg/l+oZRv7liSEvLGG7Le2lmwEVauUIy4T
        mfIITpJaz/kGoIPHUEIvNZysoTyndUhtjg==
X-Google-Smtp-Source: ABdhPJyBD20h4gSwItZ8R2pPrHI19fmIM94YDXSAfDUr2+CwfUxkevo5dfQispvXccljoij57t2fRw==
X-Received: by 2002:adf:f181:: with SMTP id h1mr19974392wro.267.1605546251120;
        Mon, 16 Nov 2020 09:04:11 -0800 (PST)
Received: from localhost.localdomain (host-92-5-241-147.as43234.net. [92.5.241.147])
        by smtp.gmail.com with ESMTPSA id u16sm23347986wrn.55.2020.11.16.09.04.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2020 09:04:10 -0800 (PST)
From:   Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-kernel@vger.kernel.org, linux-safety@lists.elisa.tech,
        linux-rtc@vger.kernel.org,
        Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] rtc: pcf8523: Use PTR_ERR_OR_ZERO
Date:   Mon, 16 Nov 2020 17:02:09 +0000
Message-Id: <20201116170209.31584-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.11.0
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Coccinelle suggested using PTR_ERR_OR_ZERO() and looking at the code,
we can use PTR_ERR_OR_ZERO() instead of checking IS_ERR() and then
doing 'return 0'.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 drivers/rtc/rtc-pcf8523.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-pcf8523.c b/drivers/rtc/rtc-pcf8523.c
index 57d351dfe272..94f182599438 100644
--- a/drivers/rtc/rtc-pcf8523.c
+++ b/drivers/rtc/rtc-pcf8523.c
@@ -358,10 +358,8 @@ static int pcf8523_probe(struct i2c_client *client,
 
 	rtc = devm_rtc_device_register(&client->dev, DRIVER_NAME,
 				       &pcf8523_rtc_ops, THIS_MODULE);
-	if (IS_ERR(rtc))
-		return PTR_ERR(rtc);
 
-	return 0;
+	return PTR_ERR_OR_ZERO(rtc);
 }
 
 static const struct i2c_device_id pcf8523_id[] = {
-- 
2.11.0

