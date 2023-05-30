Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7D957164E1
	for <lists+linux-rtc@lfdr.de>; Tue, 30 May 2023 16:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232821AbjE3OtO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 30 May 2023 10:49:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232795AbjE3OtL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 30 May 2023 10:49:11 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F18610D
        for <linux-rtc@vger.kernel.org>; Tue, 30 May 2023 07:49:09 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-51496f57e59so4008102a12.2
        for <linux-rtc@vger.kernel.org>; Tue, 30 May 2023 07:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685458148; x=1688050148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDtOZScMEhQcxZ0qCP2mG/VW4cw5TvuSdeS8G5ww6IY=;
        b=QXG1N9nMirFW5x9su+89Sr2YJxHMWbZ7KcizZ5iER13vf1DLIImohOn0evXipGmnBk
         e2KrLr9sWalAqVL9rZdCzITLPKLYpYgTu5KVHeJc2PPYQaoA9PnCswuJSsDJifPlH7Iq
         MivJ36BgLvk8rAGSn63g8E5VzaUbsSVNSzKJ91fAf4BNNBtR85ni5HYHTu8Hy64NX0Hu
         JYoHtS3br90Trzl+YOkYrkIEVZOsfeAOEUi9GLF9Qkrh5i1yR1snbODHovA8Wp66MyEA
         w1yfm3AmfAb6N21GieYTVCoXvRpNXIPyrYul8/w2zEjQ4axkaLtK0wR5uP/h0woXs/gW
         dZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685458148; x=1688050148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDtOZScMEhQcxZ0qCP2mG/VW4cw5TvuSdeS8G5ww6IY=;
        b=AiTYJUwSj2cunSSxINH3GKifItjW1zED5vw4UrponNoPl9YpQ14mRfdVm71sciFP5J
         2hfHb1zKBryC3c7HowbChjJr8DGT8aZpaB+BszDo8uvNkGZnu9X9BEmu/iTHARP1HqP7
         NKyY+udOtUsfXOoEeKKXAZXk6pOw/mgHOkb1nR0k5tVjjOfR2H/9CLGyGy4QqBiL0PFd
         h0NFHuBTfp6aJBAycHiTOoncYTvZEs3S09q5wM6GyHgYAQW4ucCIWQYSo8OK35a/z0d1
         yyqkzONQcg6zEDZrR7tvkpg1fEzyVIiEbLdVcEps6NH3DUNPU3zjn9w5qQrXpViUIYke
         MLBQ==
X-Gm-Message-State: AC+VfDwIMk9iXWOf2/VhMj427DoygvKpx64iTVrJzm9CWC7YeMx8Ap5S
        wyPbz9y6ksVJ8FqoFp+TyPwnzQ==
X-Google-Smtp-Source: ACHHUZ5gmAumXj2b1GIfXBoPyWfnVelqgUTij3Kbup650+F2Nc8xc8UrKiGkys3OMi8/buw0FLqxBg==
X-Received: by 2002:a50:ee04:0:b0:514:90de:423e with SMTP id g4-20020a50ee04000000b0051490de423emr1958340eds.36.1685458147907;
        Tue, 30 May 2023 07:49:07 -0700 (PDT)
Received: from krzk-bin.. ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id q21-20020aa7cc15000000b00514b2717ec6sm631283edt.28.2023.05.30.07.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 07:49:07 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Dipen Patel <dipenp@nvidia.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Dilip Kota <eswara.kota@linux.intel.com>,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-rtc@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-spi@vger.kernel.org, timestamp@lists.linux.dev,
        linux-watchdog@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH 4/7] dt-bindings: slimbus: restrict node name suffixes
Date:   Tue, 30 May 2023 16:48:48 +0200
Message-Id: <20230530144851.92059-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
References: <20230530144851.92059-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Make the pattern matching node names a bit stricter to improve DTS
consistency.  The pattern is restricted to:
1. Only one unit address or one -N suffix,
2. -N suffixes to decimal numbers.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Tony Lindgren <tony@atomide.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>
---
 Documentation/devicetree/bindings/slimbus/slimbus.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/slimbus/slimbus.yaml b/Documentation/devicetree/bindings/slimbus/slimbus.yaml
index 22513fb7c59a..3b8cae9d1016 100644
--- a/Documentation/devicetree/bindings/slimbus/slimbus.yaml
+++ b/Documentation/devicetree/bindings/slimbus/slimbus.yaml
@@ -15,7 +15,7 @@ description:
 
 properties:
   $nodename:
-    pattern: "^slim(@.*|-[0-9a-f])*$"
+    pattern: "^slim(@.*|-([0-9]|[1-9][0-9]+))?$"
 
   "#address-cells":
     const: 2
-- 
2.34.1

