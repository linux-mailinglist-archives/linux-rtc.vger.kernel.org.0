Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18428186A01
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2020 12:24:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730738AbgCPLYR (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 16 Mar 2020 07:24:17 -0400
Received: from pandora.armlinux.org.uk ([78.32.30.218]:49842 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730734AbgCPLYR (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 16 Mar 2020 07:24:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=y8G04rfoWKUYzwsoZKQ5OhBejLp6XViSQs7CrSOGTTM=; b=faw7oWA9PeRP5tE0NxZu6Ae69
        ALbTYfZYMc/tDDu7yWb2uKEGnzTwABdSYzR7JInOVhXdKmP1u4ZlaVgFYI/Ebe1GBaWzwsK3RIOwN
        CzsPoCLYHOAWPiqKy67VxvfyJxJoMsV0mG8ycjXH2Cegk75D6qilj0DJatUzt1RIIEGnQZbT+4lty
        XGWzg+PXBEU08Tc7xPKkaoTM8YzESxwh0UKhzrgpYi8t0+41dZPtLPK3aNKqr9Pg1/ENqyD/YZA8r
        Sc5Q02sRfSdjuWfol0uBSOHQA0ZCwu+hMVgBN81KZL+7QvccD01s1rhw9Jt+bERARCTpJztK2p4sk
        kHuEXGswQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37186)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1jDnqp-0000e3-Ef; Mon, 16 Mar 2020 11:24:07 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1jDnqn-0001mN-BG; Mon, 16 Mar 2020 11:24:05 +0000
Date:   Mon, 16 Mar 2020 11:24:05 +0000
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Eddie Huang <eddie.huang@mediatek.com>,
        Sean Wang <sean.wang@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-rtc@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] rtc: mt2712: fix build without PM_SLEEP
Message-ID: <20200316112405.GN25745@shell.armlinux.org.uk>
References: <20200316104701.209293-1-alexandre.belloni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200316104701.209293-1-alexandre.belloni@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Mar 16, 2020 at 11:47:00AM +0100, Alexandre Belloni wrote:
> Move SIMPLE_DEV_PM_OPS out of #ifdef to fix build issues when PM_SLEEP is
> not selected.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  drivers/rtc/rtc-mt2712.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-mt2712.c b/drivers/rtc/rtc-mt2712.c
> index 432df9b0a3ac..c2709c1602f0 100644
> --- a/drivers/rtc/rtc-mt2712.c
> +++ b/drivers/rtc/rtc-mt2712.c
> @@ -394,10 +394,10 @@ static int mt2712_rtc_resume(struct device *dev)
>  
>  	return 0;
>  }
> +#endif

Maybe use __maybe_unused for these, so they can still be compile-tested
rather than #if'd out?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 10.2Mbps down 587kbps up
