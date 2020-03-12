Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F51C183D36
	for <lists+linux-rtc@lfdr.de>; Fri, 13 Mar 2020 00:20:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbgCLXUt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 12 Mar 2020 19:20:49 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:36793 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726871AbgCLXUt (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 12 Mar 2020 19:20:49 -0400
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 9EE54240002;
        Thu, 12 Mar 2020 23:20:46 +0000 (UTC)
Date:   Fri, 13 Mar 2020 00:20:46 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     mripard@kernel.org, wens@csie.org, robh+dt@kernel.org,
        a.zummo@towertech.it, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 1/2] rtc: sun6i: Make external 32k oscillator optional
Message-ID: <20200312232046.GB3384@piout.net>
References: <20200308135849.106333-1-jernej.skrabec@siol.net>
 <20200308135849.106333-2-jernej.skrabec@siol.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200308135849.106333-2-jernej.skrabec@siol.net>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 08/03/2020 14:58:48+0100, Jernej Skrabec wrote:
> Some boards, like OrangePi PC2 (H5), OrangePi Plus 2E (H3) and Tanix TX6
> (H6) don't have external 32kHz oscillator. Till H6, it didn't really
> matter if external oscillator was enabled because HW detected error and
> fall back to internal one. H6 has same functionality but it's the first
> SoC which have "auto switch bypass" bit documented and always enabled in
> driver. This prevents RTC to work correctly if external crystal is not
> present on board. There are other side effects - all peripherals which
> depends on this clock also don't work (HDMI CEC for example).
> 
> Make clocks property optional. If it is present, select external
> oscillator. If not, stay on internal.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/rtc/rtc-sun6i.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
