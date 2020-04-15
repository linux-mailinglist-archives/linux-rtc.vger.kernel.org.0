Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB7D41AAE8F
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Apr 2020 18:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404596AbgDOQoL (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 15 Apr 2020 12:44:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404537AbgDOQoK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 15 Apr 2020 12:44:10 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45326C061A0C
        for <linux-rtc@vger.kernel.org>; Wed, 15 Apr 2020 09:44:10 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1jOl8x-0000F4-PX; Wed, 15 Apr 2020 18:44:07 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1jOl8x-0004xT-0R; Wed, 15 Apr 2020 18:44:07 +0200
Date:   Wed, 15 Apr 2020 18:44:06 +0200
From:   Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Bastian Krause <bst@pengutronix.de>
Cc:     linux-rtc@vger.kernel.org, Marek Vasut <marex@denx.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, Arnaud Ebalard <arno@natisbad.org>,
        Rob Herring <robh+dt@kernel.org>, kernel@pengutronix.de
Subject: Re: [PATCH 2/3] dt-bindings: rtc: add chargeable flag for rx8130
Message-ID: <20200415164406.s755z5byq5f4fkv7@pengutronix.de>
References: <20200415163701.21989-1-bst@pengutronix.de>
 <20200415163701.21989-2-bst@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200415163701.21989-2-bst@pengutronix.de>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, Apr 15, 2020 at 06:37:00PM +0200, Bastian Krause wrote:
> Signed-off-by: Bastian Krause <bst@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/rtc/rtc-ds1307.txt | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt b/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
> index 66f0a31ae9ce..987a0c9e0cd7 100644
> --- a/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
> +++ b/Documentation/devicetree/bindings/rtc/rtc-ds1307.txt
> @@ -34,6 +34,9 @@ Optional properties:
>  - trickle-diode-disable : ds1339, ds1340 and ds 1388 only
>  	Do not use internal trickle charger diode
>  	Should be given if internal trickle charger diode should be disabled
> +- aux-voltage-chargeable: rx8130 only
> +	Epsons's rx8130 supports a backup battery/supercap.

s/Epsons's/Epson's/

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |
