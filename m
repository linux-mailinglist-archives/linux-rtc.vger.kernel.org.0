Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 961E7617A5
	for <lists+linux-rtc@lfdr.de>; Sun,  7 Jul 2019 23:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727636AbfGGVQv (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 7 Jul 2019 17:16:51 -0400
Received: from pandora.armlinux.org.uk ([78.32.30.218]:60978 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727635AbfGGVQv (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 7 Jul 2019 17:16:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=yBJq5Ze/fLFnGGY0OtJXfuo/anPBio5I7UZyN74kJ+w=; b=LgzZ2myH3634MDhRCVqM32lba
        y4QSZywjbABEU7/ebwgwbqwqbFGsjuJS2GJGjG2Ok3fe2Iy4Up/ScbB6tX6hUJcuWYZt/pQQWJQkm
        NF5ypvBiqMh0w7BMjsHhe+P24LxHlUJro+VFPkP1kSo0GLcZ3nB/Bu8tqr8eqlCbhLoKfvIcU/xMQ
        fFqqLtl1NaieMQP3U95tGv9iI4sSMjV+rmSy45RjUeYQFthXaP7Qc7DUJ1e9CLIonRfrV/PpUmY3t
        IeSuAH3x+T+Bae4iT83ZLG3T2vNB3dYwqEGWL2vz2uCYSQvaYehUzwlb1oiGQtkelKvRT0P2PKmul
        jzARukAxg==;
Received: from shell.armlinux.org.uk ([2001:4d48:ad52:3201:5054:ff:fe00:4ec]:59266)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1hkEWb-0007lG-I8; Sun, 07 Jul 2019 22:16:45 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1hkEWU-0001Oh-Nd; Sun, 07 Jul 2019 22:16:38 +0100
Date:   Sun, 7 Jul 2019 22:16:38 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Markus Elfring <Markus.Elfring@web.de>
Cc:     linux-rtc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rtc: stm32: One function call less in
 stm32_rtc_set_alarm()
Message-ID: <20190707211638.sehikkear25dffah@shell.armlinux.org.uk>
References: <f04277da-8a98-473e-2566-ac7846f9f8e1@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f04277da-8a98-473e-2566-ac7846f9f8e1@web.de>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Fri, Jul 05, 2019 at 10:17:11PM +0200, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 5 Jul 2019 22:10:10 +0200
> 
> Avoid an extra function call by using a ternary operator instead of
> a conditional statement.

... and a totally pointless use of the ternary operator.

> @@ -519,11 +519,7 @@ static int stm32_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
>  	/* Write to Alarm register */
>  	writel_relaxed(alrmar, rtc->base + regs->alrmar);
> 
> -	if (alrm->enabled)
> -		stm32_rtc_alarm_irq_enable(dev, 1);
> -	else
> -		stm32_rtc_alarm_irq_enable(dev, 0);
> -
> +	stm32_rtc_alarm_irq_enable(dev, alrm->enabled ? 1 : 0);

If we look at stm32_rtc_alarm_irq_enable():

static int stm32_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
{
...
	if (enabled)
		do A;
	else
		do B;
...
}

alrm->enabled is an unsigned char.  So, the above can be simplified to:

	stm32_rtc_alarm_irq_enable(dev, alrm->enabled);

without any need what so ever to use the ternary operator.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
