Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19D5565125E
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Dec 2022 20:09:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231531AbiLSTJa (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 19 Dec 2022 14:09:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231831AbiLSTJ3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 19 Dec 2022 14:09:29 -0500
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4075665F6
        for <linux-rtc@vger.kernel.org>; Mon, 19 Dec 2022 11:09:27 -0800 (PST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-40b40ff39f1so139932187b3.10
        for <linux-rtc@vger.kernel.org>; Mon, 19 Dec 2022 11:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sparkcharge.io; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/CCMZCQj5dF++B+69iBkvBLnhcDqwiWIOUWa6+GvPo=;
        b=fPnsy+VG2rQkfW2tV40XYBIFVk636fd8vzN6bHaj9QYsmdNG71O8WJuAHbC/g9wgxu
         Q5NKMzQu9kOIB1g/XDA6Ho/FfSDTyzRBtIRfjWPjvkmqjx9al5mWf5TAuyaFdEbrmV4H
         YnWSsrbo9sQKWDD/Kp42iP164mM4dQj6t7liOgH/VyBAdW7wWgfXCGiM5uQAailkmGAT
         17qFRfAFqiFGZEUYgvqgRUvzlZzfSEPJ0FpDsBUHufvC/xgdzDGmNyGn6HU+tufo+mPQ
         lIRwGGvBMcBuJ6sBn+hIYHmC0+GuIzDvNy9akoRC7KrJav9KWNrIBPIIYafd2LvADxm7
         9IHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/CCMZCQj5dF++B+69iBkvBLnhcDqwiWIOUWa6+GvPo=;
        b=3WENrAFiQ/iENULkMy2nAZa+c1/kp20H8Z4O/xlJSJRzDMTeWsctxzSAvynsBsYT0z
         NJa4S1x/a/bybopQDQBa5LbBNrBQ5oJTfM6jHAX6iAVkDm8TnlvgYdyVAafFK3XuvGsM
         T7e5W5fd9+BtiO0i8Bi/NysGFoglLSSie91qENx/6RWvYfOZaBM3ltWf8XsQifiP3dEK
         n5/C4MoyHOEA/E4W1zlR3sdjquMljvFpa/rPPk2QJE6iSTYeMH7bkNaCZ3dVFrBWdz+r
         h39c6gj799m7jx75SNSsgeUCcRUj+qABMtKLu5brSQP6W57YOXogMAb2Zk3gYc1tbYFg
         ePGg==
X-Gm-Message-State: AFqh2kqzaPsE65VTDsjKgLoznMs+DVYSpFOnlBE1ldOHOKHG9nckHc+y
        EDsJ0wGjRxvYruA+NDFWoWeesg==
X-Google-Smtp-Source: AMrXdXuDeoCCe5+pQd2jPM+A4Tp7WYpi23W3eybeauxH0ZCFWkyBWziiaQSPidg+sZv51Spz27wO/w==
X-Received: by 2002:a81:1205:0:b0:393:2287:bed9 with SMTP id 5-20020a811205000000b003932287bed9mr8103033yws.40.1671476966387;
        Mon, 19 Dec 2022 11:09:26 -0800 (PST)
Received: from localhost.localdomain (c-66-31-16-167.hsd1.ma.comcast.net. [66.31.16.167])
        by smtp.gmail.com with ESMTPSA id i16-20020a05620a249000b006fa9d101775sm7503743qkn.33.2022.12.19.11.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 11:09:26 -0800 (PST)
From:   Dennis Lambe Jr <dennis@sparkcharge.io>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org, Alexander Bigga <ab@mycable.de>,
        Dennis Lambe Jr <dennis@sparkcharge.io>
Subject: [PATCH 1/3] rtc: m41t80: probe: use IS_ENABLED for CONFIG_OF
Date:   Mon, 19 Dec 2022 19:09:13 +0000
Message-Id: <20221219190915.3912384-2-dennis@sparkcharge.io>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221219190915.3912384-1-dennis@sparkcharge.io>
References: <20221219190915.3912384-1-dennis@sparkcharge.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The style guide recommends IS_ENABLED rather than ifdef for wrapping
conditional code wherever possible.

Functions that are only called on DeviceTree platforms would otherwise
need to be cluttered up with __maybe_unused, which is especially
undesireable if there's nothing inherently DT-specific about those
functions.

Signed-off-by: Dennis Lambe Jr <dennis@sparkcharge.io>
---
 drivers/rtc/rtc-m41t80.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
index 494052dbd39f..f963b76e5fc0 100644
--- a/drivers/rtc/rtc-m41t80.c
+++ b/drivers/rtc/rtc-m41t80.c
@@ -909,10 +909,11 @@ static int m41t80_probe(struct i2c_client *client)
 	if (IS_ERR(m41t80_data->rtc))
 		return PTR_ERR(m41t80_data->rtc);
 
-#ifdef CONFIG_OF
-	wakeup_source = of_property_read_bool(client->dev.of_node,
-					      "wakeup-source");
-#endif
+	if (IS_ENABLED(CONFIG_OF)) {
+		wakeup_source = of_property_read_bool(client->dev.of_node,
+						      "wakeup-source");
+	}
+
 	if (client->irq > 0) {
 		rc = devm_request_threaded_irq(&client->dev, client->irq,
 					       NULL, m41t80_handle_irq,
-- 
2.25.1

