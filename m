Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5844477EDC2
	for <lists+linux-rtc@lfdr.de>; Thu, 17 Aug 2023 01:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243898AbjHPXSH (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 16 Aug 2023 19:18:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347196AbjHPXSB (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 16 Aug 2023 19:18:01 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34E481FD0
        for <linux-rtc@vger.kernel.org>; Wed, 16 Aug 2023 16:18:00 -0700 (PDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 62EFF240004;
        Wed, 16 Aug 2023 23:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1692227879;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=DTK6bsIqn4ZGQZjAlF63qlO97J5/XXESqsvFRE7PONM=;
        b=Jnlh3ZPTKCzDF1Tei2h9E1G6CGQ5gVyYQu9U/MLTd8T+w7wIh3N16/eLaYMx2hjvT99ZbQ
        95NVASk7ECc3WAIKDB4Egj29k+Ewj8KeGtyt7D7FEAnfRLloPk2nMr6fSleIlgbDhnxNmD
        KmVzy5AKXWIW8dUmicMRm3JM72Vwz/iipl5ltot6i9cwYbl5PejUsrbAHXQ5sJJG4rZM0+
        rGDxHk0jdfWUtjO+MkNRtMA3M6/XskWRzwz3X3jlrt4mCE+omlLlHT2vnpIvHLUC6N+KCc
        kryH/MlQsBHaZ/Ic69hwnDTVvF1jbfY7zajix4eImYBOqUxZOKJ/rmLDyuq6Jg==
Date:   Thu, 17 Aug 2023 01:17:57 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     a.zummo@towertech.it, linux-rtc@vger.kernel.org,
        Ruan Jinjie <ruanjinjie@huawei.com>
Subject: Re: [PATCH -next 0/2] rtc: Do not check for 0 return after calling
 platform_get_irq()
Message-ID: <169222786063.126677.5455177139612552555.b4-ty@bootlin.com>
References: <20230803080713.4061782-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230803080713.4061782-1-ruanjinjie@huawei.com>
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


On Thu, 03 Aug 2023 16:07:11 +0800, Ruan Jinjie wrote:
> Since commit a85a6c86c25b ("driver core: platform: Clarify that
> IRQ 0 is invalid"), there is no possible both for platform_get_irq()
> to return 0.
> 
> And the return value of platform_get_irq() is more sensible
> to show the error reason.
> 
> [...]

Applied, thanks!

[1/2] rtc: omap: Do not check for 0 return after calling platform_get_irq()
      commit: 4d349a5793f7a42da27ea56d9f6e2f9488d44e0d
[2/2] rtc: tps65910: Remove redundant dev_warn() and do not check for 0 return after calling platform_get_irq()
      commit: dac7837848485bf1d0bd3aa56923f8bf5075682f

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
