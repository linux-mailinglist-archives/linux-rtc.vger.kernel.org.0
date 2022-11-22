Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E963634856
	for <lists+linux-rtc@lfdr.de>; Tue, 22 Nov 2022 21:38:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233560AbiKVUiI (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 22 Nov 2022 15:38:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233908AbiKVUiH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 22 Nov 2022 15:38:07 -0500
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DA7C1403E;
        Tue, 22 Nov 2022 12:38:06 -0800 (PST)
Received: by mail-io1-f54.google.com with SMTP id q21so11832782iod.4;
        Tue, 22 Nov 2022 12:38:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UhCFvooc16BIm6XAt1bknsHQE1+Xa927vqN9kFtC1RM=;
        b=SGnij6NAMs/hzxh02j/7dX0fuUlVVuGtLM5HwUuGU6geRPTyEMIN5fVMtlveLgkJoW
         nRbNDm6Uc/TBwEPKxlHeU4E/5agKY+4tXDg3bnWPKRacG3aiq9UKg6d434yrMlYC8lbM
         4jL6TIafOUTeDj7EX2bAADDl2vbRLCgJn5oNjf7DoegjbVorfKtTZEU8qlSGhd7iPK7W
         n2m4qF1AAXydW/3Lz4sHU7j+QkrJYpDLLDczea+RR0UNy9k9yhac/94R7u9ztjiREWHJ
         SI2/h5EqVvLT3HoqXkNQuqdT31ESXXjd5oINxb4iXDTAnokYmd/ZdVPEW/AHc79iQ0BS
         UBRA==
X-Gm-Message-State: ANoB5pmeDeCFkSgA9no69ZjRY9v3EY5NJ0oCIqM1YapH+lEfzoI6dWoa
        ilxIAQYzCj8iud6msJ2cOw==
X-Google-Smtp-Source: AA0mqf5Ay2y7CIYKiaOngtptkd+MMRSZuISPu/SzNLmBgZZx+B+T7b2U5bHjPJL26VoWXRItzbQRYQ==
X-Received: by 2002:a05:6638:328c:b0:375:365:413d with SMTP id f12-20020a056638328c00b003750365413dmr11105719jav.173.1669149485284;
        Tue, 22 Nov 2022 12:38:05 -0800 (PST)
Received: from robh_at_kernel.org ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id i4-20020a05663815c400b003755a721e98sm5674876jat.107.2022.11.22.12.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 12:38:04 -0800 (PST)
Received: (nullmailer pid 514981 invoked by uid 1000);
        Tue, 22 Nov 2022 20:28:34 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Jacky Bai <ping.bai@nxp.com>
Cc:     linux-input@vger.kernel.org, s.hauer@pengutronix.de,
        a.zummo@towertech.it, kernel@pengutronix.de, shawnguo@kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
        alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        festevam@gmail.com, dmitry.torokhov@gmail.com
In-Reply-To: <20221121065144.3667658-2-ping.bai@nxp.com>
References: <20221121065144.3667658-1-ping.bai@nxp.com>
 <20221121065144.3667658-2-ping.bai@nxp.com>
Message-Id: <166914594571.442076.9834259216884759566.robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: mfd: nxp,bbnsm: Add binding for nxp bbnsm
Date:   Tue, 22 Nov 2022 14:28:34 -0600
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


On Mon, 21 Nov 2022 14:51:41 +0800, Jacky Bai wrote:
> Add binding for NXP BBNSM(Battery-Backed Non-Secure Module).
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>  .../devicetree/bindings/mfd/nxp,bbnsm.yaml    | 103 ++++++++++++++++++
>  1 file changed, 103 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/mfd/nxp,bbnsm.example.dts:28.27-28 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:406: Documentation/devicetree/bindings/mfd/nxp,bbnsm.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1492: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221121065144.3667658-2-ping.bai@nxp.com

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command.

