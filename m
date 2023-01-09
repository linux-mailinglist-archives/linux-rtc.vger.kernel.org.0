Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF2ED6625FE
	for <lists+linux-rtc@lfdr.de>; Mon,  9 Jan 2023 13:54:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236108AbjAIMyJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 9 Jan 2023 07:54:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236276AbjAIMxs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 9 Jan 2023 07:53:48 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36A1916488
        for <linux-rtc@vger.kernel.org>; Mon,  9 Jan 2023 04:53:41 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id m26-20020a05600c3b1a00b003d9811fcaafso6620023wms.5
        for <linux-rtc@vger.kernel.org>; Mon, 09 Jan 2023 04:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eHeD4/5Q26ruqFmP/If/k2xNMCXAhjZeCMYfTgUbKRU=;
        b=ST+d6exv+eSO89qaxYEHQlIUZjwGyGwBJ4xr+vru1zfL5TKvPyAhqO8Pkx0pwPrsz+
         jgw4926gADuQo43X4dvIXEFVEX+2jkFCW71Ibl6xlz8rEKH4KDOuwPJavaTNh6Xc5P0A
         AjwReWC2HFTNu9qYXgDmUygMPt7ZAvBkFipkWakWAcAxMsf5vwA9wpujm+DSd3CLhQ62
         Fm9K10aodqGSrxbo5Zu0m7mpFDY6eTc0BH5igwv8WsKfuWKKBwQ+/tSlmb8JcRvYv2nf
         gApIKGwFDwKoKVFmWMoGxExR8BxoEEnI+UkTInipxpBoGPl/IFugqltGY0B5Ddf6azXK
         M/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHeD4/5Q26ruqFmP/If/k2xNMCXAhjZeCMYfTgUbKRU=;
        b=dV1gi1DDPFiZxaNk6fFMjyRR+HbObqx7nkxZLguXsyYdUmIoNl6blSaQ7eE3q345Zx
         9OI3ZF0nUTXByA8tuHAZbpMhhsI+tQwWVzxtTRDyzyY/ITnhNFG9d15rOtcqs+L6LuVu
         2UeYi82s/mBBiNF6IYf1saeysQg3JQTIn6ktR95rqnw4nYmxL0u5QuipEb5hcJERm4ha
         EXiZz2UPNpGKwnkk1jHvYmYDRVRaycG/kOICQnn7sEdDdzdyOH3ljUoo1IeZWbCEoYXL
         srROaNkvuLPtEkwO1G5R/WGNGAeYvRaRd+vNCQEJpbIqqgmEXU6IcFcSu34DxcB/+ufl
         e1RA==
X-Gm-Message-State: AFqh2kpOA/fdgx85qENPkSoKWLuGcfNYR1fAGH+jYUaT6QLZ+QjmkrRt
        ZX7k+nqih7COL7bmwxyTUhyQiw==
X-Google-Smtp-Source: AMrXdXsaurQF4EtQDAHouXVvSJBqCu54hP/k4K5wC/jqtSrGfESg6vwwkM/iQm8oVMP1uuBrED7e8A==
X-Received: by 2002:a05:600c:3d05:b0:3d3:5c21:dd94 with SMTP id bh5-20020a05600c3d0500b003d35c21dd94mr48020557wmb.9.1673268820053;
        Mon, 09 Jan 2023 04:53:40 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id y7-20020a7bcd87000000b003d997e5e679sm12805667wmj.14.2023.01.09.04.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 04:53:39 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Date:   Mon, 09 Jan 2023 13:53:30 +0100
Subject: [PATCH v2 06/11] dt-bindings: power: amlogic,meson-gx-pwrc: mark
 bindings as deprecated
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221117-b4-amlogic-bindings-convert-v2-6-36ad050bb625@linaro.org>
References: <20221117-b4-amlogic-bindings-convert-v2-0-36ad050bb625@linaro.org>
In-Reply-To: <20221117-b4-amlogic-bindings-convert-v2-0-36ad050bb625@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, linux-pci@vger.kernel.org,
        netdev@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.11.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The amlogic,meson-gx-pwrc-vpu compatible isn't used anymore since [1]
was merged in v5.8-rc1 and amlogic,meson-g12a-pwrc-vpu either since [2]
was merged in v5.3-rc1.

[1] commit 5273d6cacc06 ("arm64: dts: meson-gx: Switch to the meson-ee-pwrc bindings")
[2] commit f4f1c8d9ace7 ("arm64: dts: meson-g12: add Everything-Else power domain controller")

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/power/amlogic,meson-gx-pwrc.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/amlogic,meson-gx-pwrc.txt b/Documentation/devicetree/bindings/power/amlogic,meson-gx-pwrc.txt
index 99b5b10cda31..ba5865ae6bfe 100644
--- a/Documentation/devicetree/bindings/power/amlogic,meson-gx-pwrc.txt
+++ b/Documentation/devicetree/bindings/power/amlogic,meson-gx-pwrc.txt
@@ -1,5 +1,5 @@
-Amlogic Meson Power Controller
-==============================
+Amlogic Meson Power Controller (deprecated)
+===========================================
 
 The Amlogic Meson SoCs embeds an internal Power domain controller.
 

-- 
2.34.1
