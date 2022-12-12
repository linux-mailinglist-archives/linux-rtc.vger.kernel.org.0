Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4813649B17
	for <lists+linux-rtc@lfdr.de>; Mon, 12 Dec 2022 10:26:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231887AbiLLJZ5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 12 Dec 2022 04:25:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231896AbiLLJZQ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 12 Dec 2022 04:25:16 -0500
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [IPv6:2001:4b98:dc4:8::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F30471082;
        Mon, 12 Dec 2022 01:25:13 -0800 (PST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 5B15610002E;
        Mon, 12 Dec 2022 09:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1670837111;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=Je1iY0lXabUo9gCajH0uXmuKCO003lsGJMV9wUOFG7I=;
        b=pBSDa9WGI6xjH0UMlfK+wlneLR8H1zndXFa06IVYao6OWBbC6Aa5vhO7y6c5IMIHPeyfwD
        eP3kaDBlbKyvkE/Hju/t0NAtUllUZ/wkzQ9BH/quE6Ih2oZs869YhLn9GR2jakvrWlk8Kv
        U6CyO3O42FXUkxeHiL2GgLCretFS4GjDOh9vs1Zu48RFWk7g+4PAQR4fbg4ifrcdhLnliX
        euRxGDem2ok433xPSatgkMKjEpem9aBwEGKoeunEAfvBBBWK41m1CUkopTovfaYfFTtMPM
        3KylVAmAa+Pfa3GiyhGCWZBJRdADkCktcrm52oxpuZgoLlp/cxNYZaiW2CRgTA==
Date:   Mon, 12 Dec 2022 10:25:02 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-rtc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: [PATCH v3 1/2] dt-bindings: rtc: m41t80: Convert text schema to
 YAML one
Message-ID: <167083708401.129214.8786081118168125199.b4-ty@bootlin.com>
References: <20221211205124.23823-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221211205124.23823-1-marex@denx.de>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Sun, 11 Dec 2022 21:51:23 +0100, Marek Vasut wrote:
> Convert the m41t80 text schema to YAML schema.
> 
> Add "#clock-cells" requirement, which is required by clock-output-names.
> 
> 

Applied, thanks!

[1/2] dt-bindings: rtc: m41t80: Convert text schema to YAML one
      commit: 3e39f7971d75cafe1c90dec60526ad45484657c0
[2/2] dt-bindings: rtc: m41t80: Mark the clock: subnode as deprecated
      commit: b279e3276c247a060ca73784e6655472b74c3f27

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
