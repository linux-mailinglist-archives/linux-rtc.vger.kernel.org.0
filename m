Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4713A54F6E3
	for <lists+linux-rtc@lfdr.de>; Fri, 17 Jun 2022 13:44:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380989AbiFQLoa (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 17 Jun 2022 07:44:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234717AbiFQLo3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 17 Jun 2022 07:44:29 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DB4E6AA5F;
        Fri, 17 Jun 2022 04:44:29 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id g25so8242657ejh.9;
        Fri, 17 Jun 2022 04:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UFNQD4AGS1otuHNhmgAy+sR0WcJsQ4GNZ3nV4M8m3ng=;
        b=ffgS0hGigjKLBNOgaQ7SUVyCxk0/ACHMeHvuop+7kccy51hBcn8M3LTRAYZIFD5wk0
         xab9v959j56FuLBUylTXlYJwUX1/Wfbl293QhWbK6ntJDSEiL1xGURdYp+3GlShzTTwx
         QRliPNxTAdMfaaEeVMj3PxmIVganrQZPFX9Gzt6k8al38UlYpqk/agH4zSMGHUMcgG5c
         orAx4gHtXalMS7Y3zYaL5snBQSmmIVD9RIpyzEKhoBDS+Uu6YWNnFiTxOrcqn4dPM5bK
         JrWiKut6qKRcstikPyCR+YCoXpSToj+yC3y+XoD9SSapTQIqJ0ed012zy0NL16Nj2mt8
         056A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UFNQD4AGS1otuHNhmgAy+sR0WcJsQ4GNZ3nV4M8m3ng=;
        b=6X2kNm7Y4odzN3GXLj8PBCw9XH0vJECcFTuGpmL+oy2tWvcwQuv3ni1IB/2rgcGCoA
         ltE864Gk37NR4DFAfK0KAPxjaexB4gJ+BLWVhowTap9TsNyt55AX7psn2mVfxxCQXOnJ
         xc4ewycwT4j9V/PuPHrK7qzRezXXeZdnFPhbtvY4KaIWl/U5gETtPGuSQSSCdBFATE1u
         EfQF0DbpgKCdUo+McSTdFvEZWayjsHkiFDafMdUELx9nkJg7yhwZ+vxB8DQX2ruNhrhR
         u7tXzY/Iw1dn1vToJ6VUhSgCKGb4wF4IcMKu9IIWxwwWmv+FQO4deV0JzUg/aSZxFhSc
         hExw==
X-Gm-Message-State: AJIora9kOXl3yS8G2vQACsjZvAi2MssHzZ+Ie2twHqviClF+JlfLrKto
        W5T6E55d8MMFyK3G2kfmj5Y=
X-Google-Smtp-Source: AGRyM1u17PlUy3nHru2DAMp1VFe9Ew7Q/00DQEomciHzqg236xqnejlGvWR0lwjvx7y1l4MNnZ03CA==
X-Received: by 2002:a17:906:7a5d:b0:712:f503:1a56 with SMTP id i29-20020a1709067a5d00b00712f5031a56mr8890264ejo.364.1655466267651;
        Fri, 17 Jun 2022 04:44:27 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id kz5-20020a17090777c500b006ff0b457cdasm2067724ejc.53.2022.06.17.04.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 04:44:26 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] dt-bindings: rtc: Add EM Microelectronic EM3027 bindings
Date:   Fri, 17 Jun 2022 13:44:20 +0200
Message-Id: <20220617114420.1398259-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220617114420.1398259-1-thierry.reding@gmail.com>
References: <20220617114420.1398259-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Document the bindings for the EM Microelectronic EM3027 RTC.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- add to list of trivial RTCs

 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index 13925bb78ec7..d9fc120c61cc 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -30,6 +30,8 @@ properties:
       - dallas,ds1672
       # Extremely Accurate I²C RTC with Integrated Crystal and SRAM
       - dallas,ds3232
+      # EM Microelectronic EM3027 RTC
+      - emmicro,em3027
       # I2C-BUS INTERFACE REAL TIME CLOCK MODULE
       - epson,rx8010
       # I2C-BUS INTERFACE REAL TIME CLOCK MODULE
-- 
2.36.1

