Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16C2A6F0E6D
	for <lists+linux-rtc@lfdr.de>; Fri, 28 Apr 2023 00:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344227AbjD0WnS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 27 Apr 2023 18:43:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbjD0WnR (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 27 Apr 2023 18:43:17 -0400
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::223])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7A361BDC
        for <linux-rtc@vger.kernel.org>; Thu, 27 Apr 2023 15:43:16 -0700 (PDT)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id BF5A760006;
        Thu, 27 Apr 2023 22:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1682635395;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=085dZEsvlKZdj52YEthFMTr8nW7rhNtDUSy7epeEMGA=;
        b=P8LjO46HPFj851psdndP98IkDJN6psKp9Wx+YzinGIWr5hOcLFcJ5yL/VXO8MyjaWXL2ae
        X6u6RuCVqxL41fChEEc2eKhJO6k+oxdNPx0vZQfCvWN26WIl9Ns8PUPdnLse1VCi2g+DP3
        Luos4m8MOo06SMr0c4JvCZ6jpKk4X++s9/NJz4J0gvZO5G73z5k0HhLIawCB8Br2nlGdRH
        a641Yv3sbkidEn9n1Ruz48+4QLMDA1nys+VBT8yQ8syLyHPT9KlanvHVngfCAKJnVf7Wc5
        RuUT86giYXO5W3WxpmH+qZlo2w1k0qa9O7vK6AApHJAics9vlDVQW1DiyGNyrg==
Date:   Fri, 28 Apr 2023 00:43:14 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Lars-Peter Clausen <lars@metafoo.de>
Cc:     Paul Cercueil <paul@crapouillou.net>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: jz4740: Make sure clock provider gets removed
Message-ID: <168263537543.79851.7243339932183111165.b4-ty@bootlin.com>
References: <20230409162544.16155-1-lars@metafoo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230409162544.16155-1-lars@metafoo.de>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


On Sun, 09 Apr 2023 09:25:44 -0700, Lars-Peter Clausen wrote:
> The jz4740 RTC driver registers a clock provider, but never removes it.
> This leaves a stale clock provider behind that references freed clocks when
> the device is unbound.
> 
> Use the managed `devm_of_clk_add_hw_provider()` instead of
> `of_clk_add_hw_provider()` to make sure the provider gets automatically
> removed on unbind.
> 
> [...]

Applied, thanks!

[1/1] rtc: jz4740: Make sure clock provider gets removed
      commit: 4fee39815aafd68ebc6a71b1b1b5d63f0ddde671

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
