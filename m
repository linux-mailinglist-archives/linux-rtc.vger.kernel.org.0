Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D208777ED75
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Aug 2023 00:54:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347040AbjHPWyM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 16 Aug 2023 18:54:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346679AbjHPWxu (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 16 Aug 2023 18:53:50 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 742112698
        for <linux-rtc@vger.kernel.org>; Wed, 16 Aug 2023 15:53:48 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E13431BF204;
        Wed, 16 Aug 2023 22:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1692226427;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ZkA52x5JxaZ+AT2nw9BymX9U93LFxgF/xY18z1ou/7o=;
        b=YP8Gbc4+kQnxNs/whubTSuO1BfjExnUHrt8H2hCwLvPv9dpg9ZhsqVWSZg9pu+n6thlHfC
        jAtf/oATcAtVkDUFPxab4Swp5mACCMjPowQsKN8kjYWkaOjm8HB+mug/I242fQ+heDqnNE
        oavPMFXXBOWJVzGA0nlDWXTXUptkcYSzvUxpaoEdYugQXaOLn6aE+m66AshC5qZU95uZh8
        4Xq+/xUf1tu9e/WkvI7uSJipKsmPsYn/hXQ0lbW3zc+ZJZTqWsCe530SB7PgTZo9o4f0Hs
        EjMgpF3HRgDS8XZIXCOLgui6gwdUTJmfUXhwFVFvq8kZA7ZConmyv7BORBWtbg==
Date:   Thu, 17 Aug 2023 00:53:44 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     a.zummo@towertech.it, Nathan Chancellor <nathan@kernel.org>
Cc:     mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        arnd@arndb.de, linux-rtc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, patches@lists.linux.dev
Subject: Re: [PATCH] rtc: stm32: Use NOIRQ_SYSTEM_SLEEP_PM_OPS()
Message-ID: <169222639035.110507.11805270756093172176.b4-ty@bootlin.com>
References: <20230815-rtc-stm32-unused-pm-funcs-v1-1-82eb8e02d903@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230815-rtc-stm32-unused-pm-funcs-v1-1-82eb8e02d903@kernel.org>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org


On Tue, 15 Aug 2023 15:16:41 -0700, Nathan Chancellor wrote:
> After the switch to SET_NOIRQ_SYSTEM_SLEEP_PM_OPS() and a subsequent
> fix, stm32_rtc_{suspend,resume}() are unused when CONFIG_PM_SLEEP is not
> set because SET_NOIRQ_SYSTEM_SLEEP_PM_OPS() is a no-op in that
> configuration:
> 
>   drivers/rtc/rtc-stm32.c:904:12: error: 'stm32_rtc_resume' defined but not used [-Werror=unused-function]
>     904 | static int stm32_rtc_resume(struct device *dev)
>         |            ^~~~~~~~~~~~~~~~
>   drivers/rtc/rtc-stm32.c:894:12: error: 'stm32_rtc_suspend' defined but not used [-Werror=unused-function]
>     894 | static int stm32_rtc_suspend(struct device *dev)
>         |            ^~~~~~~~~~~~~~~~~
>   cc1: all warnings being treated as errors
> 
> [...]

Applied, thanks!

[1/1] rtc: stm32: Use NOIRQ_SYSTEM_SLEEP_PM_OPS()
      commit: 2cf2a1acc6ebdffc6363de9156db8737f33c1803

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
