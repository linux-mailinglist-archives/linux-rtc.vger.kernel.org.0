Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B67D862DB44
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Nov 2022 13:40:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240157AbiKQMkJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 17 Nov 2022 07:40:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239662AbiKQMjV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 17 Nov 2022 07:39:21 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 484D2742C1
        for <linux-rtc@vger.kernel.org>; Thu, 17 Nov 2022 04:39:10 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id r12so2599140lfp.1
        for <linux-rtc@vger.kernel.org>; Thu, 17 Nov 2022 04:39:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugMBQI/CGdLw5JdCEtKoVTwaKmCj5RmUXEMoLxKIBbk=;
        b=lcPHPPZLPVoOh2gvUJWQXtKOOX+svrikFq3/iElv3IWxcU7NSiqM7IOaXs2C2lE1LK
         NQ6Mz7EYFwXmyDOarXfupzphKJE/2muZN5dpHj1Ji5Q/l0UvY0bO8CFrfHvKOBMiI+uN
         S/TPz9ieFvvfxxdSXt3WhiyXNJV4QoFZ1g+PkzZ+mDds6QZ+7D2h1GyWPOXifD82XpBi
         Ft6RfBe9attwb737JofFZOKfzoS5WAjTDxQE2vnp0UKggWaxApdqploNwzYw1yZdrnuJ
         YtUxd6G7fjvoTeu+xeLg+/kPu01LnjMI5ELRkq/DhmeqN5xwLzMsfXJDlWkL7wtqmLEL
         96kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugMBQI/CGdLw5JdCEtKoVTwaKmCj5RmUXEMoLxKIBbk=;
        b=AHz1qH3lquOf5PvQUFYUtyt/xJBpV/wI3FIZ4/jnwwdBImlGlYn0xeazo8U9lXn0LU
         sLLdODXBkN7cP6go0MIXC4vRZNnLH2MMoye1eZh8iyuHhSTxqshylgOB/fXplHUwUpzL
         nXaAGZi53MUO/xGxuVTrAwFskvppVzPyfY7qLVdEdIV4v0NZquPT6IiQ3d5BOKWb/ye3
         YII6os7O2QW0nlTOp3y3bPebtS1BtpMOmF2nxKcN/6uJk8hlK5wlXB+Xzxe6ncj5uyuc
         UJMc4FRVGx+nxJmHH0K719tZfo78QRY2/D16sdsdqDsy/UvoiiydDh4ZDs7nQo5efUSj
         A2DA==
X-Gm-Message-State: ANoB5plp01estbqdQMYVCxLpztUwmr63h5cLozh2JyYa/hvOawGU8LtB
        XED5PSMsDIdCeDEH+DXryZXPrg==
X-Google-Smtp-Source: AA0mqf5J4zgczTAjGCzd24Jcix6qL84UxPJ/LL1MaY0euJIStPemkPT1hJEMAHEevs8ExijdUCjPEQ==
X-Received: by 2002:a05:6512:746:b0:4a2:4f74:f47c with SMTP id c6-20020a056512074600b004a24f74f47cmr773458lfs.367.1668688748094;
        Thu, 17 Nov 2022 04:39:08 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id u28-20020ac24c3c000000b004972b0bb426sm127855lfq.257.2022.11.17.04.39.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 04:39:07 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
        netdev@vger.kernel.org, linux-can@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-serial@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-spi@vger.kernel.org,
        linux-usb@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-watchdog@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFC PATCH 2/9] dt-bindings: memory-controllers: ti,gpmc-child: drop redundant part of title
Date:   Thu, 17 Nov 2022 13:38:43 +0100
Message-Id: <20221117123850.368213-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221117123850.368213-1-krzysztof.kozlowski@linaro.org>
References: <20221117123850.368213-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

The Devicetree bindings document does not have to say in the title that
it is a "Devicetree binding", but instead just describe the hardware.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/memory-controllers/ti,gpmc-child.yaml   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
index 4a257fac577e..532a91d6c564 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ti,gpmc-child.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/memory-controllers/ti,gpmc-child.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: device tree bindings for children of the Texas Instruments GPMC
+title: Texas Instruments GPMC bus child nodes
 
 maintainers:
   - Tony Lindgren <tony@atomide.com>
-- 
2.34.1

