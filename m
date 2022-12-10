Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 087C36490D9
	for <lists+linux-rtc@lfdr.de>; Sat, 10 Dec 2022 22:38:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbiLJViY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 10 Dec 2022 16:38:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiLJViY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 10 Dec 2022 16:38:24 -0500
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 563D113D19
        for <linux-rtc@vger.kernel.org>; Sat, 10 Dec 2022 13:38:22 -0800 (PST)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id 82D89E0003;
        Sat, 10 Dec 2022 21:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1670708300;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=R320RWEiCZwg6H1KDxv4QHqIdEho1W3k7eteFaGSq0g=;
        b=cIp0UOLB56gBrCS2eUC3724/k5+pbYa1WquunD4PR8PFosMnPsxjhzfFycg8b1dFtRezMe
        DKSStbPO81sMzFLXUXiZq5qqPeOiX+Kky65DE3gYeHTEYUZTMDbz7x6XTxWqYk082kbmqA
        MUcIqrQf6WkCewdzSS9RXPgYz2hh2yHL5/hH0sa07+fizGUV2ZuBQjEsGLkMwX+csNW7sV
        KpPGc66zb8v7u8BRCDQqS6vrBCjMhjIMpylGeb+wMWuFuRyafNYJ5ESwqR2xkqqiNypUy4
        ufeb9OrFr+0Hhoz+pnsCshcqi8XpmzEhNVbnCcjbfTEiwP6MjBFuwsvXYee/Mw==
Date:   Sat, 10 Dec 2022 22:38:18 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Gaosheng Cui <cuigaosheng1@huawei.com>,
        patrice.chotard@foss.st.com, a.zummo@towertech.it,
        lee.jones@linaro.org
Cc:     linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] rtc: st-lpc: Add missing clk_disable_unprepare in
 st_rtc_probe()
Message-ID: <167070826404.276368.13396623820724610984.b4-ty@bootlin.com>
References: <20221123014805.1993052-1-cuigaosheng1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221123014805.1993052-1-cuigaosheng1@huawei.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 23 Nov 2022 09:48:05 +0800, Gaosheng Cui wrote:
> The clk_disable_unprepare() should be called in the error handling
> of clk_get_rate(), fix it.
> 
> 

Applied, thanks!

[1/1] rtc: st-lpc: Add missing clk_disable_unprepare in st_rtc_probe()
      commit: 5fb733d7bd6949e90028efdce8bd528c6ab7cf1e

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
