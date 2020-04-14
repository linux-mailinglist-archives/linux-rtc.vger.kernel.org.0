Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C85381A7C06
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Apr 2020 15:13:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729714AbgDNNNC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 14 Apr 2020 09:13:02 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:11223 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728853AbgDNNNB (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 14 Apr 2020 09:13:01 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 98D6224000E;
        Tue, 14 Apr 2020 13:12:55 +0000 (UTC)
Date:   Tue, 14 Apr 2020 15:12:55 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Claudiu.Beznea@microchip.com
Cc:     a.zummo@towertech.it, robh+dt@kernel.org, mark.rutland@arm.com,
        Nicolas.Ferre@microchip.com, Ludovic.Desroches@microchip.com,
        tglx@linutronix.de, jason@lakedaemon.net, maz@kernel.org,
        linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] ARM: dts: sam9x60: add rtt
Message-ID: <20200414131255.GK34509@piout.net>
References: <1586536019-12348-1-git-send-email-claudiu.beznea@microchip.com>
 <1586536019-12348-5-git-send-email-claudiu.beznea@microchip.com>
 <20200410222658.GB3628@piout.net>
 <c4d46198-488b-c5d6-2a66-865a16840dc4@microchip.com>
 <20200413104652.GE3628@piout.net>
 <3116d1fc-af96-1e0c-aa07-3b34cbd58209@microchip.com>
 <20200414111600.GE34509@piout.net>
 <a07d841e-efa9-6c01-69e2-0ed33f9759c5@microchip.com>
 <20200414124741.GJ34509@piout.net>
 <ae278226-7616-5306-a8b5-3f937aa6b322@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae278226-7616-5306-a8b5-3f937aa6b322@microchip.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 14/04/2020 13:05:03+0000, Claudiu.Beznea@microchip.com wrote:
> >>> But this is very unlikely to happen because this would be limited to a
> >>> single board device tree instead of impact every sam9x60 based boards.
> >>
> >> Very unlikely but a having a patch with diff like this:
> >>
> >> +&gpbr {
> >> +     status = "okay";
> >> +};
> >> +
> >> +&rtt {
> >> +     atmel,rtt-rtc-time-reg = <&gpbr 0x0>;
> >> +     status = "okay";
> >> +};
> >> +
> >>
> >> and reverting it may affect the other users of gpbr in sam9x60ek.dts.
> >>
> > 
> > Again, this affects only sam9x60ek.dts instead of possibly multiple DTs
> > that may be out of tree. So the risk of doing that is null.
> 
> Anyway... I'll merge it although I don't consider is the right way.
> 

Do as you wish but a board DT change mixed with a dtsi is a no go.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
