Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFC701AB105
	for <lists+linux-rtc@lfdr.de>; Wed, 15 Apr 2020 21:10:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441538AbgDOTIb (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 15 Apr 2020 15:08:31 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:44107 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1416887AbgDOS4M (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 15 Apr 2020 14:56:12 -0400
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 0D37E200002;
        Wed, 15 Apr 2020 18:56:09 +0000 (UTC)
Date:   Wed, 15 Apr 2020 20:56:09 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Bastian Krause <bst@pengutronix.de>
Cc:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>,
        Arnaud Ebalard <arno@natisbad.org>,
        Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 2/3] dt-bindings: rtc: add chargeable flag for rx8130
Message-ID: <20200415185609.GP34509@piout.net>
References: <20200415163701.21989-1-bst@pengutronix.de>
 <20200415163701.21989-2-bst@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415163701.21989-2-bst@pengutronix.de>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 15/04/2020 18:37:00+0200, Bastian Krause wrote:
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
> +	This flag tells	whether the battery/supercap is chargeable or not.
>  

I think we should make that a generic property and this should supersede
trickle-diode-disable which is a bit wonky as I would prefer the default
to be disabled instead of enabled with the current semantics.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
