Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E919C68287E
	for <lists+linux-rtc@lfdr.de>; Tue, 31 Jan 2023 10:17:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232613AbjAaJRc (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 31 Jan 2023 04:17:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232476AbjAaJRT (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 31 Jan 2023 04:17:19 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99DA49EFC;
        Tue, 31 Jan 2023 01:16:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D3B64B81A76;
        Tue, 31 Jan 2023 09:15:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50235C433EF;
        Tue, 31 Jan 2023 09:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675156558;
        bh=ruW9JF/5GyV2/8APV2iWJWlThbmDFU9lgtqCsmQcb/Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ikuWoXd7XkbjgjkN2cV8Ixmcz1/W2QxTIyQD9Yvs03yhPODaS1AA7+0N+FP49CHZt
         lLgQxTSxbZ4cPKEuIBieUdeg252FYhYdJREXhft3D0LoVr5xvwz1vR+STRLmpGCOAA
         PKz6I0X2iUoCOL/WPwMnc2VQtbAVOU2srn5/L2OgqK+GhP3oplIlJqa/RfvW3qJZ2A
         KH1U9v+N9xxqf+68vMjwBx+8b7ae+j8R5NZXpmpECdu0WwYr8QaekA6+XgW42LyJjZ
         6fPtI02hDQX55+5ZcQIFojGIS0P+EFP1hXVUsHEgyt5bQ56hdK/rTYb/vnHgfZCGpz
         MnGLtFnsx5JxA==
Date:   Tue, 31 Jan 2023 09:15:52 +0000
From:   Lee Jones <lee@kernel.org>
To:     Jacky Bai <ping.bai@nxp.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de,
        dmitry.torokhov@gmail.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-rtc@vger.kernel.org, kernel@pengutronix.de,
        linux-imx@nxp.com, festevam@gmail.com
Subject: Re: [PATCH v4 1/4] dt-bindings: mfd: Add nxp bbnsm
Message-ID: <Y9jcSDGAlOHfBQ64@google.com>
References: <20230129070823.1945489-1-ping.bai@nxp.com>
 <20230129070823.1945489-2-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230129070823.1945489-2-ping.bai@nxp.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sun, 29 Jan 2023, Jacky Bai wrote:

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

Applied, thanks

-- 
Lee Jones [李琼斯]
