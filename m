Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E02672062
	for <lists+linux-rtc@lfdr.de>; Tue, 23 Jul 2019 22:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403899AbfGWUDZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 23 Jul 2019 16:03:25 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:42345 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726384AbfGWUDY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 23 Jul 2019 16:03:24 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 82CF71BF206;
        Tue, 23 Jul 2019 20:03:21 +0000 (UTC)
Date:   Tue, 23 Jul 2019 22:03:21 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tbm@cyrius.com,
        Oliver Hartkopp <socketcan@hartkopp.net>,
        Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH] ARM: kirkwood: ts219: disable the SoC's RTC
Message-ID: <20190723200321.GN24911@piout.net>
References: <20190723194505.28060-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190723194505.28060-1-uwe@kleine-koenig.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 23/07/2019 21:45:05+0200, Uwe Kleine-König wrote:
> The internal RTC doesn't work, loading the driver only yields
> 
> 	rtc-mv f1010300.rtc: internal RTC not ticking
> 
> . So disable it.
> 
> Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
> ---
>  arch/arm/boot/dts/kirkwood-ts219.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/kirkwood-ts219.dtsi b/arch/arm/boot/dts/kirkwood-ts219.dtsi
> index a88eb22070a1..994cabcf4b51 100644
> --- a/arch/arm/boot/dts/kirkwood-ts219.dtsi
> +++ b/arch/arm/boot/dts/kirkwood-ts219.dtsi
> @@ -104,3 +104,11 @@
>  &pcie0 {
>  	status = "okay";
>  };
> +
> +&rtc {
> +	/*
> +	 * There is a s35390a available on the i2c bus, the internal rtc isn't
> +	 * working (probably no crystal assembled).
> +	 */
> +	status = "disabled";
> +};

You could also use the aliases to ensure rtc0 is the s35390a. This would
solve the initial issue.

> -- 
> 2.20.1
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
