Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40C5679081E
	for <lists+linux-rtc@lfdr.de>; Sat,  2 Sep 2023 15:44:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbjIBNoT (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 2 Sep 2023 09:44:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbjIBNoS (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 2 Sep 2023 09:44:18 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC0A2E5B;
        Sat,  2 Sep 2023 06:44:15 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6bb1133b063so4730a34.1;
        Sat, 02 Sep 2023 06:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693662255; x=1694267055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t5MW0CXTPSk+NqmypdFWCwTdnSw+85UwrhKdEQ+oUfQ=;
        b=GYxziEkge88vA+P4JM3XWG4ud/YhaxLxG5H1hTghzvlicrGi8CGHdNQqPoJ7iWixQ+
         +celG7astF2j7eEf0LQ4C9yqR5H5ioEQTtGkctMRorXNNM18G2hZNcdb5GwnCc8MhOvN
         CTWf2ZP9dOwaOWF3vwQzvaZabXdroNbo7nePsm6uD+glVCpLb/X5HMKkUMwJxGNbyuc1
         3jHQToBL56yeFhv3R/rkvjRVSWlixL4XnpRj81aq8Na2/iu8q+NFsIxU2f+XkrhynLU2
         0SLFDpcSDPFJYh12T57huoLiI2cLDDBnSZQHfytIbY2bXA9S9kLUo2Bh1XfV95uSpmL6
         EUjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693662255; x=1694267055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t5MW0CXTPSk+NqmypdFWCwTdnSw+85UwrhKdEQ+oUfQ=;
        b=BxvzZkaqYprd+AWhWg7dLTWRRz42Ez/eG4490kDuwRdVUenj7mgBegpDRhXmhGG4l4
         z5c+o9xC9riNY7+rX+gZRmypedExciG67gcUOOKpn4H6GMeXuDv/RL+6d57aKozQdZvr
         /3D9p48cD43/sg18hzw5l4siiR7x51wIrR2WJTRGPV/kSL5fbRauXsik1oVnubkOdUPA
         vi5cGNsQY07KiyJkzFKXVrVWxs3CJq3j+39lPgKCsjNLGI9Km0r2pj/SwrSmurTG/KHu
         2ashiJX4ICJnqA9YneAM9rp71IKIfYUKg8HywRM/302QUAhP30konpuQ1crU52M27ETG
         pWow==
X-Gm-Message-State: AOJu0YzUMxJ3BitH6YFA4odpIwMVQnViSDXurYyOvI2i7iGL5MUd6BRy
        W6B5qlKzD2La8I4a6wfr3a9OERx0fUU=
X-Google-Smtp-Source: AGHT+IHazI+oEZzC17Pw/8wNRX2LvFHtXHdtmAVoX1ZfY6izvZxD7DQ9Etep4pQMpovEvtps4J1Nhw==
X-Received: by 2002:a05:6830:6a9b:b0:6bc:a6d0:ab7 with SMTP id da27-20020a0568306a9b00b006bca6d00ab7mr3625338otb.3.1693662255017;
        Sat, 02 Sep 2023 06:44:15 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:24a7:7a7d:d9f7:937b])
        by smtp.gmail.com with ESMTPSA id l2-20020a05683004a200b006b8c6eb962esm2791560otd.52.2023.09.02.06.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Sep 2023 06:44:14 -0700 (PDT)
From:   Fabio Estevam <festevam@gmail.com>
To:     alexandre.belloni@bootlin.com
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
Subject: [PATCH] dt-bindings: rtc: ds3231: Remove text binding
Date:   Sat,  2 Sep 2023 10:44:07 -0300
Message-Id: <20230902134407.2589099-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Fabio Estevam <festevam@denx.de>

The "maxim,ds3231" compatible is described in the rtc-ds1307.yaml, so
there is no need to keep the text bindings version.

Remove the maxim,ds3231.txt file in favor of the rtc-ds1307.yaml binding.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 .../devicetree/bindings/rtc/maxim,ds3231.txt  | 38 -------------------
 1 file changed, 38 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/rtc/maxim,ds3231.txt

diff --git a/Documentation/devicetree/bindings/rtc/maxim,ds3231.txt b/Documentation/devicetree/bindings/rtc/maxim,ds3231.txt
deleted file mode 100644
index 85be53a42180..000000000000
--- a/Documentation/devicetree/bindings/rtc/maxim,ds3231.txt
+++ /dev/null
@@ -1,38 +0,0 @@
-* Maxim DS3231 Real Time Clock
-
-Required properties:
-- compatible: Should contain "maxim,ds3231".
-- reg: I2C address for chip.
-
-Optional property:
-- #clock-cells: Should be 1.
-- clock-output-names:
-  overwrite the default clock names "ds3231_clk_sqw" and "ds3231_clk_32khz".
-
-Each clock is assigned an identifier and client nodes can use this identifier
-to specify the clock which they consume. Following indices are allowed:
-    - 0: square-wave output on the SQW pin
-    - 1: square-wave output on the 32kHz pin
-
-- interrupts: rtc alarm/event interrupt. When this property is selected,
-  clock on the SQW pin cannot be used.
-
-Example:
-
-ds3231: ds3231@51 {
-	compatible = "maxim,ds3231";
-	reg = <0x68>;
-	#clock-cells = <1>;
-};
-
-device1 {
-...
-	clocks = <&ds3231 0>;
-...
-};
-
-device2 {
-...
-	clocks = <&ds3231 1>;
-...
-};
-- 
2.34.1

