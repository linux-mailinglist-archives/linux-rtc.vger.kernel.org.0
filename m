Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28593580007
	for <lists+linux-rtc@lfdr.de>; Mon, 25 Jul 2022 15:36:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232799AbiGYNgr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 25 Jul 2022 09:36:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231282AbiGYNgq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 25 Jul 2022 09:36:46 -0400
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C39213DFF;
        Mon, 25 Jul 2022 06:36:45 -0700 (PDT)
Received: by mail-oi1-f181.google.com with SMTP id bb16so13443706oib.11;
        Mon, 25 Jul 2022 06:36:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=OVuAV4zEqV8OvcfuWI261n47Dfimj3n0F6abvdO9uP0=;
        b=sHZSAI8Tcb7uQWH3Qev99G9HrLzREhT5MjeMORLvAZ7/TIZwYT3F+5Ka4lcXiP0HnZ
         t/pgs6vQQPV55d8dto5vo1iQ1fxUrXG/bvoUH6CDRaKX8Qg6gwOcHMjYQUIAGjMCTP8q
         1aGCF1RTQWRafAKE0tPFWK2zQ5GiHGvoJNrK6upBDDf9YRBrmfx5BGRNQGDwelpu6xO+
         30l/8wtpDyt2gjP/ta3MYPWCBH/HoAJQG043F/3vhAp637VjquxAq4QrFBbZymEVIJbm
         Sm7WMWzfM/kdXarIumZI9JZ2FGs7NMe576FTMcYjaMTKxvrMmXS2WmxDla9xtuwYTYPt
         BbsQ==
X-Gm-Message-State: AJIora9WkfVTycKfe1u1DaaRbsjkNCR01GqvFHQSbjD+KflwXzJvuvsx
        NNJcBJ9MCJvQOIZhjrIDPFO4ThA6Lg==
X-Google-Smtp-Source: AGRyM1tMJv5zEKT0OvXgcHFTrOd+Ln3XLbxvFY76hfSYJLaRK/o7G//VqcGAZEpnH28VbJp1MOKZaQ==
X-Received: by 2002:a05:6808:150e:b0:33a:9e31:7049 with SMTP id u14-20020a056808150e00b0033a9e317049mr5608196oiw.47.1658756204478;
        Mon, 25 Jul 2022 06:36:44 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id 65-20020aca0644000000b00339c8aab320sm4889867oig.3.2022.07.25.06.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 06:36:43 -0700 (PDT)
Received: (nullmailer pid 1989016 invoked by uid 1000);
        Mon, 25 Jul 2022 13:36:42 -0000
From:   Rob Herring <robh@kernel.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     linux-rtc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <20220725071919.25342-1-alexander.stein@ew.tq-group.com>
References: <20220725071919.25342-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v3 1/1] dt-bindings: rtc: nxp,pcf85063: Convert to DT schema
Date:   Mon, 25 Jul 2022 07:36:42 -0600
Message-Id: <1658756202.615935.1989014.nullmailer@robh.at.kernel.org>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 25 Jul 2022 09:19:19 +0200, Alexander Stein wrote:
> Convert the NXP PCF85063 RTC binding to DT schema format.
> 
> Add 'interrupts' and 'wakeup-source' as this device has an interrupt
> which was not documented, but is in use.
> 'clock-output-names' and '#clock-cells' are added as well, those were
> probably missed when adding clkout support in commit 8c229ab6048b
> ("rtc: pcf85063: Add pcf85063 clkout control to common clock framework")
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Krzysztof, thanks for your review.
> 
> Changes in v3:
> * Added constraints for rv8263 & pcf85063 regarding 'quartz-load-femtofarads'
> * Fixed example
> 
> I have to admit I could not actually verify in the registers that pcf85063 is
> limited to 7pF. I was not able to find any datasheet containg the registers,
> only a product brief [1] indicating this limit.
> 
> Changes in v2:
> * Sorted compatible list
> * Mentioned new #clock-cells and clock-output-names properties in commit message
> * Removed 'interrupt-names', not needed/used anyway
> * Fixed quartz-load-femtofarads defintion/description
> 
> [1] https://www.mouser.de/pdfDocs/NXP_PCF85063_PB.pdf
> 
>  .../devicetree/bindings/rtc/nxp,pcf85063.txt  | 32 -------
>  .../devicetree/bindings/rtc/nxp,pcf85063.yaml | 92 +++++++++++++++++++
>  2 files changed, 92 insertions(+), 32 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/rtc/nxp,pcf85063.txt
>  create mode 100644 Documentation/devicetree/bindings/rtc/nxp,pcf85063.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


rtc@51: 'interrupt-names' does not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx.dtb

rtc@51: quartz-load-femtofarads:0:0: 7000 was expected
	arch/arm/boot/dts/imx6dl-skov-revc-lt2.dtb
	arch/arm/boot/dts/imx6dl-skov-revc-lt6.dtb
	arch/arm/boot/dts/imx6q-skov-revc-lt2.dtb
	arch/arm/boot/dts/imx6q-skov-revc-lt6.dtb
	arch/arm/boot/dts/imx6q-skov-reve-mi1010ait-1cp1.dtb

