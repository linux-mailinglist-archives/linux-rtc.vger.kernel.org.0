Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54C9F65CC93
	for <lists+linux-rtc@lfdr.de>; Wed,  4 Jan 2023 06:25:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbjADFZ1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 4 Jan 2023 00:25:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbjADFZZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 4 Jan 2023 00:25:25 -0500
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60F33175A7
        for <linux-rtc@vger.kernel.org>; Tue,  3 Jan 2023 21:25:24 -0800 (PST)
Received: by mail-qt1-x832.google.com with SMTP id a16so26471632qtw.10
        for <linux-rtc@vger.kernel.org>; Tue, 03 Jan 2023 21:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sparkcharge.io; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LV9OZ3zFtkDLpf/Q73kAo3k3wQt+efvU2HfxDW5J4xU=;
        b=Du0R4iD1kfzmb4EfxtgF+gSIOWGDbJD0iExwUv1ZDRundKTzoDa695OqloAYC0BdIX
         /n4DwNWbqEr7HA4g1IL3tlSoo0NQN+w03uf+axir/nbFf+kNPdFbcIOlOML6znSZsbjY
         nkIfCEJHC1vW0AGW15gVU9BhfdPv8zwOg2wVOSXX/nPuRQALIAEbs6+oxi9Qf6t34C1t
         eqhm8vQ30zpztA+A7FQQIAfxEF6XsVS2bhNU++qzYkuqrX8kd6KZzEzmnqdDqOox8ygP
         XU/RLiMdFYiInbF9Qjk8v6wLb5RdhVb2liw95K3SR3d2ByTcbGODDtamnxo+uiwJCOCX
         f2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LV9OZ3zFtkDLpf/Q73kAo3k3wQt+efvU2HfxDW5J4xU=;
        b=rof+WfM5Pl5/Gn7McnCepIVyg/+o0G90VObM6Qwa+GO/xhAVsvylyoqQXFc4z5ndBq
         AJUbjlsNIXP9BjEhqI1efWdG1tJ39n+71OVB8ahEMOPAfvX24ie5jXrAPtvP/HEetMTT
         aXeF6T4C/ISXsehfR1Wh9neZdKzSwEMMTVeJUg7U4x7pNcd96Dlwca9qmCgsO+5Yj22W
         rsOvAqp6H6LaVMlRwF1cXDjTrXFNd9BKAKxqYWmBkeviEkjwxtMezlTgUF9fwAVMVwQi
         pyMUwsAhWrTrPuckguf5YdbtCnHS8+zIfumHg5Mdw1qs2SVpLDvor7KvRUjJafh6wYef
         AyZQ==
X-Gm-Message-State: AFqh2krorAExrGLNJUqabaC5qAWF7CaULM5G9lel6j7cULQGd1BhyfNu
        z22sh/rZ9CkNg77vBuhREL/Hnw==
X-Google-Smtp-Source: AMrXdXsq0aGkcmpSVefm8C3EMlsbGaK7lvGqxzZYrsvn/31+eK+d69jtkytPR+yjgqAzg6dpNX8+Xw==
X-Received: by 2002:ac8:47cd:0:b0:3a7:e4ad:5499 with SMTP id d13-20020ac847cd000000b003a7e4ad5499mr70331981qtr.32.1672809923519;
        Tue, 03 Jan 2023 21:25:23 -0800 (PST)
Received: from localhost.localdomain (c-66-31-16-167.hsd1.ma.comcast.net. [66.31.16.167])
        by smtp.gmail.com with ESMTPSA id t1-20020ac865c1000000b003a7e4129f83sm19425602qto.85.2023.01.03.21.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 21:25:23 -0800 (PST)
From:   Dennis Lambe Jr <dennis@sparkcharge.io>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Atsushi Nemoto <anemo@mba.ocn.ne.jp>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        Dennis Lambe Jr <dennis@sparkcharge.io>
Subject: [PATCH v2 1/3] rtc: m41t80: probe: use IS_ENABLED for CONFIG_OF
Date:   Wed,  4 Jan 2023 05:25:04 +0000
Message-Id: <20230104052506.575619-2-dennis@sparkcharge.io>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230104052506.575619-1-dennis@sparkcharge.io>
References: <20230104052506.575619-1-dennis@sparkcharge.io>
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
undesirable if there's nothing inherently DT-specific about those
functions.

Signed-off-by: Dennis Lambe Jr <dennis@sparkcharge.io>
---

Notes:
    v1 -> v2: spelling fix in changelog

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

