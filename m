Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D930681DBE
	for <lists+linux-rtc@lfdr.de>; Mon, 30 Jan 2023 23:10:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbjA3WKa (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 30 Jan 2023 17:10:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230496AbjA3WK3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 30 Jan 2023 17:10:29 -0500
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51E773526A;
        Mon, 30 Jan 2023 14:10:00 -0800 (PST)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-16346330067so17075941fac.3;
        Mon, 30 Jan 2023 14:10:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lw81Ox9m8bEAO1darCcd9bAwGM0pyskgkCFM54xB7Dw=;
        b=sZLdDL8jqtXnpbxbpFD5DHPU+VjwEBKU5G2agaaeI214PPrbVmDiYDYWZ4NEM6qRbc
         61I+INh/+vw7nIrG1/N77M9Ek22WrW010ctMpsTUF5omaht/9y9fFFMN1/IUaR5tgQ29
         7IcYjkHpPom614IoQL2BSTt5vmatjNi9VAJ6NrI1RM0p6EwWxr/+RsMV3TFg4suY+UPE
         b60QFzV4McE/NXDjfN1B/GVaL5QdPTgXiQ6i2lcu+NKohdgM6zLgkYvcuED5lnCS3q5d
         97BNgmes7omDn9ZWGdYR/W+D6dUovZUFa1XVSiR6kJkAwE2YWUv2ckGlg+uaDpOrLiU1
         I32Q==
X-Gm-Message-State: AO0yUKXcpBtSxhobXfy8J8BPvh5uOBObcNLoBaD+9IcXlOwgVBNWCyAQ
        9JbqIC4EBbKNsB5YEBlkWg==
X-Google-Smtp-Source: AK7set856cqhnQCPb48Kq7IYjEinJUpv3uoWOb02qiCWhiuZVNYb/yeNAQi/VqSaq0I1hkeIEt1IQA==
X-Received: by 2002:a05:6870:d38f:b0:163:6239:24f1 with SMTP id k15-20020a056870d38f00b00163623924f1mr5449536oag.36.1675116599324;
        Mon, 30 Jan 2023 14:09:59 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id gn12-20020a056870d98c00b0013ae39d0575sm5698312oab.15.2023.01.30.14.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 14:09:58 -0800 (PST)
Received: (nullmailer pid 3615591 invoked by uid 1000);
        Mon, 30 Jan 2023 22:09:58 -0000
Date:   Mon, 30 Jan 2023 16:09:58 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jacky Bai <ping.bai@nxp.com>
Cc:     shawnguo@kernel.org, a.zummo@towertech.it, lee@kernel.org,
        alexandre.belloni@bootlin.com, linux-input@vger.kernel.org,
        linux-rtc@vger.kernel.org, festevam@gmail.com,
        dmitry.torokhov@gmail.com, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-imx@nxp.com,
        s.hauer@pengutronix.de, krzysztof.kozlowski+dt@linaro.org,
        kernel@pengutronix.de, robh+dt@kernel.org
Subject: Re: [PATCH v4 1/4] dt-bindings: mfd: Add nxp bbnsm
Message-ID: <167511659739.3615531.14629886482934237177.robh@kernel.org>
References: <20230129070823.1945489-1-ping.bai@nxp.com>
 <20230129070823.1945489-2-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230129070823.1945489-2-ping.bai@nxp.com>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


On Sun, 29 Jan 2023 15:08:20 +0800, Jacky Bai wrote:
> Add binding for NXP BBNSM(Battery-Backed Non-Secure Module).
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> ---
>   - v2 changes:
>     - remove the redundant 'bindings' string
>     - add ref to rtc.yaml
>     - add start-year property
>     - rename 'regmap' to 'nxp,bbnsm-regmap' and add description & type define
>     - add header files including in the example and correct the indentation
> 
>   -v3 changes:
>     - remove the 'nxp,bbnsm-regmap' property, get the regmap directly from the
>       parent node in rtc/pwrkey driver
> 
>   - v4 changes:
>     - update the compatible string to include the soc id as Rob suggested
> ---
>  .../devicetree/bindings/mfd/nxp,bbnsm.yaml    | 101 ++++++++++++++++++
>  1 file changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/nxp,bbnsm.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
